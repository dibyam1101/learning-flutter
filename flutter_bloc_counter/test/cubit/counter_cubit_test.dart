import 'package:bloc_test/bloc_test.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc_counter/business_logic/cubit/counter_cubit.dart';
import 'package:flutter_bloc_counter/business_logic/cubit/internet_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CounterCubit', () {
    late CounterCubit counterCubit;
    setUp(() {
      counterCubit = CounterCubit(internetCubit: InternetCubit(connectivity: Connectivity()));
    });

    tearDown(() {
      counterCubit.close();
    });

    test('The initial state for CounterCubit is CounterState(counterValue: 0)',
        () {
      expect(counterCubit.state, CounterState(counterValue: 0));
    });

    blocTest<CounterCubit, CounterState>(
      'emits CounterState(counterValue: 1, wasIncremented: true) when cubit.increment is called.',
      build: () => counterCubit,
      act: (cubit) => cubit.increment(),
      expect: () => [CounterState(counterValue: 1)],
    );

    blocTest<CounterCubit, CounterState>(
      'emits CounterState(counterValue: -1, wasIncremented: false) when cubit.increment is called.',
      build: () => counterCubit,
      act: (cubit) => cubit.decrement(),
      expect: () => [CounterState(counterValue: -1)],
    );
  });
}
