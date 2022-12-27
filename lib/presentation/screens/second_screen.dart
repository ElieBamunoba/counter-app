import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/cubit/counter/counter_cubit.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({
    super.key,
    required this.title,
    required this.color,
  });

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: color,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
                  backgroundColor: color,
                  tooltip: 'Decrement',
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
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },
              color: color,
              child: const Text('Go to back to the Home Screen'),
            )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
