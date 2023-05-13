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
---------


## What I'm working on now
* There is some weird bug with sorting

* Implementing the BLoC pattern
  * [Documentation](https://bloclibrary.dev/) for bloc
    * I think first thing I'm going to try and follow the authentication with firebase tutorial
      * Authentication repository
        * This is a package within my project so as to really encapsulate it. As a package it has it's own pubspec and it's imported into the file that it's used in
        * stuff I didn't follow exactly
          * It looks like now it wants me to integrate google_sign_in but I don't think I want to do that rn
          * I skipped the override_dependencies section of one of the pubspec.yaml files
      * App
        * the root app has a repository provider to provide the authentication repository, but it also gives that repository to the AppBloc
          * I don't really understand what a "repository" is
        * Stuff I have to do
          * I will need to add the AppBlocObserver class
          * I will also need to finish the AppView class creation
      * App Bloc
        * Apparentaly each file constitutes it's own library and you can use the "part" and "part of" keywords to extend that library across several files. It had me do this with the app bloc, app bloc state, and the app bloc event.
      * Models
        * Got all these in place in their own package called login_form_inputs. The Formz package could be really useful in the future
        * Email
      * Now onto the login and sign-up folders
        * I've just gone through and copied them exactly how they stand in the tutorial
      * Having gone through the tutorial, now I just need to hook up the rest of my app to it
        * for sign-out, I'm going to need to reach out to the authentication_repository. How have I done that before?
          * I interact with the BLoC with context.read<AppBlock>().add(const AppLogoutRequested());
        * Now I need to somehow provide the user.uid to the planning page so I can just get this thing running
          * I got it from the AppBloc in a super janky way. 
      * I believe I've gotten the authentication working, but now I need to start restructuring the data
      * Felix Angelov uses some directory structure that I don't understand but I'm interested in
        * It seems like he structures every part of the app like it's a mini package. This rings a bell to when they were talking about mini-libraries in the libraries tutorial
          * I wonder if I could look up this developer and see his philosophy
            * Found his medium page where he talks about firebase login and he mentions a VSCode bloc plugin which I installed
        * I found some other medium article about how this is a feature based folder structure
        * I think the feature based folder structure sounds appealing so that features act like mini packages.
        * though, where do I put models that will be used globally?
          * He might be putting them in packages
          * in [this](https://www.youtube.com/watch?v=ulbY6QcVzzI) live coding thing, he also puts models into feature folders. I guess it would depend on what the model pertains to.
        * I'm going to attempt to rearrange my directories as feature based
          * lib directories
            * App
              * I followed his lead and I'll use Flow_Builder to manage my navigation
            * Login
            * Home 
              * essentially to switch between the 3 main views
            * Endeavors
            * Tasks
            * Calendar
          * Then I will make an EndeavorDataRepository to get streams of endeavor app specific models
            * Do I need to do another package to just interact with firebase or should that be done in the EndeavorDataRepository?
  * [documentation](https://dart.dev/tutorials/language/streams) for streams

* Sub-Endeavors
  * So each user will have a primaryEndeavors list that says which endeavors will show in the main endeavors list DONE
  * Clicking on a primary endeavor takes you to an Endeavor View (got the view up, no content though)
    * Task list/editor DONE
    * make it scrollable
    * Plan option
    * Title DONE
    * color
      * I got color in, but now it only works for endeavor blocks, how could I get that data for tasks and events as well?
        * This might be a good chance to restructure data to be more efficient rather than just patching holes
    * Sub-Endeavors DONE



  * Tasks
    * In the tasks list
      * I could make collapsable lists within collapsable lists
  
