part of 'timer_bloc.dart';

abstract class TimerState extends Equatable {
  final int duration;
  const TimerState(this.duration);

  @override
  List<Object> get props => [duration];
}

class TimerInitial extends TimerState {
  TimerInitial(super.duration);

  @override
  String toString() => 'initial {duration : $duration}';
}

class TimerRunPause extends TimerState {
  const TimerRunPause(super.duration);
  @override
  String toString() => 'timerRunPause {duration : $duration}';
}

class TimerRunInProgress extends TimerState {
  const TimerRunInProgress(super.duration);
  @override
  String toString() => 'timer run in progress {duration : $duration}';
}

class TimerRunComplete extends TimerState {
  const TimerRunComplete() : super(0);

  @override
  String toString() => 'timer complete {duration : 0}';
}
