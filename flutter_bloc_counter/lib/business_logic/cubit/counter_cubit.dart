import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_counter/business_logic/cubit/internet_cubit.dart';
import 'package:flutter_bloc_counter/constants/enums.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  final InternetCubit internetCubit;
  late StreamSubscription internetStreamSubscription;

  CounterCubit({required this.internetCubit})
      : super(CounterState(counterValue: 0)) {
    internetStreamSubscription =
        monitorInternetCubit();
  }

  StreamSubscription<InternetState> monitorInternetCubit() {
    return internetCubit.stream.listen((InternetState internetState) {
    if (internetState is InternetConnected &&
        internetState.connectionType == ConnectionType.wifi) {
      increment();
    } else if (internetState is InternetConnected &&
        internetState.connectionType == ConnectionType.mobile) {
      decrement();
    }
  });
  }

  @override
  Future<void> close() {
    // TODO: implement close
    internetStreamSubscription.cancel();
    return super.close();
  }

  void increment() => emit(CounterState(counterValue: state.counterValue + 1));
  void decrement() => emit(CounterState(counterValue: state.counterValue - 1));
}
