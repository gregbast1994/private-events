# Private Events
## A simple app which allows users to create events and allows other users to signup for created events. 

https://www.theodinproject.com/courses/ruby-on-rails/lessons/associations#null

Here's how we are going to do it:

### users & sign up
* rails g model User name:string email:string
* users controller new/show/destroy
* allow users to sign in
* store the session

### events
* rails g model Event title:string description:string user:reference datetime:datetime location:string
* show event
* allow users to signup for event
* show event on user/show
* show all events on homepage
* create events form
* allow owners to edit/delete events
* User#show past/future events
    define past/future_events in events model
    assign each method to a collection of events
    setup a tabbed area where user can switch between past and future events
* List all events on index page / seperate into past & future

* Invite users to events
    Users#show - Include button to invite a user ( who isn't already going ) to a event
