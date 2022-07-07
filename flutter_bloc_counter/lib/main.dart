import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_counter/business_logic/cubit/internet_cubit.dart';
import 'package:flutter_bloc_counter/presentation/router/app_router.dart';
import 'package:flutter_bloc_counter/presentation/screens/home_screen.dart';
import 'package:flutter_bloc_counter/presentation/screens/second_screen.dart';
import 'package:flutter_bloc_counter/presentation/screens/third_screen.dart';

import 'business_logic/cubit/counter_cubit.dart';

void main() {
  runApp(MyApp(
    myAppRouter: AppRouter(),
    connectivity: Connectivity(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter myAppRouter;
  final Connectivity connectivity;

  MyApp({Key? key, required this.connectivity, required this.myAppRouter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (context) => InternetCubit(connectivity: connectivity),
        ),
        BlocProvider(
          create: (context) => CounterCubit(internetCubit: context.read<InternetCubit>()),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: myAppRouter.onGenerateRoute,
      ),
    );
  }

  @override
  void dispose() {
    // // TODO: implement dispose
    // _counterCubit.close();
  }
}
