import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_counter/business_logic/cubit/counter_cubit.dart';
import 'package:flutter_bloc_counter/presentation/screens/home_screen.dart';
import 'package:flutter_bloc_counter/presentation/screens/second_screen.dart';
import 'package:flutter_bloc_counter/presentation/screens/third_screen.dart';

class AppRouter {

  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(
            title: 'Home',
            color: Colors.blueAccent,
          ),
        );

      case '/second':
        return MaterialPageRoute(
          builder: (_) => const SecondScreen(
            title: 'Home',
            color: Colors.redAccent,
          ),
        );

      case '/third':
        return MaterialPageRoute(
          builder: (_) => const ThirdScreen(
            title: 'Home',
            color: Colors.greenAccent,
          ),
        );

      default:
        return null;
    }
  }

  
}
