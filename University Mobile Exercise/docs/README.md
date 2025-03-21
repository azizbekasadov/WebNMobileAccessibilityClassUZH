This README file should give you an overview on the architecture of this application.


# Mainview
The MainView file describes the entry view of this application. The mainview consists of a tabview (a navigation bar at the bottom), that switches child views using interactive user interface elements.
The child views are the following: MealsView, EnrollmentView and NewsView

## Mealsview
The MealsView displays a list of restaurants. The entries of this list are represented by the RestaurantCardView, which, when clicked, directs the navigation to the corresponding RestaurantView.

## NewsView
The NewsView displays a list of news. The entries of this list are represented by the NewsCardView, which, when clicked, directs the navigation to the corresponding Image- or TextNewsView.

## EnrollmentView
The enrollment displays the registrationview. The registrationview consists of a formview, containing several entryfields and pickerforms.

## Models
The models folder contains the data models of News, Restaurant and Registration. The model files all contain predefined instances of the data models that will be displayed in the application. The models do not need to be modified to solve the exercise.


