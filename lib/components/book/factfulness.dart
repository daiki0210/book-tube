import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Fuctfulness extends StatelessWidget {
  // <- (※1)
  var title = [
    '【FACTFULNESS①】データを基に世界を正しく見る　〜ビル・ゲイツやオバマ元大統領が大絶賛した名著',
    '【FACTFULNESS②】悪い状況と良くなっている傾向は両立できる 〜現状だけを見て叩くのは誰の得策にもならない！',
    '【FACTFULNESS③】事実を基に行動すれば人類の未来はもっと前に進める',
    '【９分で解説】ファクトフルネス【歪められた世界を見ている私たち】',
    '【11分で解説】「ファクトフルネス」を世界一わかりやすく要約してみた【本要約】',
    '話題の本「ファクトフルネス（FACTFULNESS）」を5分で簡単解説！',
  ];
  var thumbnail = [
    'https://i.ytimg.com/vi/zGKLgcTn7YY/maxresdefault.jpg',
    'https://i.ytimg.com/vi/3L-JFZraI_I/maxresdefault.jpg',
    'https://i.ytimg.com/vi/WRq1A_jeLKQ/maxresdefault.jpg',
    'https://i.ytimg.com/vi/RwQ_Yp8cDlI/maxresdefault.jpg',
    'https://i.ytimg.com/vi/ilRLmILochM/maxresdefault.jpg',
    'https://i.ytimg.com/vi/CC36fQ53Kg8/maxresdefault.jpg',
  ];
  var yotubeLinks = [
    'https://youtu.be/zGKLgcTn7YY',
    'https://youtu.be/3L-JFZraI_I',
    'https://youtu.be/WRq1A_jeLKQ',
    'https://youtu.be/RwQ_Yp8cDlI',
    'https://youtu.be/ilRLmILochM',
    'https://youtu.be/CC36fQ53Kg8',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FACT FLUNESS'),
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
                  onTap: () => launch('${yotubeLinks[index]}')));
        },
        itemCount: title.length,
      ),
    );
  }

}
