import 'package:book_summarizer_app/components/movie/screens/video_screen.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  // <- (※1)
  var title = [
    '【嫌われる勇気】トラウマは存在しない',
    '【12分で解説】エッセンシャル思考①【8割捨てろ】',
    '【9分で解説】ミスをしない人の脳の習慣【ワーキングメモリ鍛える方法】',
    '【5分で図解】直観力 メンタリストDaiGo著',
    '【7つの習慣①】',
    '【19分で解説】イシューからはじめよ丨仕事が100分の1になる思考法'
  ];
  var thumbnail = [
    'https://i.ytimg.com/vi/N-fT1KjtGGA/maxresdefault.jpg',
    'https://www.enjoylifework.com/wp-content/uploads/4872.jpg',
    'https://i.ytimg.com/vi/I1IR-XJPw0M/hqdefault.jpg?sqp=-oaymwEXCOADEI4CSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLC6rp-ouYhWzqBCNPn_4EWvSqAlmg',
    'https://i.ytimg.com/vi/m_oax11xHwk/hqdefault.jpg?sqp=-oaymwEXCOADEI4CSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLA5h7B0lUrtw2sUnA9O5vUZU4bx7A',
    'https://i.ytimg.com/vi/HaTDjEhdDfc/maxresdefault.jpg',
    'https://i.ytimg.com/vi/NyhGDT26yno/maxresdefault.jpg'
  ];
  var linkImages = [
    'N-fT1KjtGGA&t=29s',
    'BA9n_JJEcwI',
    'I1IR-XJPw0M',
    'm_oax11xHwk',
    'HaTDjEhdDfc',
    'NyhGDT26yno'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BOOKTUBE',
            textAlign: TextAlign.left, style: TextStyle(color: Colors.black54)),
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.black38),
                ),
              ),
              child: ListTile(
                  title: Image.network('${thumbnail[index]}'),
                  subtitle: Text('${title[index]}',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  onTap: () => Navigator.push(
                    context, MaterialPageRoute(builder: (context) => VideoScreen(id: linkImages[index]))),
                  ));
        },
        itemCount: title.length,
      ),
    );
  }
}
