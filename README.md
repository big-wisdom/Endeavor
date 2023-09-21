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
1. I'm thinking that objects should be what they're called, and that if an object needs to be treated differently on whether a field is populated maybe it should be called something else when it is populated. For example, I'm going to have UnidentifiedTask and Task. An Unidentified task is a Task but without an ID, likely because it's just been created. The DataRepository can't update or delete an UnidentifiedTask, so they must be treated differently. However in many instances they can be treated the same so I'm abstracting them together under the AbstractTask class. Similarly, I'd like to rid the app of "empty" objects. I don't think that something should be called a "Task" if it's "empty" meaning there's actually no data to call a task and it's just a placeholder for future data.

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

## What I'm working on now

for (i in [Task, EndeavorBlock, CalendarEvent]) {
  for (j in [DataModel, ServerDataModel, DataService ServerDataModel stream, WeekViewEvent transformer addition, DataRepository]) {
    * build j component for i
      * i == EndeavorBlock && j == DONE
  }
  
  for (k in [CreateScreen, CreateScreenState, Bloc, DataService edit methods]) {
    * build k component for i
      * i == EndeavorBlock && k == CreateScreen
  }

  * test calendar screen so far
}

* CreateScreen for EndeavorBlock
  * I need the time selectors to show errors if the time is wrong DONE
    * I'm going to make the time picker take the whole EventStartTimeInput or whole EventEndTimeInput rather than just the value so that they can have the error to show
      * I can remove the TimePickerRowType DONE
      * and add custom constructors for the TimePickerRow Done
        * for EventStartTimeInput
        * and for EventEndTimeInput
      * Make the OneTimeEventPicker pass the whole input to the TimePickerRow
      * Make custom constructors for the RepeatingEvents DONE
        * RepeatingEventStartTimeInput
        * RepeatingEventEndTimeInput
      * Make the RepeatingEventPicker pass whole inputs into it DONE
      * Now fix the TimePickerRow to handle them
        * I could just create a custom TimePickerRowState that takes the info from them, but then I'd lose the error information
          * Unless I created the relevant type of input to check for errors?
            * but how would I keep track of which kind to make?
        * I could create 4 different kinds of TimePickerRowStates each that takes in the input that passed into it DONE
          * they could each implement a common type that the UI could use to call for the info it needs
        * now 4 constructors for the cubit and therefore 4 constructors for the screen. Kinda a lot but I did it DONE
        * wrap the UI Row with a Column and stick the error text beneath it if there is any
  * Error does not show on the RepeatingEvent picker FIXED
  * Now I need the save button to be disabled if there is an error showing on the OneTimeEventPicker DONE
    * I dont think the OneTimeEventPicker is even sending the event upwards if the event isn't valid
    * The repeating event picker actually has the same _onChangedIfValid check so I don't know why that screen is working
  * Now I need the save button to be disabled if there isn't an endeavor picked DONE
  * Now I need the error text to show below the endeavor selector DONE
  * Now I need the save button to be disabled if the RepeatingEventPicker is showing an error DONE
  * Now I need the day of the week picker to show an error if there is one DONE
  -------------------
  * Finally I need to make sure the save button on the EndeavorBlockScreen is actually working
    * It's now working for the single EndeavorBlock
    * I need to get it working for repeating
  -------------------
