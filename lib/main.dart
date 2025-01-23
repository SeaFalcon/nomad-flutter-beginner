import 'package:flutter/material.dart';
import 'package:toonflix/widgets/screencs/card_practice.dart';
import 'package:toonflix/widgets/initialPage.dart';
import 'package:toonflix/widgets/screencs/flipclock.dart';
import 'package:toonflix/widgets/screencs/pomodoro.dart';
import 'package:toonflix/widgets/screencs/pomodoro_challenge.dart';
import 'package:toonflix/widgets/screencs/state_practice.dart';
import 'package:toonflix/widgets/screencs/state_practice2.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': ((context) => InitialPage()),
      '/life-cycle': ((context) => StatePractice2()),
      '/stateful': ((context) => StatePractice()),
      '/card': ((context) => CardPractice()),
      '/pomodoro': ((context) => Pomodoro()),
      '/pomodoro-challenge': ((context) => PomodoroChallenge()),
      '/flip-clock': ((context) => FlipClock()),
    },
  ));
}
