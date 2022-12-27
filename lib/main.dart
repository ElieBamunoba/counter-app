import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:counter_app/business_logic/cubit/internet/internet_cubit.dart';
import 'package:counter_app/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'business_logic/cubit/counter/counter_cubit.dart';
import './presentation/router/app_router.dart' as route;

void main() {
  runApp(MyApp(
      // connectivity: Connectivity(),
      ));
}

class MyApp extends StatelessWidget {
  // final Connectivity connectivity;
  const MyApp({
    super.key,
    // required this.connectivity,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (context) => InternetCubit(connectivity: Connectivity()),
        ),
        BlocProvider<CounterCubit>(
            create: (context) => CounterCubit(
                  internetCubit: InternetCubit(connectivity: Connectivity()),
                )),
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
