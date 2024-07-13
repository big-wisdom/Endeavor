# Endeavor
I always ache for this centralized thing or place to which I can turn. Almost like a wizards wand or JARVIS for Iron Man or Joseph Smiths seer stone. I think increasingly smart phones have become that thing for everyone. I want to build an ecosystem of applications that help structure my life.

This application is supposed to be kinda the center of that. This is where I will manage my time and therefore my life.

When asking myself what I needed to do, I used to go through the major things in my life: church, school, work and I'd covered everything for all of those, I felt sure that I wasn't leaving out something important and that nagging voice in the back of my head went away.

I'm calling each one of those life categories an Endeavor and it's the core concept of this app. An endeavor is a higher abstraction of a task, a lower abstraction than identity, and is designed to bridge them. Ideally, it would help each user to actualize the identity they want and contextualize the things they do.

Great philosophers of the past all grappled with time management and now that we most need that philosophy, we've relagated time management to something gross. 

I want to engage the machinery of the eigenvalue problem as a mathematical approach to time management. The demands of life are the operator, how you live your life is the eigenstate, and I haven't quite figured out the role of the eigenvalue. The eigenvalue likely has something to do with how this week impacts the following weeks.

## High Level Overview
User data is stored entirely in Firebase and streamed to a front end Flutter mobile app on Android or iOS.

This Flutter project consists of several packages. The app itself is contained in the Endeavor package. The AuthenticationRepository package exposes a User stream that the Endeavor package uses to manage authentication state. Once authenticated, the Endeavor app uses the DataService package to query Firebase for streams of the data types defined in the ServerDataModels package. Those streams are passed into a DataRepository which turns normalized streams of data from Firebase into the types defined in the DataModel package which the Endeavor package understands. When the user interacts with the Endeavor app, it will use the DataService API to affect the data stored in Firestore which will in turn be streamed back down through the DataService, through the DataRepository, back to the Endeavor App.

Front end:
* Flutter
* BLoC Architecture
* Models extend Equatable
* Forms made with Formz

Back End: Firebase
* Firebase
  * With Firebase CLI
* flutterfire CLI

### Philosophy
1. __Objects should be what they're called__. This comes from the annoyance that I've encountered when objects have all nullable or overly abstract data fields. But let me explain. The whole advantage of object oriented programming is that you know what an object is when you get it. For example, say I'm designing the Task object. Any reasonable person would expect that a Task should have a description and should be able to be completed-- two fields. But now you want to make Tasks schedulable. Do you want to make ALL tasks schedulable? If so, add another non-nullable field and carry on; you're not the droids I'm looking for. I suddenly grow weary of writting this. I'll come back to it.

3. Internal technology should be designed as if it were external. When it's not, it's refered to as developer friction, poor maintainability, poor extensibility. This means that internal objects should have small, and tautalogical API surfaces, following principles of not making the user think. One good example an updateEndeavor object in the dataService. Ideally, this could replace the updateColor, addSubEndeavor, removeSubEndeavor, removeTask, etc. This could mean that there is increased load on the update method though. For instance, if the developer updated the endeavor by removing a subEndeavorId, the updateMethod could also handle calling the deleteEndeavor method hidden from the developer, which in turn handles deleting any tasks, events, and endeavorBlocks associated with that endeavor. This could violate the principle of single use methods? But it could replace its usefulness with something more like increased # of packages with clearly defined responsibilities and intuitive API surfaces.

2. A form input widget should not be represented by one of your models. The model is an already intact idea, and forms, by definition, are an idea under construction. Therefore, there should be a form representation. The form representation can track several form input representations, then only instantiate a model once validation has taken place. 
  * This is an abstract instantiation of philosophy number 1, like when you extend an abstract class with another abstract class.
  * The Formz library handles all this pretty well, I guess I'm just realizing the reason for the philosophy behind it. I bumped into it while trying to make a save button that only enables when all inputs are ready, but the event input was being represented by an Event, meaning that it couldn't emit an event till it was valid, and the save button would never disable.

3. I kinda like the idea of a progressive tool. One that can be used for the simplest use case. In this case just a to-do list and you can add in whatever fancy features you want for the given task.

4. The opposing point of view is making a super powerful tool that you have to LEARN learn like the Adobe applications.

5. Maybe instead of flows like turbotax, I could use the photoshop model of a giant array of tools

6. There's an interesting tension when you want to structure an object a different way than you want to store it. The tree of life for example. I'm storing it flat, but it's really a graph

## Task Brainstorming
* In physics there's this concept of de-dimensionalizing. Or rather, usefulizing units. You could understand your time in units of time/rent-payment by dividing time up into units of amount of time you have to work to pay for rent. Then a useless number, like an "8-hour" shift becomes a useful number. Like if rent is $700 and you make $13/hour, then 54 hours is one rent payment. So your shift is about 1/7th of a rent payment. Or if a meal is $20, then an 8-hour shift is a 5-meal shift which is an "eat for almost two days" shift. You could even average how much you spend per day from your budget and measure how much you make compared to that. You could make a unit that is (% of monthly expenses), like if you spend $1200/month, your % unit would be $12. Then an 8 hour shift would be about an 8% shift.

* the concept of a repeating endeavor block as an endeavor block generator is interesting. Just thinking of generators is interesting. What generates endeavors? What generates tasks? a generator could be an API that I reach out to to get new tasks like Canvas or something

## Notes for future
* There are annoying logs every time I run an https function. if I add (app check)[https://firebase.google.com/docs/app-check/monitor-functions-metrics] then supposedly it will stop doing that
* How to switch back to emulators
  * uncomment code in main
  * start local emulators using firebase emulators:start
  * delete app from emulator
  * rerun app in emulator

* Implementing the BLoC pattern
  * [Documentation](https://bloclibrary.dev/) for bloc
  * [documentation](https://dart.dev/tutorials/language/streams) for streams
  * Interesting [article](https://medium.com/codechai/effective-bloc-pattern-45c36d76d5fe) that made me think I should switch to stateful widgets for initialization and disposing of BLoCs

## Backlog
* get seperator lines back in between the endeavors in the EndeavorsScreen
* Rework task model to include repeating tasks
* I might want to create an endeavorlessTask
* ServerEvent and Event are really the same thing in two different packages

## Open questions
* Here is a snapshot from my endeavorBrain that feels like it could use some more general architectural thought.

## What I'm working on now

* Major refactor: Starting back when we were babysitting for the Reynolds I've been switching out Firebase and switching in a new Microservice running in Cloud Run that connects to a Cloud SQL instance.

* Recent progress has been that in the database I combined the EndeavorBlocks into the Events table and the repeatingEndeavorBlocks into the repeatingEvents table. Events and repeating events are working all around and now I've been working on Endeavors. 

* I've just switched to a package called cached_query rather than using streaming endpoints, inspired by react query which is a streaming server model that's implemented with queries and mutations. It should be working for Endeavors, events and repeating events (with or without endeavors)

* I think next would be to implement EndeavorBlocks with my shiny new endeavors infrastructure