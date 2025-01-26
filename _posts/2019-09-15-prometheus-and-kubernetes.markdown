---
layout: post
title:  "Exposing Elixir application metrics using Prometheus"
date:   2019-07-09 08:19:12
categories: prometheus kubernetes elxir
comments: true
images:
  - images/@stock/blog-3.jpg
  - images/@stock/blog-2.jpg
---

## Overview

Exposing Elixir application metrics using Prometheus is pretty simple really - you use a dependency which exposes a HTTP(S) endpoint or write your own. 

Prometheus discovers which nodes are exposing this endpoint by means of kubernetes pod annotations (Prometheus itself is typically installed using helm or you can do it manually).

Prometheus polls a HTTP(S) endpoint - it is not idiomatic to push metrics to Prometheus.

Here’s a reasonable architectural overview - [Production grade Kubernetes Monitoring using Prometheus](https://medium.com/faun/production-grade-kubernetes-monitoring-using-prometheus-78144b835b60)

## Config in a demo project

The [Instrumenter](https://github.com/binarytemple/is_it_up/blob/master/lib/is_it_up/metrics/instrumenter.ex) 

```elixir
defmodule IsItUp.Metrics.Instrumenter do
  use Prometheus.Metric
  alias Prometheus.Metric.{Counter, Histogram, Gauge}
  require Logger
```

The [Exporter](https://github.com/binarytemple/is_it_up/blob/master/lib/is_it_up/metrics/exporter.ex)

```elixir
defmodule IsItUp.Metrics.PlugExporter do
  use Prometheus.PlugExporter
end
```

Initialization at [Application](https://github.com/binarytemple/is_it_up/blob/b29820b09fb4d3fda83ec4cd936bbf554f108372/lib/is_it_up/app.ex#L9-L12) startup :

```elixir
require Prometheus.Registry
Prometheus.Registry.register_collector(:prometheus_process_collector)
IsItUp.Metrics.PlugExporter.setup()
```

Adding to the plug [Pipeline](https://github.com/binarytemple/is_it_up/blob/b29820b09fb4d3fda83ec4cd936bbf554f108372/lib/is_it_up/plug/pipeline.ex#L8) 

```elixir
plug(IsItUp.Metrics.PlugExporter, %{})
```

The path, '/metrics' is [created](https://github.com/binarytemple/is_it_up/blob/b29820b09fb4d3fda83ec4cd936bbf554f108372/lib/is_it_up/plug/root.ex#L17) by the `prometheus_plugs` dependency :

```shell
/metrics - check the status of google.co.uk
```

And the application [dependencies](https://github.com/binarytemple/is_it_up/blob/b29820b09fb4d3fda83ec4cd936bbf554f108372/mix.exs#L47-L50) to make all this happen ? 

```elixir
{:plug_cowboy, "~> 2.1.0"},
{:prometheus_ex, "~> 3.0"},
{:prometheus_plugs, "~> 1.1.5"},
{:prometheus_process_collector, "~> 1.4"},
```

## UML diagrams

Setup sequence

<div class="mermaid">
    sequenceDiagram
    Instrumenter -->> Prometheus : declares custom metrics
    SomeModule   -->> Instrumenter : Instrumenter.http_check(host)
    Instrumenter -->> Prometheus : Gauge.set(number)
</div>

Deployment diagram

<div class="mermaid">
    graph LR
    Module -- generates metrics --> PrometheusEndpoint
    Prometheus -- scrapes --> PrometheusEndpoint(Round Rect)
    Grafana -- queries --> Prometheus
    User -- views --> Grafana
</div>
