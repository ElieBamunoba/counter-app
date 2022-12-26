import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/cubit/counter_cubit.dart';
import '../screens/home_screen.dart';
import '../screens/second_screen.dart';

//Routes Names
const String homeScreen = 'HomeScreen';
const String secondScreen = 'SecondScreen';

final CounterCubit _counterCubit = CounterCubit();

Route onGenerateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case homeScreen:
      return MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: _counterCubit,
          child: const HomeScreen(
            title: 'Home Screen ',
            color: Colors.blue,
          ),
        ),
      );
    case secondScreen:
      return MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: _counterCubit,
          child: const SecondScreen(
            title: 'Second Screen ',
            color: Colors.orange,
          ),
        ),
      );
    default:
      throw ('This route name does not exist');
  }
}

void dispose() {
  _counterCubit.close();
}
