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

* I got a backend service and database working, now I need to update the frontend to work with them. 

The next thing that I need to do is take all the thoughts below and turn them into a plan.

1. Create a shim with static aggregation
2. fit the current data service into that API
3. Add the piggy back write only http data service with cached queries
  - Add the creators
  - Add updaters
  - Add deleters
4. Add readers but bypass the server data types and data repository. This is when the new data service becomes the source of truth, so here I could do any work on data type abstractions and tighten up the package dependency graph.
5. Remove server data types, data repository, transformers, and old data service
6. This is when I can finally get around to implementing the Schedule

I'm thinking that I separated a data layer specifically so that I could hot swap it out, maybe now is when I see how well I did?

So my thought is that my data service has crud methods (create, retrieve, update, and delete). I can do all of the same through [cached queries](https://pub.dev/packages/cached_query). The retrieve can expose a stream just the same, the create, update, and delete methods can just invalidate the query causing the streams to be updated.

Updating a repeating calendar event could be tricky. But no matter what queries caches have to be invalidated, I'm sure I could, especially if the query keys can be nested.

I'm wondering about package dependencies and types. Now would be a good time to simplify types now that I don't really need to track server types. I can also get rid of the data repository completely because all that does is denormalize I think? Also, I'm wondering if I can use this as a chance to do a mixin or something to differentiate between saved and unsaved or identified and unidentified data. I should also keep in mind optimistic updating for this; if I want to use optimistic updating, my widgets would need to be comfortable using identified or unidentified data.

I'm wondering if it would be a good time to really tighten up the package dependency graph. Also, is there a way to specify API interfaces so that packages become hot swappable?

I'm thinking that to initiate the swap, I can create a shim dataservice whose whole job is to split data between the old and the new. I'm wondering if I should try to do static aggregation rather than extension.

I might even be able to get rid of some of that transformers as now my backend can translate between a normalized database and a denormalized app.