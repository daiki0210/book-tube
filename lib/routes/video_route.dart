import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Video extends StatelessWidget {
  // <- (※1)
  var title = [
    '【嫌われる勇気】トラウマは存在しない',
    '【12分で解説】エッセンシャル思考①【8割捨てろ】',
    '【9分で解説】ミスをしない人の脳の習慣【ワーキングメモリ鍛える方法】',
    '【5分で図解】直観力 メンタリストDaiGo著',
    '【7つの習慣①】'
  ];
  var thumbnail = [
    'https://i.ytimg.com/vi/N-fT1KjtGGA/maxresdefault.jpg',
    'https://www.enjoylifework.com/wp-content/uploads/4872.jpg',
    'https://i.ytimg.com/vi/I1IR-XJPw0M/hqdefault.jpg?sqp=-oaymwEXCOADEI4CSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLC6rp-ouYhWzqBCNPn_4EWvSqAlmg',
    'https://i.ytimg.com/vi/m_oax11xHwk/hqdefault.jpg?sqp=-oaymwEXCOADEI4CSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLA5h7B0lUrtw2sUnA9O5vUZU4bx7A',
    'https://i.ytimg.com/vi/HaTDjEhdDfc/maxresdefault.jpg'
  ];
  var linkImages = [
    'https://youtu.be/N-fT1KjtGGA',
    'https://youtu.be/BA9n_JJEcwI',
    'https://youtu.be/I1IR-XJPw0M',
    'https://youtu.be/m_oax11xHwk',
    'https://youtu.be/HaTDjEhdDfc'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('動画'),
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
                  onTap: () => launch('${linkImages[index]}')));
        },
        itemCount: title.length,
      ),
    );
  }
}