import 'package:flutter/material.dart';
import 'package:book_summarizer_app/routes/hite.dart';

class Home extends StatelessWidget {
  // <- (※1)
  var title = ['嫌われる勇気', '七つの習慣', 'Think Crealy'];
  var bookList = [
    'https://images-na.ssl-images-amazon.com/images/I/71uQVPeynWL.jpg',
    'https://images-na.ssl-images-amazon.com/images/I/71laXZxNTfL.jpg',
    'https://images-na.ssl-images-amazon.com/images/I/51FSTYdEllL._SX339_BO1,204,203,200_.jpg',
    '',
    ''
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ホーム'),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Container(
              height: 150,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.black38),
                ),
              ),
              child: ListTile(
                leading: Image.network('${bookList[index]}'),
                title: Text('${title[index]}'),
                subtitle: Text('&listItem'),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Hite()));
                },
              ));
        },
        itemCount: title.length,
      ),
    );
  }
}
