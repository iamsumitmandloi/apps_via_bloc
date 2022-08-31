import 'package:again_counter_through_bloc/Counter/CounterView/counter_page.dart';
import 'package:again_counter_through_bloc/Timer/timer_view/timer_page.dart';
import 'package:flutter/material.dart';

class CounterApp extends MaterialApp {
  const CounterApp({super.key}) : super(home: const CounterPage());
}

class TimerApp extends MaterialApp {
  TimerApp({super.key})
      : super(
          home: const TimerPage(),
          theme: ThemeData(
            primaryColor: const Color.fromRGBO(109, 234, 255, 1),
            colorScheme: const ColorScheme.light(
              secondary: Color.fromRGBO(72, 74, 126, 1),
            ),
          ),
        );
}
