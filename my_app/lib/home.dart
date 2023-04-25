// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:my_app/Component/studentCard.dart';

class Home extends StatelessWidget {
  final String? routeTo;
  const Home({super.key, this.routeTo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigator & Routes"),
      ),
      body: Column(
        children: [
          StudentCard(
            studentAge: 104,
            studentName: 'Agatha Christie',
            routeTo: '/agatha',
          ),
          StudentCard(
            studentAge: 80,
            studentName: 'Albert Einstein',
            routeTo: '/albert',
          ),
          StudentCard(
            studentAge: 34,
            studentName: 'Wanda Maximoff',
            routeTo: '/wanda',
          )
        ],
      ),
    );
  }
}
