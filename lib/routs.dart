import 'package:flutter/material.dart';
import 'package:movies/core/class/app_rout.dart';
import 'package:movies/screen/Tabs/BottomNavigationBarScreen.dart';
import 'package:movies/screen/home.dart';
import 'package:movies/screen/log.dart';
import 'package:movies/screen/movie_details.dart';

Map<String, Widget Function(BuildContext)> routs = {
  // "/": (context) => const OnBoarding(),
  AppRouts.log: (context) => const Log(),
  AppRouts.home: (context) =>  Home(),
  AppRouts.bottomNavigationBarScreen:(context)=>BottomNavigationBarScreen(),
  // AppRouts.movieDetails:
  "/": (context) => const MovieDetails(),
};
