import 'dart:async';

import 'package:again_counter_through_bloc/Timer/ticker.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  final Ticker _ticker;
  static const int _duration = 60;
  StreamSubscription<int>? _tickerSubscription;
  TimerBloc({required Ticker ticker})
      : _ticker = ticker,
        super(TimerInitial(_duration)) {
    on<TimerEvent>((event, emit) {
      on<TimerStarted>(_timerStarted);
      on<TimerTicked>(_timerTicked);
      on<TimerPaused>(_timerPaused);
      on<TimerResumed>(_timerResumed);
      on<TimerReset>(_timerReset);
    });
  }
  void _timerReset(TimerReset event, Emitter<TimerState> emit) {
    _tickerSubscription?.cancel();
    emit(TimerInitial(_duration));
  }

  void _timerStarted(TimerStarted event, Emitter<TimerState> emit) {
    emit(TimerRunInProgress(event.duration));
    _tickerSubscription?.cancel();
    _tickerSubscription = _ticker.tick(event.duration).listen((duration) {
      add(TimerTicked(duration));
    });
  }

  void _timerTicked(TimerTicked event, Emitter<TimerState> emit) {
    emit(event.duration > 0
        ? TimerRunInProgress(event.duration)
        : const TimerRunComplete());
  }

  void _timerPaused(TimerPaused event, Emitter<TimerState> emit) {
    if (state is TimerRunInProgress) {
      _tickerSubscription?.pause();
      emit(TimerRunPause(state.duration));
    }
  }

  void _timerResumed(TimerResumed event, Emitter<TimerState> emit) {
    if (state is TimerRunPause) {
      _tickerSubscription?.resume();
      emit(TimerRunInProgress(state.duration));
    }
  }

  @override
  Future<void> close() async {
    _tickerSubscription?.cancel();
    super.close();
  }
}
