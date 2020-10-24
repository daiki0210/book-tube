import 'package:flutter/material.dart';

class Video extends StatelessWidget {
  // <- (※1)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("動画"), // <- (※2)
      ),
      body: Center(child: Text("動画") // <- (※3)
          ),
    );
  }
}
