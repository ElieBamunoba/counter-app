import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/cubit/internet/internet_cubit.dart';
import '../router/app_router.dart' as route;
import '../../business_logic/cubit/counter/counter_cubit.dart';
import '../../constants/enums.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.title,
    required this.color,
  });

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetCubit, InternetState>(
      listener: (context, state) {
        // if (state is InternetConnected &&
        //     state.connectionType == ConnectionType.Wifi) {
        //   BlocProvider.of<CounterCubit>(context).increment();
        // } else if (state is InternetConnected &&
        //     state.connectionType == ConnectionType.Mobile) {
        //   context.read<CounterCubit>().decrement();
        // }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BlocBuilder<InternetCubit, InternetState>(
                builder: ((context, state) {
                  if (state is InternetConnected &&
                      state.connectionType == ConnectionType.Wifi) {
                    return const Text(
                      'Wi-fi',
                      style: TextStyle(fontSize: 45, color: Colors.green),
                    );
                  } else if (state is InternetConnected &&
                      state.connectionType == ConnectionType.Mobile) {
                    return const Text(
                      'Mobile',
                      style: TextStyle(fontSize: 45, color: Colors.orange),
                    );
                  } else if (state is InternetDesconnected) {
                    return const Text(
                      'Disconnected',
                      style: TextStyle(fontSize: 45, color: Colors.red),
                    );
                  }
                  return const CircularProgressIndicator();
                }),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'COUNTER VALUE',
                style: TextStyle(fontSize: 35),
              ),
              BlocConsumer<CounterCubit, CounterState>(
                listener: (context, state) {
                  state.wasIncremented == true
                      ? ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Incremented!',
                            ),
                            duration: Duration(milliseconds: 300),
                          ),
                        )
                      : ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Decremented!',
                            ),
                            duration: Duration(milliseconds: 300),
                          ),
                        );
                },
                builder: (context, state) {
                  return Text(
                    '${state.counterValue}',
                    style: const TextStyle(fontSize: 35),
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FloatingActionButton(
                    onPressed: () {
                      //accessing the access the instance of the cubic
                      BlocProvider.of<CounterCubit>(context).decrement();
                    },
                    tooltip: 'Decrement',
                    backgroundColor: color,
                    child: const Icon(Icons.remove),
                  ),
                  FloatingActionButton(
                    onPressed: () =>
                        BlocProvider.of<CounterCubit>(context).increment(),
                    tooltip: 'Increment',
                    backgroundColor: color,
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: color,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () {
                    Navigator.pushNamed(context, route.secondScreen);
                  },
                  child: const Text('Go to the second Screen',
                      style: TextStyle(color: Colors.white)),
                ),
              )
            ],
          ),
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
