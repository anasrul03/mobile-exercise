// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Layout Training"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.red,
                  ),
                  flex: 2,
                ),
                Expanded(
                  child: Container(
                    color: Colors.yellow,
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: Container(
                    color: Colors.green,
                  ),
                  flex: 1,
                ),
              ],
            ),
            flex: 8,
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.amber,
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: Container(
                    color: Colors.black,
                  ),
                  flex: 3,
                ),
                Expanded(
                  child: Container(
                    color: Colors.brown,
                  ),
                  flex: 1,
                ),
              ],
            ),
            flex: 2,
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.purple,
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: Container(
                    color: Colors.pink,
                  ),
                  flex: 1,
                ),
              ],
            ),
            flex: 2,
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.blue,
                  ),
                  flex: 2,
                ),
              ],
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }
}
