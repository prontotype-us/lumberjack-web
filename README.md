# Lumberjack

### Background

Lumberjack is a cloud-based lumber management platform for the connected forester. A webapp has been under development for the last few months, and the client needs a few upgrades.

### Product requirements

You don't have to do these items in order. Try to finish as much as you can in 3 hours.

1. Some way to add a new tree
    * Provide at least a species and current status per tree
    * You can use a form library like https://github.com/prontotype-us/validated-form if you'd like
2. Build a details view to look closer at each tree
    * Show tree status, species, and the time the tree was created
    * Expand tree data to include any other fields you think would be helpful for the lumberjacks
    * Some way to update tree status or other information
        * You will create a new route in the API to support this functionality
3. Style the app to make it easy for lumberjacks to use in the field
4. Some way to filter trees by status


### Nice to haves

If you have extra time, we always like to go the extra mile for clients. Try some of these items.

* Make sure the app is reponsive. Make it usable and beautiful for a 360px wide viewport
* Make sure the package will allow the app to be built from a clean install
* Suggest two additional features to make the day-to-day operations of a Lumberjack in the wild easier and more efficient. You do not need to develop these features, but feel free to specify them however you like.
* Roughly specify the data model you would use to allow users to leave notes about trees. What technologies would you use to update these notes live in the field for other users?

### Getting started

Fork the repo and install

    git clone https://github.com/<your_github_id>/lumberjack-web.git
    cd lumberjack-web
    npm install

Start the app

    npm run start

### How it works

The backend runs with two microservices that work together. `server.coffee` serves the webapp page and runs the API. It exposes basic CRUD functions for the app's schema with an in-memory database in `data.coffee`. You can reset the database any time by restarting the app.

The UI code is in `app.coffee`, which uses a Dispatcher to talk to the API with [kefir-fetch](https://github.com/prontotype-us/kefir-fetch).

### How to submit

When you are finished, create a pull request.

If you have any questions, please create an issue on github. Good luck!
