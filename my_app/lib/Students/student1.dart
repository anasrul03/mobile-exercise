import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Component/toMarkPage.dart';

class Student1 extends StatelessWidget {
  final String? name;

  const Student1({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name!),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              Text(
                  "Dame Agatha Mary Clarissa Christie, Lady Mallowan, DBE was an English writer known for her 66 detective novels and 14 short story collections, particularly those revolving around fictional detectives Hercule Poirot and Miss Marple."),
              CachedNetworkImage(
                  height: 500,
                  width: 300,
                  imageUrl:
                      "https://t1.gstatic.com/licensed-image?q=tbn:ANd9GcQjbyms28vCHaQca-yxyxL4o0PQqCpFzQAnUCWFrr055qENhxn0F33cuK5m881_epPAdv3nADKqaeVwERY",
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(
                        color: Colors.blue,
                      ),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.error)),
              ToMarkPage(),
              BackButton(),
            ],
          ),
        ),
      ),
    );
  }
}
