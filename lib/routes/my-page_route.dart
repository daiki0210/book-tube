import 'package:flutter/material.dart';

class Mypage extends StatelessWidget {
  // <- (※1)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("マイページ"), // <- (※2)
      ),
      body: Center(child: Text("マイぺージ") // <- (※3)
          ),
    );
  }
}
