# Lumberjack
Assessment for developers on the Prontotype stack

## Background on the Prontotype stack

Before you get started with the challenge, take a minute to read through the peculiarities of the Prontotype stack.

### Overview

Our apps use isomorphic Javascript: We develop backend services and APIs in [Node.js](https://nodejs.org/en/) and frontends with [React.js](https://facebook.github.io/react/). We develop these components in [CoffeeScript](http://coffeescript.org/), which compiles into Javascript. Our HTML is written in the [Jade](https://www.npmjs.com/package/jade) templating language. Styles are written in [Styl](https://github.com/tj/styl).

### Compiling CoffeeScript, Jade, and Styl

We use [Metaserve](https://github.com/prontotype-us/metaserve) to automatically compile Coffeescript, Jade, and Styl into Javascript, HTML, and CSS, respectively. In the development environment, this is all handled for you via [polar](https://www.npmjs.com/package/polar).

You do not need to worry about compiling anything for this assessment. Your changes on the frontend will be automatically reflected when you refresh the page. Changes to the backend services will require that you restart the app (details below in Getting started).

#### CoffeeScript
[CoffeeScript](http://coffeescript.org/) is a bracketless version of Javascript with a few syntactic niceties including arrow functions (`timesFive = (a) -> a * 5`) , object destructuring (`{name, age} = person`) and spreads (`person = {name, age}`)

With [coffee-reactify](https://github.com/jsdf/coffee-reactify) the JSX syntax in React can be used within CoffeeScript:

```coffee
ItemSummary = ({item}) ->
    <div className='item'>
        {item.name}
    </div>
```

#### Jade

Jade is an indentation based HTML templating language with support for variables, loops, and conditionals.

```jade
body
    h1 Hello
    for item in list
        li.item Item: #{item}
```

#### Styl

[Styl](https://github.com/tj/styl), based on [Rework](https://github.com/reworkcss/rework), is a bracketless CSS variant (alone known as Sass) with plugins (supported by Rework). The Rework framework allows for plugins which support [variables](https://github.com/bloglovin/node-rework-variant), [calculations](https://github.com/reworkcss/rework-calc), [color modifications](https://github.com/ianstormtaylor/rework-color-function), and [custom functions](https://github.com/reworkcss/rework-plugin-function), and more.

```sass
.item
    color: color($colors.blue shade(10%))
    font-size: $fonts.small
```

### Set up your development environment

Before you can start the challenge, you need to do some basic set up.

#### Install Node.js and npm

You can find instructions for downloading and installing node on the website for [Node.js](https://nodejs.org). You may need to [update npm](https://docs.npmjs.com/getting-started/installing-node).

#### Install CoffeeScript

Install CoffeeScript globally:

    npm install -g coffeescript

## Challenge 

Now that you have some familiarity with the Prontotype stack, you are ready to tackle the development challenge!

### Product

Lumberjack is a cloud-based lumber management platform for the connected forester. A web app has been under development for the last few months, and the client needs a few upgrades.

#### Requirements

You don't have to do these items in order. Try to finish as much as you can in under 3 hours.

1. User should be able to add a new tree
    * Provide at least a species and current status per tree
    * You can use a form library like https://github.com/prontotype-us/validated-form if you'd like
2. User should be able to see a details view for each tree
    * Show tree status, species, and the time the tree was created
    * Expand tree data to include any other fields you think would be helpful for the lumberjacks
    * Provide the user a way to update tree status or other information (Note: You will create a new route in the API to support this functionality)
3. User should be able to easily use the app in the field
    * Style the app to make it easy for lumberjacks to use in the difficult forest conditions
4. User should be able to filter trees by status

#### Bonus features

If you have extra time, we always like to go the extra mile for clients. Try some of these items.

* Make sure the app is reponsive: Make it usable and beautiful for a 360px wide viewport
* Make sure the package.json is updated so the app can be built from a clean install
* Suggest two additional features to make the day-to-day operations of a Lumberjack in the wild easier and more efficient. You do not need to develop these features, but feel free to specify them however you like.
* Roughly specify the data model you would implement to allow users to leave notes about trees. What technologies would you use to update these notes live in the field for other users?

### Getting started

1. Fork the repo on GitHub to get your own version.

2. Clone from your forked repo and install:

    ```
    git clone https://github.com/<your_github_id>/lumberjack-web.git
    cd lumberjack-web
    npm install
    ```

3. Start the app:

    ```
    npm run start
    ```

4. Browse to http://localhost:9775

### How it works

The backend runs with two microservices:

* Server & API: `server.coffee` serves the web app page and runs the API. The API exposes some basic CRUD functions for the app's schema.
* Data Service: `data.coffee` is an in-memory database and basic data service. You can reset the database at any time by restarting the app.

The frontend is a single-page application built in [React.js](https://facebook.github.io/react/):

* Jade Template: `views/app.jade` is a Jade template within which the React app is rendered.
* React App: `static/js/app.coffee` contains the React `App`. It uses a `Dispatcher` to talk to the API via [kefir-fetch](https://github.com/prontotype-us/kefir-fetch).
* Styl: `static/css/app.sass` contains all of the styling for the app.

### What to do

Think through the requirements specified above, and implement what you can in under 3 hours. If you get stuck on something or have a question, please create an issue here on GitHub. We will try to respond as quickly as we can during business hours.

### How to submit

When you are finished, create a pull request for your fork. We'll check your work and be in touch. Good luck and have fun!
