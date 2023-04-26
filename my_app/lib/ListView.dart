import 'package:flutter/material.dart';

class ListCard extends StatefulWidget {
  const ListCard({super.key});

  @override
  State<ListCard> createState() => _ListCardState();
}

class _ListCardState extends State<ListCard> {
  Widget getCard(int number) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Icon(Icons.supervised_user_circle_sharp),
                flex: 1,
              ),
              Expanded(
                child: Text("number is $number"),
                flex: 3,
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List View & Scroll"),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return getCard(index);
        },
      ),
    );
  }
}
