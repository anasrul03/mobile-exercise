// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../exerciseUI.dart';

class NaviButton extends StatelessWidget {
  final String? title;
  final String? routeTo;
  const NaviButton({
    super.key,
    required this.title,
    this.routeTo,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            // style: ButtonStyle(backgroundColor: ),
            child: Text(
              title!,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(routeTo!);
            },
          ),
        ],
      ),
    );
  }
}
