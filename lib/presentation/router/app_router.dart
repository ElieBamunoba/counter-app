import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../screens/second_screen.dart';

//Routes Names
const String homeScreen = 'HomeScreen';
const String secondScreen = 'SecondScreen';

Route onGenerateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case homeScreen:
      return MaterialPageRoute(
        builder: (_) => const HomeScreen(
          title: 'Home Screen ',
          color: Colors.blue,
        ),
      );
    case secondScreen:
      return MaterialPageRoute(
        builder: (_) => const SecondScreen(
          title: 'Second Screen ',
          color: Colors.orange,
        ),
      );
    default:
      throw ('This route name does not exist');
  }
}
