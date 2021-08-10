# GuessHang

A Flutter project combining [Geoguessr](https://www.geoguessr.com/) + [Hangman](https://en.wikipedia.org/wiki/Hangman_(game)) using [Firebase](https://firebase.google.com/) as backend.

## Features
>Authorization

This is done using Firebase Auth.
It is a basic signin/signup process using email and password.

><img src ="https://user-images.githubusercontent.com/74540123/128825611-23d9551f-b207-4afe-985f-2e8c4b4cf17c.png"  height = "400 px">
><img src = "https://user-images.githubusercontent.com/74540123/128827290-8ff1594b-78f3-4639-892f-e441bf725f90.png" height = "400 px">



>Google Street View

It is used as a [Web view](https://pub.dev/packages/webview_flutter) using [google maps Street View Service javascript api](https://developers.google.com/maps/documentation/javascript/streetview).]

><img src = "https://user-images.githubusercontent.com/74540123/128830423-42ae118d-780a-48e4-941e-9fee3bfa8403.png" height = "400 px">

>Hangman

Basically uses country names, to be guessed for hangman.

><img src = "https://user-images.githubusercontent.com/74540123/128831165-15dd541a-9614-459b-86b3-6784d5b106ac.png" height = "400 px">

If you guess wrong

><img src= "https://user-images.githubusercontent.com/74540123/128831607-312310de-e7e7-4f30-bd24-ea4c0c8d6157.png" height = "400 px" > 
><img src= "https://user-images.githubusercontent.com/74540123/128831705-d5f3428e-7e0e-4e4b-8961-017140832dec.png" height = "400 px" >
><img src= "https://user-images.githubusercontent.com/74540123/128831781-12a35276-9fdf-4b9b-b8f7-7f11048485df.png" height = "400 px" >

## Instructions

Go to the terminal and paste these commands stepwise.

```
$ git clone https://github.com/sarthak13gupta/guess-hang
$ flutter pub get
$ flutter run

```
### Note
If u face any problems regarding the dart version on your system and dependecy versions, then first remove version number of the dependency from pubspec.yaml and  run flutter pub get.

For screen recording of this app click [here](https://drive.google.com/file/d/1ENIKR6RV9wMQqlnL8Kso-JwEA51n2wul/view) 
