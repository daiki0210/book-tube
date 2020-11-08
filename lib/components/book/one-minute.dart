import 'package:book_summarizer_app/components/movie/screens/video_screen.dart';
import 'package:flutter/material.dart';

class One_Minute extends StatelessWidget {
  // <- (※1)
  var title = [
   '【11分で解説】1分で話せ【あの孫さんも認めたプレゼン術】',
   '1分で話せ！すぐできる、うまいプレゼン3つのコツ',
   '【本要約】世界のトップが絶賛した大事なことだけシンプルに伝える技術　1分で話せ［書評］',
   '【8分で解説】「1分で話せ」（伊藤羊一/著)',
   '「1分で話せ」を書評&実践してみたよ！'
  ];
  var thumbnail = [
    'https://i.ytimg.com/vi/453CGnY_yEw/maxresdefault.jpg',
    'https://i.ytimg.com/vi/sj2VROS9bBU/maxresdefault.jpg',
    'https://i.ytimg.com/vi/_OxcseoH7ds/maxresdefault.jpg',
    'https://i.ytimg.com/vi/Mz3csfN82OI/maxresdefault.jpg',
    'https://i.ytimg.com/vi/KVNuLxjqjUw/maxresdefault.jpg'
  ];
  var yotubeLinks = [
    '453CGnY_yEw',
    'sj2VROS9bBU',
    '_OxcseoH7ds',
    'Mz3csfN82OI',
    'KVNuLxjqjUw'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('1分で話せ'),
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
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            VideoScreen(id: yotubeLinks[index]))),
              ));
        },
        itemCount: title.length,
      ),
    );
  }
}
