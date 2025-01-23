import 'package:flutter/material.dart';

class StatePractice2 extends StatefulWidget {
  @override
  State<StatePractice2> createState() {
    return _StatePractice2();
  }
}

class _StatePractice2 extends State<StatePractice2> {
  int counter = 0;
  List<int> numbers = [];

  bool showTitle = false;

  void handleClickCounter() {
    setState(() {
      // counter += 1;
      // numbers.add(counter);
      showTitle = !showTitle;
    });
  }

  void handleClickChange() {
    Navigator.pushNamed(context, '/card');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => {Navigator.pushNamed(context, '/')},
            icon: Icon(Icons.arrow_back),
          ),
          title: Text('StateFul Widget LifeCycle'),
          backgroundColor: Colors.yellow[100],
        ),
        backgroundColor: Color(0xfff4eddb),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              showTitle ? MyLargeTitle() : Text('small title'),
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

class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<MyLargeTitle> {
  @override
  void initState() {
    super.initState();
    print('initState!');
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose!');
  }

  @override
  Widget build(BuildContext context) {
    print('build!');

    return Text(
      'My Large Title',
      style: TextStyle(
        fontSize: 30,
        color: Theme.of(context).textTheme.titleLarge?.color,
      ),
    );
  }
}
