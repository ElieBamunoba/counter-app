import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './business_logic/cubit/counter_cubit.dart';
import './presentation/router/app_router.dart' as route;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Bloc Counter App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: route.onGenerateRoute,
        initialRoute: route.homeScreen,
      ),
    );
  }
}
