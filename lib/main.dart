import 'package:again_counter_through_bloc/app.dart';
import 'package:again_counter_through_bloc/counter_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = CounterObserver();
  runApp(const CounterApp());
}
