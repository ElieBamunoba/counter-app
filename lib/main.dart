import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:counter_app/business_logic/cubit/internet/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'business_logic/cubit/counter/counter_cubit.dart';
import './presentation/router/app_router.dart' as route;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (context) => InternetCubit(connectivity: Connectivity()),
        ),
        BlocProvider<CounterCubit>(create: (context) => CounterCubit()),
      ],
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
