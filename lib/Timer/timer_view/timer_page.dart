import 'package:again_counter_through_bloc/Timer/bloc/timer_bloc.dart';
import 'package:again_counter_through_bloc/Timer/timer_view/timer_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../ticker.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TimerBloc(ticker: const Ticker()),
      child: const Center(
        child: TimerView(),
      ),
    );
  }
}
