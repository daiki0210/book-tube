import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  // <- (※1)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("検索"), // <- (※2)
      ),
      body: Center(child: Text("検索") // <- (※3)
          ),
    );
  }
}
