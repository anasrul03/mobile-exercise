import 'package:flutter/material.dart';

class ToMarkPage extends StatelessWidget {
  const ToMarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        child: Text("Marks"),
        onPressed: () {
          Navigator.of(context).pushNamed('/marks');
        },
      ),
    );
  }
}
