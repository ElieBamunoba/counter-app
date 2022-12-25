part of 'counter_cubit.dart';

//This class is the blueprint for all possible states which will be emitted by the cubit
class CounterState {
  int counterValue;
  bool? wasIncremented;
  CounterState({
    required this.counterValue,
    this.wasIncremented,
  });
}
