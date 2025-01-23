import 'package:flutter/material.dart';
import 'package:toonflix/widgets/button.dart';

class InitialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void handleClickChangeScreen(String path) {
      Navigator.pushNamed(context, '/$path');
    }

    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => handleClickChangeScreen('life-cycle'),
                child: Text('LifeCycle'),
              ),
              TextButton.icon(
                onPressed: () => handleClickChangeScreen('stateful'),
                icon: Icon(Icons.forward, size: 18),
                label: Text("StateFul"),
              ),
              TextButton(
                onPressed: () => handleClickChangeScreen('card'),
                style:
                    TextButton.styleFrom(backgroundColor: Colors.amberAccent),
                child: Text('Card'),
              ),
              TextButton(
                onPressed: () => handleClickChangeScreen('pomodoro'),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.pink[200],
                ),
                child: Text('Pomodoro'),
              )
            ],
          )),
        ),
      ),
    );
  }
}
