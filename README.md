# Flutter GetX MVVM POC

This project is a simple posts application containing a list of fake posts and a page to create a new one, that serves as a Proof of Concept for architecture, state management and dependency injection solutions.\
Here you can find a concrete implementation of MVVM (with some Clean Arch concepts), using the GetX ecosystem for navigation, bindings and state management.

## App Features

- Page to create a new post
- Posts list from a local random generated model

## Used Packages

- equatable
- faker
- get

## Getting Started

### Architecture

The project root folder is the `lib` folder. This folder contains the project subfolders of the MVVM architecture: `model`, `view` and `view_model`.\
The `model` layer contains all the data, business logic and code validations.
In the `view_model` layer is the classes that serves as intermediators between the `model` and the `view` layer, containing methods to notify the `view` whenever needed.\
The last layer, `view`, is where all the UI is located. Here are all the widgets and pages used, as well as the methods that requests data from the `view_model` layer.

### Dependency Injection

The dependency injection is done by using the methods provided by the GetX ecosystem, inserting the bindings inside the `core` folder in the `model` layer, and then binding them to the routes in the `main.dart` file.

### Routing

The app navigation is implemented using the GetX routing system in the `main.dart` file. To navigate to another page, use onde of the GetX provided methos, such as: `Get.to` or `Get.toNamed`.

### State Management

The State Management used for this project is the one provided by GetX, with GetXControllers.\
The controllers are located inside the `view` layer, along the pages themselves, and provide the screens with the methods necessary to call data from the other layers.
To access a controller inside a screen, use: `Get.find()`.

### Screens

This is a simple app, with just 2 screens.

- Home
- Create Post

The Home page contains a simple list of posts and a button to navigate to the Create Post page. In the Create Post Page is a text field area and a button to publish the data. After clicking this button, the navigatiion returns to Home.
