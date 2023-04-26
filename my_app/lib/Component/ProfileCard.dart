// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:my_app/teamInfoPage.dart';

class ProfileCard extends StatefulWidget {
  const ProfileCard(
      {super.key,
      required this.name,
      required this.country,
      required this.image,
      required this.description,
      required this.age});
  final String name;
  final String country;
  final String image;
  final String description;
  final int age;
  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  double cardWidth = 200;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => TeamInfo(
                  name: widget.name,
                  age: widget.age,
                  country: widget.country,
                  description: widget.description)));
        },
        child: Container(
          width: cardWidth,
          height: 300,
          child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Column(
              children: [
                SizedBox(
                  width: cardWidth,
                  height: 200,
                  child: Hero(
                    tag: widget.name,
                    child: Image.asset(
                      widget.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Column(children: [
                  Text(
                    widget.name.toUpperCase(),
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    widget.country.toUpperCase(),
                    style: TextStyle(fontStyle: FontStyle.italic, fontSize: 10),
                  )
                ])
              ],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 5,
            margin: EdgeInsets.all(10),
          ),
        ),
      ),
    ]);
  }
}
