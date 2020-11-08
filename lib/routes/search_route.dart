import 'package:flutter/material.dart';
import 'package:book_summarizer_app/components/book/hite.dart';
import 'package:book_summarizer_app/components/book/the-7-hobits.dart';
import 'package:book_summarizer_app/components/book/think-clearly.dart';
import 'package:book_summarizer_app/components/book/one-minute.dart';
import 'package:book_summarizer_app/components/book/how-do-you-live.dart';
import 'package:book_summarizer_app/components/book/give&take.dart';
import 'package:book_summarizer_app/components/book/lifeshift.dart';
import 'package:book_summarizer_app/components/book/output.dart';
import 'package:book_summarizer_app/components/book/factfulness.dart';
import 'package:book_summarizer_app/components/book/who-moved-my-cheese.dart';

class Search extends StatelessWidget {
  // <- (※1)
  var bookTitle = [
    '嫌われる勇気',
    '七つの習慣',
    'Think Crealy',
    '1分で話せ',
    '君たちはどう生きるか',
    'GIVE&TAKE',
    'LIFE SHIFT',
    'アウトプット大全',
    'FACT FULNESS',
    'チーズはどこへ消えた?'
  ];
  var bookCoverList = [
    'https://images-na.ssl-images-amazon.com/images/I/71uQVPeynWL.jpg',
    'https://images-na.ssl-images-amazon.com/images/I/71laXZxNTfL.jpg',
    'https://images-na.ssl-images-amazon.com/images/I/51FSTYdEllL._SX339_BO1,204,203,200_.jpg',
    'https://images-na.ssl-images-amazon.com/images/I/51OnVZ6yUJL._SX339_BO1,204,203,200_.jpg',
    'https://ps.nikkei.co.jp/bookreview/image-book/201802/201802-book-08.png',
    'https://images-fe.ssl-images-amazon.com/images/I/51zlMpFCCSL._AC_UL600_SR408,600_.jpg',
    'https://res.booklive.jp/398531/001/thumbnail/2L.jpg',
    'https://images-na.ssl-images-amazon.com/images/I/81ng7NJ-3fL.jpg',
    'https://www.ehonnavi.net/img/cover/500/500_Ehon_128662.jpg',
    'https://images-na.ssl-images-amazon.com/images/I/41X08M5EC2L._SX331_BO1,204,203,200_.jpg'
  ];
  var dartList = [Hite(), The_7_Hobits(), Think_Clearly(), One_Minute(), How_Do_You_Live(), Give_Take(), Life_Shift(), Output(), Fuctfulness(), Who_Moved_My_Cheese()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BOOKTUBE', textAlign: TextAlign.left, style: TextStyle(color: Colors.black54)),
         backgroundColor: Colors.white,
      ),
      body: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return FlatButton(
              onPressed: () => Navigator.push(
                    context, MaterialPageRoute(builder: (context) => dartList[index])),
                child: Card(
                  child: Row(
                    children: [
                      Padding(padding: EdgeInsets.only(right: 15),
                              child: Image.network(bookCoverList[index], height: 140,),
                      ),
                    Column(
                      children: [
                        Text(bookTitle[index], textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 18,)),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
          itemCount: bookTitle.length,
        ),
    );
  }
}
