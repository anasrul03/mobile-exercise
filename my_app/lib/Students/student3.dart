import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Component/toMarkPage.dart';

class Student3 extends StatelessWidget {
  final String? name;

  const Student3({super.key, required this.name});

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
                  "Wanda Maximoff is a fictional character primarily portrayed by Elizabeth Olsen in the Marvel Cinematic Universe (MCU) media franchise based on the Marvel Comics character of the same name. Wanda is initially depicted as a Sokovian refugee who, along with her twin brother Pietro, volunteers to be experimented on by Hydra."),
              CachedNetworkImage(
                  height: 400,
                  width: 300,
                  imageUrl:
                      "https://www.disneyfoodblog.com/wp-content/uploads/2022/07/scarlet-witch-wanda-maximoff.png",
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
