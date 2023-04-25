import 'package:flutter/material.dart';

class Square extends StatefulWidget {
  const Square({super.key});

  @override
  State<Square> createState() => _SquareState();
}

class _SquareState extends State<Square> {
  int _selectedIndex = 0;
  Color getBackgroundColor() {
    if (_selectedIndex == 0) {
      return Colors.amber;
    } else if (_selectedIndex == 1) {
      return Colors.blue;
    } else {
      return const Color.fromARGB(255, 87, 0, 54);
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> squares = <Widget>[
      InkWell(
        onTap: () {
          setState(() {
            _selectedIndex = 2;
          });
        },
        child: Card(
          child: Container(
            child: Text("index $_selectedIndex"),
            height: 150,
            width: 150,
            color: getBackgroundColor(),
          ),
        ),
      ),
      InkWell(
        onTap: () {
          setState(() {
            _selectedIndex = 0;
          });
        },
        child: Card(
          child: Container(
            child: Text("index $_selectedIndex"),
            height: 150,
            width: 150,
            color: getBackgroundColor(),
          ),
        ),
      ),
      InkWell(
        onTap: () {
          setState(() {
            _selectedIndex = 1;
          });
        },
        child: Card(
          child: Container(
            child: Text("index $_selectedIndex"),
            height: 150,
            width: 150,
            color: getBackgroundColor(),
          ),
        ),
      ),
    ];

    return Scaffold(
        appBar: AppBar(
          title: Text("State Management"),
        ),
        body: Center(
          child: squares.elementAt(_selectedIndex),
        ));
  }
}
