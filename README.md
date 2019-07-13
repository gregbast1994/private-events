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
* rails g model Event title:string description:string user:reference when:datetime where:string
* show event
* allow users to signup for event
* show event on user/show
* show all events on homepage
* create events form
* allow owners to edit/delete events

