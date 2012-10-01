Group Collect Sample Task for oDesk applicants

## Overview ##

To evaluate your competencies with our development tools and environments, please contribute a maximum of two hours towards the completion the following task.  Our evaluation will be based upon code quality and decisions, not necessarily the completion of the given task.  At the end of two hours, please push your code in it's current state for evaluation, even if the task is still incomplete.


### Outline ###

There are 3 image uploaders:
  - /profile/edit -- with working ajax upload
  - /users/1/edit
  - /trips/1/edit

### Model ###
  - Agency has many Users 
  - Agency has many Logos (pictures)
  - Agency has many Trips
  - Users has many Pictures (unimplemented)
  - Trips has many Pictures (unimplemented)


### Objectives ###

1. Choose one of the following database models:
  - Option 1: Create a polymorphic join model named :imageable to unify all 3 images (including the currently implemented Logo model).
  - Option 2: Create Picture models for User & Trip (ie. Avatar, TripPicture).

2. Please state your choice of option 1 or option 2, and the reasons for your decisions (pro & con).  Please answer this in the README.md

3. Use Test Driven Development (Rspec + Capybara) to write acceptance/request tests for the uplaod UI workflow.  

4. Implement a crop image handler using carrierwave & rmagick (You might want to add a 'Crop' button on the Picture selection window).


Prior to starting your work:

  - Fork https://github.com/iTourSmart/gc-test-app to your github account

    or just save the code locally and send the zip with .git folder intact.

  - run rake db:seed

  - merge/rebase code in 'uploader-fix' branch that has the recent changes, make sure this applies cleanly to master.

  - Create your changes in a new branch called 'image-uploader'

