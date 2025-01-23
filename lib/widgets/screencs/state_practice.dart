import 'package:flutter/material.dart';

class StatePractice extends StatefulWidget {
  @override
  // State<StatePractice> createState() {
  //   return _StatePractice();
  // }
  State<StatePractice> createState() {
    return _StatePractice();
  }
}

class _StatePractice extends State<StatePractice> {
  int counter = 0;
  List<int> numbers = [];

  void handleClickCounter() {
    setState(() {
      counter += 1;
      numbers.add(counter);
    });
  }

  void handleClickChange() {
    Navigator.pushNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => {Navigator.pushNamed(context, '/')},
            icon: Icon(Icons.arrow_back),
          ),
          title: Text('StateFul Widget Practice'),
          backgroundColor: Colors.yellow[100],
        ),
        backgroundColor: Color(0xfff4eddb),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Click Count',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                '$counter',
                style: TextStyle(fontSize: 20),
              ),
              for (var n in numbers) Text('$n'),
              IconButton(
                iconSize: 40,
                onPressed: handleClickCounter,
                icon: Icon(Icons.add_box),
              ),
              // IconButton(
              //   iconSize: 40,
              //   onPressed: handleClickChange,
              //   icon: Icon(Icons.change_circle),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
