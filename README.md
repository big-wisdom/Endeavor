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

<<<<<<< HEAD
* History
  * I researched and found out that my live service is already using TLS as google provides it
  * I then got endeavor switched over to my ecosystemAuth FirebaseAuth project
  * I then got it to send a user token to the Cloud Run service to authenticate all requests. So now I know I have encrypted network traffic, and I have authenticated endpoints with a central identity provider project. WOO HOO!
=======
----------------- HERE'S MY PLAN -----------------

* Make the CalendarEventScreen handle a .repeatingOnly(RepeatingCalendarEvent? rce) constructor in create mode
  * 

* Schedules
  * Plan (~40 tasks)
    * Prepare Existing Code
      * DONE Refactor current repeating events with GetRepeatingEvents(re RepeatingEvent, start Date, end Date) []*Event
        * DONE Created function to get events
        * DONE Refactor go database code to create repeating event differently with seperate calls within a transaction
    * Start with schedules proper
      * DONE Simple schedule creation and deletion
      * Add Repeating Event to Schedule
        * DONE Create Basic Edit Schedule Page
        * These two were probably a waste of time. I'm not going to bother undoing them because who knows
          * DONE Create a ListRepeatingEvent endpoint so that I can populate the edit page
          * DONE Create a query for RepeatingCalendarEvents
        --------------
        * Make the CalendarEventScreen handle a .repeatingOnly(RepeatingCalendarEvent? rce) constructor in create mode
        --------------
        * Adjust repeatingEvents table to include scheduleId
        * Create simple add repeating event to schedule endpoint that doesn't account for existing scheduled schedules
      * Show the repeating event in the editor
        * Make ListSchedules endpoint
        * GetEditorCalendarEvents Endpoint which gets hypothetical events for the editor calendar based off the scheduleId
      * Edit the repeating event from the editor
        * Make the CalendarEventScreen.repeatingOnly(RepeatingCalendarEvent? rce) constructor handle non-null rce
        * Edit RepeatingCalendarEvent endpoint
      * Delete repeatingCalendarEvent
        * Delete RepeatingCalendarEvent endpoint
        * Delete within UI
      * Schedule Schedule
        * Create SceduleSchedule DB Table
        * Create Simple ScheduleSchedule endpoint to add schedule schedule to the schedule, no need to add the events just yet, just warn the UI if a range of another schedule will be overwritten. Possibly add a confirm field. If the endpoint is called with a confirm field false, and there are no conflicts, then go through with it. If there is a conflict, return conflict details. If it's called with confirm, then overwrite.
          * Or do the simple version first and go back and forth with the next UI step
        * Create UI to display scheduled date ranges on the edit schedule page
        * Create DeleteScheduleSchedule endpoint
        * Create UI to select date range for schedule schedule
        * Now adjust the ScheduleSchedule endpoint to actually create the events as well
        * Fix add repeating event to schedule endpoint to add its events to future scheduleschedules as well
      * Finishing touches on the editor calendar
        * Add view filters to show only certain endeavors
        * Add view filter to show existing events
          * Adjust endpoint to optionally include existing non-schedule events
      * Finishing touch on schedule creation
        * Create by copying
        * Create variant by copying
          * Including a list a variant schedules
          * Add parent schedule field
          * Make schedules list endpoint heirarchical
          * Make schedules page hierarchical

  * Not doing now
    * Adjust repeating event front end data type to include possibility of every _ [day] of each month
    * Adjust repeating event editor to include possibility of every _ [day] of each picker
    * Adjust GetRepeatingEvents to calculate events for _ [day] of each month
  ----------------- HERE'S MY THINKING -----------------
  * I'm also wondering if I should update to have more complicated repeating events
    * On _ [day] of each month (on 3rd sunday of each month)
  * Okay so right now I leave applying repeating events to the database storedProcedure. I feel like that might be more code than should be in the database and that I might want to extract that code for other use. On the editor calendar, I'm going to want to get a bunch of hypothetical events, so I might want code that can take in a repeating event, a date range, and return a grouping of events that could then be added to a database, or sent back to the client for hypothetical adjustment.
    * GetEditorCalendarEvents(scheduleId string, start Date, end Date) []*Event
    * GetRepeatingEventEvents(re RepeatingEvent, start Date, end Date) []*Event
  * Backend
    * Database
      * Table for schedules
        * ID
        * Name
      * Table for scheduled schedules
        * scheduleId
        * start date
        * end date
      * Field in repeating event for which schedule it belongs to and delete dependence
    * Service
      * Create endpoint. This one should be the simple. It should only involve creating an entry in the schedule table
      * Delete endpoint. Simple delete of the schedule row
      * Schedule schedule endpoint. This one is going to be complicated. This will need to account for several scenarios.
        * There isn't any schedule in the way. This will be the easiest because it will just be implementing all the repeating events.
        * There is a schedule in the way
          * It is this schedule, but an old schedule schedule. We should probably just extend the one that's there
          * It is another schedule. Whatever part of the schedule schedule will need to be blown away. Probably with the confirmation of the user. This means removing all events in it, and either adjusting the range of it's schedule schedule or deleting it entirely.
      * Add repeating event endpoint. This will mean adding that repeatingEvent with now the proper scheduleId, and applying that repeating event to all already scheduled future schedule schedules
      * Remove repeating event endpoint. Similarly, this will mean removing the repeatingEvent (possibly detaching it's old events first for history) and removing its events from all, already scheduled, schedule schedules
  * UI
    * Create with title in a bottom sheet like the endeavor
    * Need an edit page. This would have a title field, a schedule field that has a list of date ranges for which it is scheduled, and a button to launch an editor calendar that is similar to the week view, but it's hypothetical. 
    * It would also be cool to have a bar graph that shows amount of time that schedules spends on each endeavor
    * It would also be cool if the editor calendar could toggle showing existing events or showing events for specific endeavors.


  * M2
    * Have sub variants
    * Eventually create by copying
>>>>>>> cc1b26d (Make a solid plan)
