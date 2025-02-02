import 'package:flutter/material.dart';
import 'package:toonflix/widgets/components/movieflix_main.dart';

class Movieflix extends StatefulWidget {
  const Movieflix({super.key});

  @override
  State<Movieflix> createState() => _MovieflixState();
}

class _MovieflixState extends State<Movieflix> {
  int _selectedIndex = 0;
  // 탭에 따른 화면
  final List<Widget> _screens = [
    MovieflixMain(),
    Center(child: Text('Home Screen', style: TextStyle(fontSize: 24))),
    Center(child: Text('Search Screen', style: TextStyle(fontSize: 24))),
    Center(child: Text('Profile Screen', style: TextStyle(fontSize: 24))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Movieflix'),
        ),
        body: _screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.movie_filter_outlined), label: 'Movieflix'),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          iconSize: 30,
          selectedIconTheme: IconThemeData(color: Colors.green),
        ),
      ),
    );
  }
}
