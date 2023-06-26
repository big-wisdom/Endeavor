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

* Okay editing repeated events is working pretty good, but now I'm wondering, what if they change the event date? It will offer to change all following. How could I prevent that?
  * I mean right now, it doesn't hurt anything because it doesn't do anything, but this seems like something I should fix

* I end up making a lot of create/edit pages. Some more refined system behind all of these would be good
  * I could have some protocol for when you want to link a create/edit page to a document
  * Or a widget that in some generic way manipulates a list tied to a document
* I saw mentioned once that I might need to turn on windows developer mode

* Implementing the BLoC pattern
  * [Documentation](https://bloclibrary.dev/) for bloc
  * [documentation](https://dart.dev/tutorials/language/streams) for streams
  * Interesting [article](https://medium.com/codechai/effective-bloc-pattern-45c36d76d5fe) that made me think I should switch to stateful widgets for initialization and disposing of BLoCs

---------


## Theorizing
* Maybe every BLoC could be thought of as having two stages, loading data and presenting data

## User Profiles
* Mike
  * Student
  * 20 Years old
  * School is just starting to get really busy and he needs a way to keep track of it all while also managing social life and church duties
* Clark
  * Software Developer
  * 26 Years old
  * Married, New software developer living in a new place
* Mary
  * Teacher
  * 24 Years old
  * Married, New teacher living in a new place
* Amber
  * Marketing lead
  * Entreprenuer
  * Dating
  * 2 kids

## User Stories
* First starting the app, trying to sort out your whole life into endeavors
  * Primary Endeavors View
    * There should be a central brain to plan the overall endeavor structure
    * Create Primary Endeavors
    * Click them to view Endeavor View
    * Click plus to create primary endeavors
  * Endeavor View
    * Endeavor has a brain section to think through structure
    * Show/Edit Endeavor name
    * Show/Edit sub-endeavors
    * Clicking sub-endeavors leads to their endeavor view
    * Clicking back takes you back up the tree of life
* Planning at the begining of a week
* Planning at the begining of a day
* Thinking in an endeavor brain

## What I'm working on now

* EndeavorBlockScreen
  * create a form and all the form inputs for an EndeavorBlock model
    * So far all I've done is move the firestore stuff into a sub-folder of the model folder
    * Make form
    * Make each form input
  * create a bloc for the EndeavorBlock screen
  * extend the form with the state
  * on the EndeavorBlockScreenView turn each input item into it's own widget in a BlocBuilder that plugs into the state


* I'm thinking that I will need to disband the util.dart. Date and time related stuff I will put into a DateAndTimeUtilities package and anything that can be moved into the DataRepository should be. The DataRepository and Endeavor should both depend on the utility package. The Event model formz stuff in particulary will use it in the data repository and the UI of the Endeavor package will need it as well
* Create a RepeatingEventScreen that only has to handle the creation of a repeating event, not editing