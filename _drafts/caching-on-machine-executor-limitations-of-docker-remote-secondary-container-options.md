---
layout: post
categories:
- circleci
- caching
- docker
- executors
date: 01/07/2021 11:36 AM +0000
title: Caching on machine executor/limitations of docker (remote/secondary container)
  options

---
We switched from docker executors to machine executor because 

1\. Docker local you couldn't provide any arguments to the container - container was 3rd party and we needed to pass a flag to indicate whether it should run single or multi node

2\. Docker remote worked great - except the database we attempted to run wouldn't accept connections because it's ports were blocked from being accessed by our test - turns out docker remote is really only intended for building images - not for running services which need to be accessed by the integration test

now - with the machine executor - it doesn't have elixir and erlang installed - so we need to provision them on each test run - which means pulling 200 MB of data (or more) from those servers on every run.

This seems bad for CircleCI and bad for us because 

1\. It adds to circleci bandwidth costs and resource consumption

2\. It slows the tests down and might get rate limited by the repository hosting the erlang and elixir artefacts

Can you offer a solution - ideally something like one of these 

1\. A work around which allows arguments to be supplied to secondary docker containers (I have considered creating our own derivative containers but it seems we'll come back to this again and again and it raises the possibility of getting rate-limited by docker hub/having to create derivative images for every service we depend upon in every possible configuration (which would be a nightmare to manage).

2\. A means to cache or use custom machine executor images so the machine is already set up with correct erlang/elixir dependencies.