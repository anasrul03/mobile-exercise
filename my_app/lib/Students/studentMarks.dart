import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Marks extends StatelessWidget {
  final String? name;

  const Marks({super.key, this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Marks"),
      ),
      body: Container(
        child: CachedNetworkImage(
            imageUrl:
                "https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Marilyn_Monroe_Birth_Certificate_original.jpg/578px-Marilyn_Monroe_Birth_Certificate_original.jpg"),
      ),
    );
  }
}
