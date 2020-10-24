import 'package:flutter/material.dart';

class Ranking extends StatelessWidget {
  // <- (※1)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ランキング"), // <- (※2)
      ),
      body: Center(child: Text("ランキング") // <- (※3)
          ),
    );
  }
}
