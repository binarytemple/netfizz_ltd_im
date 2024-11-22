---
layout: post
title: CLI metrics with the zsh shell
date: 2019-07-09T08:19:12.000+00:00
categories: zsh grafana time metrics prometheus
comments: true
images:
- images/@stock/blog-3.jpg
- images/@stock/blog-2.jpg

---
I've got a problem - I spend too many hours of the day in front of a computer. I need to better regulate my time.

Lets find a UNIX command line tools way to keep a record of my hours...

There are a couple of things that I'll presume to be true.

1. If I enter a command in the shell, I've probably been working for a couple of minutes before that.
2. If I enter a shell command every 5 minutes over an hour I'm probably busy working.
3. I can determine work by the bucketed frequency of events - if one event or ten events occur in a minute - I'll just take it as a bool - something or something(s) happened in that time.
4. Spoiler alert, this is going to involve prometheus [gauge](https://prometheus.io/docs/concepts/metric_types/#gauge) type
5. Most of the time series databases have some sort of HTTP interface, or even a simple enough API you can just splurge data over to them using tools like netcat.

## Zsh hooks and their limitations

I want to log the time and exit code of every command I execute in the zsh shell to something that grafana can display as a nice graph showing how busy and how clumsy I'm running.

I'd like to do this in order to regulate my computer use so do too many 60 hour weeks and burnout. I think this is a good life hack. I don't want to install some dodgy app from the app store to do this.

It seems like a simple thing so I've started investigating.

I started off with the idea to install a zsh hook and trap the time and exit code of every command I execute in zsh. But this doesn't seem possible, perhaps by intentional design.

1. I have tried `add-zsh-hook zshaddhistory debugger`
2. I have tried `add-zsh-hook precmd debugger`
3. I have tried `add-zsh-hook preexec debugger`

where the definition of debugger is :

        debugger () {
            echo "result ${?} ${@}"
        }

But to no avail, sure it'll log out the command, and exit code - but it only works for successful commands, not failures.

Conclusion : Zsh hooks don't seem to be useful for CLI metrics.

## Cron and \~/.zsh_history parsing

In any event, I don't like to have too many moving parts around in my shell (I run a tight shell), so the idea occurred to run a cron job every couple of hours, to read the files and send them somewhere as a http or similar simple upload and process the data that way.

If I send the same request twice (ZSH files can be arbitrarily truncated so I'll just run it every hour and hope for the best) - how can I avoid registering a duplicate event? Surely theres a service or time series database (Prometheus, Influx) that does deduplication or has a metric of some sort that I could register to, like a gauge which I could then filter down.

There's a couple of (near) certainties :

1. My \~/.zsh_history list the commands I've executed.
2. Each history line starts with a timestamp.

There's 518 commands in my zsh history (fresh account):

    cat ~/.zsh_history| awk -F";" '/^:/{print $1}' | wc -l
         518

393 of them are exact duplicates (time and command):

    cat ~/.zsh_history| awk -F";" '/^:/{print $1}' | sort -u |wc -l
         393

The preamble  looks like this:

    cat ~/.zsh_history| awk -F";" '/^:/{print $1}' | head -n1
    : 1565390801:0

Which can be parsed into a cleaner unix timestamp like so:

    % cat ~/.zsh_history| sed -n \
       '/^:/{
       s/^:[^0-9]*\([0-9]*\).*/\1/;p;
            }' | head -n1
    1565390801

For completeness, this is the head of that file:

    % cat ~/.zsh_history| head -n1
    : 1565390801:0;kubectl get endpoints

The number of timestamps shrink dramatically without the entropy of the commands. Lets try it again to compare.

    cat ~/.zsh_history| sed -n \
       '/^:/{
       s/^:[^0-9]*\([0-9]*\).*/\1/;p;
            }' | sort -u | wc -l

`275` not bad !

I'm making a presumption here that repeated commands aren't productive, which is a reasonable thing to consider as repeated commands are usually a sign of frustration or attempting to debug something.

But now I'm stuck, what's the simplest way to get them onto a pretty graph?

Ideally I'd like to run a curl command which reads the list of event times on stdin and just sends them somewhere (like a free service).

Let's explore further in part 2 of this post...