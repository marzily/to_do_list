# ToDo List

This application allows users to create a ToDo list.

Functionality consists of the following:

* As a user, I can add a TODO to the list.
* As a user, I can see all the TODOs on the list in an overview.
* As a user, I can drill into a TODO to see more information about the TODO.
* As a user, I can delete a TODO.
* As a user, I can mark a TODO as completed.
* As a user, when I see all the TODOs in the overview, if today's date is past the TODO's deadline, highlight it.

A TODO consists of a task (just a simple sentence or two), a deadline date, a completed flag, and an optional "more details" field that allows for more details to be given (a single large text area).

The list of TODOs can be kept in memory.


To run code, clone repo:
```
$ bundle install
$ rails server
```

#### Landing Page/List Overview
![alt text](public/index1_page.png?raw=true "Title")

#### New Page
![alt text](public/new_page.png?raw=true "Title")

#### Show Page
![alt text](public/show_page.png?raw=true "Title")
