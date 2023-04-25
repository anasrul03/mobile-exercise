// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:my_app/layoutExercise.dart';

class Exercise extends StatelessWidget {
  const Exercise({super.key});

  void showSnack(BuildContext context, String? title, Color snackbarColor) {
    final snackBar = SnackBar(
      backgroundColor: snackbarColor,
      content: Text(title!),
      showCloseIcon: true,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    // Find the ScaffoldMessenger in the widget tree
    // and use it to show a SnackBar.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('My Layout'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [
            0.1,
            0.4,
            0.6,
            0.9,
          ],
          colors: [
            Colors.yellow,
            Colors.red,
            Colors.indigo,
            Colors.teal,
          ],
        )),
        padding: EdgeInsets.all(20),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Welcome to My Layout!",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FlutterLogo(
                        size: 80,
                      ),
                      FlutterLogo(
                        size: 80,
                      ),
                      FlutterLogo(
                        size: 80,
                      )
                    ],
                  ),
                ),
                Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 20),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {
                          showSnack(
                              context, "Favorite is pressed1", Colors.red);
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 50,
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            showSnack(
                                context, "Star is Pressed!", Colors.yellow);
                          },
                          icon: Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 50,
                          )),
                      IconButton(
                          onPressed: () {
                            showSnack(
                                context, "Thumbs up is pressed!", Colors.blue);
                          },
                          icon: Icon(
                            Icons.thumb_up,
                            color: Colors.blue,
                            size: 50,
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Layout()),
                      );
                    },
                    child: Text("To next exercise")),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Created by Anas",
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
