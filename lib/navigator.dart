import 'package:flutter/material.dart';
import 'dice_roller.dart';
import 'package:lokaverk/Vitni/Vitni.dart';

class BottomNavigatorBar extends StatelessWidget {
  const BottomNavigatorBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BottomNavigator(),
    );
  }
}

class BottomNavigator extends StatefulWidget {
  const BottomNavigator({super.key});

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Column(
      children: [
        DiceRoller(),
        Vitni(),
      ],
    ),
    Text(
      'Eldri köst',
      style: optionStyle,
    ),
    Text(
      'Sérstakar þakkir: Arnar og Daníel',
      style: optionStyle,
    ),
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
        title: const Text('Teningakast Reglu'),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
        toolbarHeight: 30,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      backgroundColor: Colors.blueAccent,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.orangeAccent,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.casino_outlined),
            label: 'Kast',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_sharp),
            label: 'Eldri köst',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Þakkir',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
