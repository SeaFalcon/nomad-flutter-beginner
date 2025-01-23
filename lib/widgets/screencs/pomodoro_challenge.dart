import 'package:flutter/material.dart';
import 'package:toonflix/widgets/components/pomodoro_challenge_home.dart';

class PomodoroChallenge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFE7626C),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            color: Color(0xFF232B55),
          ),
        ),
        cardColor: const Color(0xFFF4EDDB),
      ),
      home: PomodoroChallengeHome(),
    );
  }
}
