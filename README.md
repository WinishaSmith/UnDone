# UnDone App

# Technologies used:
* Atom
* Ruby on Rails
* Bootstrap (Bootstap-Sass Gem)
* Simple Form Gem
* PostgreSQL
* Font Awesome (for icons)


# Approach Taken:
# Bronze
* Created a task with a description
* Tasks will display on the index page in ascending order
* Created the ability to edit, delete and mark complete (made with "link_to" helper)

# Silver
* Created user model with sign up and sign in functionality
* Users can only see their tasks
* Added navigation bar with logo and links
* Added icons for edit, complete, and delete
* Added 'back' and 'cancel' features for edit task and show task


# Gold (Future Additions)
* Add due-date functionality (should alert user if task is overdue)
* Redesign Welcome page to include photo


# Unsolved Problems:
* Users who sign up aren't identified as being signed-in so they must sign up and then sign in

# User Stories:
* Users should be presented with a home screen where they'll have the ability to sign in or sign up
* Once signed in, users should be taken to their desktop
* Users should be able to create a new list and give it a name
* Users should be able to add their tasks to the list
* Users should have the ability to edit/update their existing tasks
* Users should have the ability to mark a task as complete
* Users should be able to delete tasks they no longer need
