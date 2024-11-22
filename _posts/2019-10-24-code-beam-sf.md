---
layout: post
title: Code Beam San Francisco countdown
date: 2019-10-24T17:00:00.000+00:00
categories:
- erlang conferences

---
The conference is happening on Thu, 5 Mar 2020 – Fri, 6 Mar 2020.

_Countdown to code beam SF_ :

{% raw %}
<div id="countdown"></div>
{% endraw %}


<script>
// Set the date we're counting down to
var countDownDate = new Date("March 5, 2020 02:00:00").getTime();

// Update the count down every 1 second
var x = setInterval(function() {

// Get today's date and time
var now = new Date().getTime();

// Find the distance between now and the count down date
var distance = countDownDate - now;

// Time calculations for days, hours, minutes and seconds
var days = Math.floor(distance / (1000 * 60 * 60 * 24));
var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
var seconds = Math.floor((distance % (1000 * 60)) / 1000);

// Display the result in the element with id="demo"
document.getElementById("countdown").innerHTML = days + " d " + hours + " h " + minutes + " m " + seconds + " s ";

// If the count down is finished, write some text
if (distance < 0) {
clearInterval(x);
document.getElementById("countdown").innerHTML = "EXPIRED";
}
}, 1000);
</script>
