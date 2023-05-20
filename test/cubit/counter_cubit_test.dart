import 'package:bloc_test/bloc_test.dart';
import 'package:counter_app/business_logic/cubit/counter/counter_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'CounterCubit',
    () {
      CounterCubit counterCubit = CounterCubit();
      //setUp is the function used to initialize data that the test will work with
      setUp(() {
        counterCubit = CounterCubit();
      });
      tearDown(() {
        counterCubit.close();
      });

      test(
        'the initial state for the counterCubit is CounterState(CounterValue:0)',
        () {
          expect(
            //the return actual value return by the initial state
            counterCubit.state,
            //the expected value to be returned
            CounterState(counterValue: 0),
          );
        },
      );
      blocTest(
        'the cubit shout emit a counterState(counterValue:1, wasIncremented:true) when cubit.increment() function is called',
        build: () =>
            counterCubit, //returns the current instance of the CounterCubit in order to make it available to the testing process
        act: (cubit) => cubit
            .increment(), //takes the cubit and returns the action perform on it

        expect: () => [CounterState(counterValue: 1, wasIncremented: true)],
      );
      blocTest(
        'the cubit shout emit a counterState(counterValue:-1, wasIncremented:false) when cubit.decrement() function is called',
        build: () =>
            counterCubit, //returns the current instance of the CounterCubit in order to make it available to the testing process
        act: (cubit) => cubit
            .decrement(), //takes the cubit and returns the action perform on it
        expect: () => [CounterState(counterValue: -1, wasIncremented: false)],
      );
    },
  );
}
