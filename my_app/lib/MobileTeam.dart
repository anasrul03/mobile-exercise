// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/Component/ProfileCard.dart';

//
class MobileDev extends StatefulWidget {
  const MobileDev({super.key});

  @override
  State<MobileDev> createState() => _MobileDevState();
}

class _MobileDevState extends State<MobileDev> {
  List _teamInfo = [];
  List<String> besquare = [
    'https://deriv.com/static/77875bf4226f9676f870358dc888d1a7/b7312/participant1.webp',
    'https://deriv.com/static/hero-154b76f1ab611afd2479cb5159027ee9.png',
    'https://deriv.com/static/907fa59c248378ad0074b5c12fe6b048/b7312/participant2.webp'
  ];
  // Fetch content from the json file
  Future<void> readJson() async {
    // print("reading JSON");
    final String response =
        await rootBundle.loadString('assets/team_info.json');
    final data = await json.decode(response);
    setState(() {
      _teamInfo = data["team_info"];
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text("Mobile Team"),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                    itemCount: 3,
                    pageSnapping: true,
                    itemBuilder: (context, index) {
                      return Container(
                          margin: EdgeInsets.all(10),
                          child: CachedNetworkImage(imageUrl: besquare[index]));
                    }),
              ),
              Text(
                "Choose your fighter",
                style: TextStyle(fontSize: 20),
              ),
              Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _teamInfo.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ProfileCard(
                        name: _teamInfo[index]['name'],
                        country: _teamInfo[index]['country'],
                        image: "assets/people/${_teamInfo[index]['name']}.png",
                        age: _teamInfo[index]['age'],
                        description: _teamInfo[index]['description'],
                      );
                    }),
              ),
            ],
          ),
        ));
  }
}
