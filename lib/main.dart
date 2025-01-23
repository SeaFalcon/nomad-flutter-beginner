import 'package:flutter/material.dart';
import 'package:toonflix/widgets/card_practice.dart';
import 'package:toonflix/widgets/initialPage.dart';
import 'package:toonflix/widgets/state_practice.dart';
import 'package:toonflix/widgets/state_practice2.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': ((context) => InitialPage()),
      '/life-cycle': ((context) => StatePractice2()),
      '/stateful': ((context) => StatePractice()),
      '/card': ((context) => CardPractice()),
      // '/pomodoro': ((context) => Pomodoro()),
    },
  ));
}
