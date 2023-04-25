import 'package:flutter/material.dart';

class BackButton extends StatelessWidget {
  const BackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        child: Text("Back"),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
