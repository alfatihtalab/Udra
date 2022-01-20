import 'package:flutter/material.dart';

class BottomNavPage extends StatefulWidget {
  const BottomNavPage({Key? key}) : super(key: key);

  @override
  _BottomNavPageState createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  int _selectedIndex = 0;
  static List<Widget> pages = [
    // TODO: Replace with Card1
    Container(
      color: Colors.orange,
    ),
// TODO: Replace with Card2
    Container(
      color: Colors.green,
    ),
// TODO: Replace with Card3
    Container(
      color: Colors.blueGrey,
    ),
    Container(
      color: Colors.blueGrey,
    ),
    Container(
      color: Colors.blueGrey,
    )
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UDRA center'),
      ),
      body: SafeArea(
        child: pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_repair_service),
            label: 'services',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.find_in_page_sharp),
            label: 'chances',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.amp_stories),
            label: 'stories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'projects',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
