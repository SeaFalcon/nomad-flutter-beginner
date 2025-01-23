import 'package:flutter/material.dart';
import 'package:toonflix/main.dart';

class PomodoroHome extends StatefulWidget {
  const PomodoroHome({
    super.key,
  });

  @override
  State<PomodoroHome> createState() => _PomodoroHomeState();
}

class _PomodoroHomeState extends State<PomodoroHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).padding.bottom,
        color: Theme.of(context).cardColor,
      ),
      body: SafeArea(
          child: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                '25:00',
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 89,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Center(
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.play_circle_outlined),
                iconSize: 120,
                color: Theme.of(context).cardColor,
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Pomodoros',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .color,
                          ),
                        ),
                        Text(
                          '0',
                          style: TextStyle(
                            fontSize: 58,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
