// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TeamInfo extends StatefulWidget {
  final String name;
  final int age;
  final String country;
  final String description;
  const TeamInfo(
      {super.key,
      required this.name,
      required this.age,
      required this.country,
      required this.description});

  @override
  State<TeamInfo> createState() => _TeamInfoState();
}

class _TeamInfoState extends State<TeamInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Figther's Info"),
      ),
      body: Container(
        height: 800,
        margin: EdgeInsets.all(30),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          elevation: 5,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Column(
            children: [
              Stack(
                children: [
                  Hero(
                      tag: widget.name,
                      child: Image.asset("assets/people/${widget.name}.png")),
                  Container(
                    height: 345,
                    padding: const EdgeInsets.all(5.0),
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[
                          Colors.black.withOpacity(0),
                          Colors.black,
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${widget.name.toUpperCase()}",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 50,
                                color: Colors.white),
                          ),
                          Text(
                            "${widget.age}",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 50,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: SizedBox(
                        height: 60,
                        width: 60,
                        child: Image.asset(
                            "assets/countries/${widget.country}.png")),
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.all(13),
                child: Column(
                  children: [
                    Text(
                      "${widget.description}",
                      // textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: Colors.grey),
                    ),
                    Text("Country: ${widget.country}"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // ignore: prefer_const_literals_to_create_immutables
                    Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(
                                5.0,
                                5.0,
                              ),
                              blurRadius: 3.0,
                              spreadRadius: 0.5,
                            ), //BoxShadow
                            BoxShadow(
                              color: Colors.white,
                              offset: Offset(0.0, 0.0),
                              blurRadius: 0.0,
                              spreadRadius: 0.0,
                            ), //BoxShadow
                          ],
                        ),
                        child: IconButton(
                            iconSize: 40,
                            color: Colors.blue,
                            onPressed: () {},
                            icon: Icon(Icons.close))),
                    Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(
                                5.0,
                                5.0,
                              ),
                              blurRadius: 3.0,
                              spreadRadius: 0.5,
                            ), //BoxShadow
                            BoxShadow(
                              color: Colors.white,
                              offset: Offset(0.0, 0.0),
                              blurRadius: 0.0,
                              spreadRadius: 0.0,
                            ), //BoxShadow
                          ],
                        ),
                        child: IconButton(
                            iconSize: 40,
                            color: Colors.pink,
                            onPressed: () {},
                            icon: Icon(Icons.favorite)))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
