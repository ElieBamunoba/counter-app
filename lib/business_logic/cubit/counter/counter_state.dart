part of 'counter_cubit.dart';

//This class is the blueprint for all possible states which will be emitted by the cubit
class CounterState extends Equatable {
  int counterValue;
  bool? wasIncremented;
  CounterState({
    required this.counterValue,
    this.wasIncremented,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        counterValue,
        wasIncremented,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'counterValue': counterValue,
      'wasIncremented': wasIncremented,
    };
  }

  factory CounterState.fromMap(Map<String, dynamic> map) {
    return CounterState(
      counterValue: map['counterValue'] as int,
      wasIncremented:
          map['wasIncremented'] != null ? map['wasIncremented'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CounterState.fromJson(String source) =>
      CounterState.fromMap(json.decode(source) as Map<String, dynamic>);
}
