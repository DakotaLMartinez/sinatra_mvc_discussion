# Sinatra MVC

```
corneal new sinatra_mvc
```

# Understanding MVC using the Restaurant Analogy
Models (Cooks in the Kitchen)

Views (Plates)

Controllers (Waiters)

MVC is a design pattern used to build applications. It allows us to implement separation of concerns.

### Separation of Concerns
This is the idea that we want to have code with differing responsibilities in a different place. We organize our code by the type of responsibility it has.

Models are connected to the business logic of our domain. These are the things that our program cares about. The objects we need to know how to build and how they are related to one another. When we talk about a domain model, we're referring to the Model layer of an application.

In a restaurant, one of our models might be a Meal. ActiveRecord models (ones that inherit from ActiveRecord::Base) are going to have added functionality connected to the database table with which they're associated.

### Layers to a Web Application
```
Dependencies (Gems/packages)

Configuration (environment variables/other stuff in config folder)

Database

Models

Views

Controllers

Routes
```

I use these layers as a template for building cheat sheets about different concepts related to a Sinatra/Rails application.

### Single Responsibility Principle (SRP)

The layers and what they're responsibilites are
#### Dependencies 
How we specify code written by other people (or us :) ) that we need to have installed before our program can run.
#### Configuration
Make sure that all of our dependencies are loaded and configured with any information they need to work properly for our app. These are things that might change from application to application and need to be configured so they work properly. (config/environment.rb, config.ru)
#### Database 
Add the ability to persist data beyond the running of our program. Storing information so we can retrieve it later. In a web app, we write migration files whose responsibility is recording changes to the database over time and allowing multiple developers to integrate those changes as they occur in a more automated way. (Other developers will get an error if they try to run the code without running a migration that you added)
#### Models
Provide an abstraction of what we're trying to model in real life. These files contain logic about the types of things that we care about for the application. When we describe the features of an application, every *thing* (noun) that we refer to could potentially be a model. The verbs could be methods they can do. The way we describe individual things (their attributes) could be columns in the database table associated with that model.
#### Views 
Code that describes what the user actually sees (we could include javascript here too because it can influence what the user sees). Code that describes the content that is sent back to the browser.
#### Controllers 
Groups of routes that are related to one another.
#### Routes
Designed to map requests to responses. Code that determines how our application should respond to different types of requests.

### Restaurant Analogy for Layers

Dependencies (Gems/packages)
Kitchen Equipment (Oven, Refridgerator, Freezer, Stove, Fryer) Electricity connection, Gas, Water. Plumbing and wiring.
Configuration (environment variables/other stuff in config folder)
Sign up for Water, Gas, Power Service and put in your credentials here. We sign up with a provider, and put in our credit card so we can use the service for our restaurant. Make sure that dependencies are connected to our application.
Database
Food, Ingredients
Models
Meal
Views
Plate or a cup or a glass. How we deliver our orders to customers.
Controllers
Waiter/Waitress
Routes
Menu

A Request is an order


Let's describe the request response cycle using the restaurant analogy
1. Customer places an order for a martini
2. Waiter checks their knowledge of the menu to make sure we serve martinis, because we do...
3. Waiter takes the order to the Bartender and waits patiently for the Bartender to finish making the drink.
4. Bartender gets the Vermouth, Gin and Olive, Ice and stirring spoon and prepares Martini and pours into `glass`
5. Waiter receives martini from Bartender and delivers back to customer at the table

1. Customer places an order for fries 
2. Waiter checks their knowledge of the menu to make sure we serve fries, because we do...
3. Waiter takes order to FryCook and waits patiently for them to finish making the fries.
4. `FryCook` finds the `Fries` Recipe and follows it: cuts up a bunch of `Potatoes` & gets a bunch of `Vegetable Oil`, pours it into the fryer, heats it up, pours in the Potatoes. Waits a bit, pulls them out puts them in a `basket`
5. Waiter receives fries from FryCook and delivers back to customer at the table.

1. User sends **request** to our application (`get '/meals'`)
2. Request is matched to a route in our `MealsController`
3. `MealsController` asks `Meal` model for related information.
4. `Meal` model requests information from `meals` database table and bundles response into collection of objects. (`Meal.all`)
5. `MealsController` renders model objects into a view template (`app/views/index.html.erb`) as a **response** sent back to browser.
