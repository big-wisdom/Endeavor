# endeavor


A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# Endeavor
I always ache for this centralized thing or place to which I can turn. Almost like a wizards wand or JARVIS for Iron Man or Joseph Smiths seer stone. I think increasingly smart phones have become that thing for everyone. I want to build an ecosystem of applications that help structure my life.

This application is supposed to be kinda the center of that. This is where I will manage my time and therefore my life.

The core concept is that of an Endeavor. This was born out of the idea that we don't do each individual task for it's own sake. We're always working toward something bigger. The endeavor is a way to put a name to that thing your working toward. In fact, every moment of every day, sleeping or waking, you could think of yourself as engaged in some endeavor. Sleeping, you're working toward your health, working, you're building a career or supporting yourself and loved ones, watching T.V. you're relaxing or learning. Great philosophers of the past all grappled with time management and now that we most need that philosophy, we've relagated time management to just a chore.

When asking myself what I needed to do, I used to go through the major things in my life. Church, School, Work and I'd covered everything for all of those, I felt sure that I wasn't leaving out something important and that nagging voice in the back of my head went away.


## Ecosystem
Eventually, this app will contain much of the central data for other important applications. For example, this app will contain the info for exactly how much time you plan to spend working for the next month. That data, combined with your hourly rate contains the income half of your budget. These two apps will need to be deeply linked.

I believe this means that I will need to use a router?


## 15 minutes
I always envision this plan of building it little bits at a time so that over the course of the next two years it comes together. But I only ever put 15 minutes toward it and then start fresh again.



This could be a **documentation problem**.



Forgetting what’s going on with the project is huge. Something that takes 5 minutes to read that gets me back up to date on the project could allow me to spend the other 10 on the project itself.



So now this README.md is the central documentation for me to review what's going on in the project and get myself back up to speed.


## Server
If I could have a centralized server where the data models run, I could make all sorts of client side apps that access the central data. 

## Tools
Front end: flutter
Back End: Firebase
* Firebase CLI
* flutterfire CLI

## Notes for later

### What kind of tool do I want?
* I kinda like the idea of a progressive tool. One that can be used for the simplest use case. In this case just a to-do list and you can add in whatever fancy features you want for the given task.
* The opposing point of view is making a super powerful tool that you have to LEARN learn like the Adobe applications.
* Maybe instead of flows like turbotax, I could use the photoshop model of a giant array of tools


## Task Brainstorming
* Endeavor Blocks
* Tasks with duration
* Assign tasks to endeavors
* Auto Plan

* An endeavor brain to enforce continuity of planning
    * I could make building this planning thing my first use case.

* In physics there's this concept of de-dimensionalizing. Or rather, usefulizing units. You could understand your time in units of time/rent-payment by dividing time up into units of amount of time you have to work to pay for rent. Then a useless number, like an "8-hour" shift becomes a useful number. Like if rent is $700 and you make $13/hour, then 54 hours is one rent payment. So your shift is about 1/7th of a rent payment. Or if a meal is $20, then an 8-hour shift is a 5-meal shift which is an "eat for almost two days" shift. You could even average how much you spend per day from your budget and measure how much you make compared to that. You could make a unit that is (% of monthly expenses), like if you spend $1200/month, your % unit would be $12. Then an 8 hour shift would be about an 8% shift.

* the concept of a repeating endeavor block as an endeavor block generator is interesting. Just thinking of generators is interesting. What generates endeavors? What generates tasks? a generator could be an API that I reach out to to get new tasks like Canvas or something

-------
## UI Notes
* NAVIGATION BAR: So I'm thinkin that the bottom selector might be a [NavigationBar](https://api.flutter.dev/flutter/material/NavigationBar-class.html) bar that goes into the [Scaffold's](https://api.flutter.dev/flutter/material/Scaffold-class.html) bottomNavigationBar property
----------

## Calendar View Notes
* I found [this](https://github.com/Skyost/FlutterWeekView/blob/master/lib/src/widgets/week_view.dart) package out there, and I think I could either use and fork it or learn from it to make my own from scratch. I'm tempted to make it from scratch because I would need so much freedom with it. 

### Use then Fork
* I could set my blocks as just events at first then just schedule things next to them.
* Then eventually I could figure out how to color the background.

### From Scratch
* So it looks like he does a horizontal Listview where each takes up a whole screen and custom physics to snap to the nearest day. I'd like to fit 3 days on the screen like google calendars. 
* Then each List item must be a scroll view where you can see the whole day.
--------------

## Notes for future
* There are annoying logs every time I run an https function. if I add (app check)[https://firebase.google.com/docs/app-check/monitor-functions-metrics] then supposedly it will stop doing that
* How to switch back to emulators
  * uncomment code in main
  * start local emulators using firebase emulators:start
  * delete app from emulator
  * rerun app in emulator
---------


## What I'm working on now
* Events and repeating events
  * Creation screen is looking good and create button is working
  * get the events to show on the calendar
    
  * get editing the events to work


--------
## Plan before giving to katie and jacob
* Colors
* color change when scheduled
* cross off TODO's
* when in month view and you click a day, to to that day, not monday
--------------------------
* sub endeavors
* due dates
  * priority queue by work per day would probably be the implementation of this
