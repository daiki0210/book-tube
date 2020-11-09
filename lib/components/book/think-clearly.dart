import 'package:book_summarizer_app/components/movie/screens/video_screen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Think_Clearly extends StatelessWidget {
  // <- (※1)
  var title = [
    '【Think clearly①】取捨選択で人生をクリアに',
    '【Think clearly②】嫌な仕事は断れ！本音を出すな！',
    '【Think clearly③】大きすぎる夢を持つな！',
    'ベストセラー『Think Clearly』を6分で解説',
    '【アニメで】「Think clearly」を世界一わかりやすく要約してみた Part1【本要約】',
    '【アニメで】「Think clearly」を世界一わかりやすく要約してみたPart2【本要約】',
    '【アニメで】「Think clearly」を世界一わかりやすく要約してみたPart3【本要約】'

  ];
  var thumbnail = [
    'https://i.ytimg.com/vi/OEAoBN3A0gs/maxresdefault.jpg',
    'https://i.ytimg.com/vi/76gZpZsjKGQ/maxresdefault.jpg',
    'https://i.ytimg.com/vi/62_Zz9Ssr8Q/maxresdefault.jpg',
    'https://i.ytimg.com/vi/xEAgKYcqbys/maxresdefault.jpg',
    'https://i.ytimg.com/vi/-r80xuXtzjw/maxresdefault.jpg',
    'https://i.ytimg.com/vi/s4FexbPpjok/maxresdefault.jpg',
    'https://i.ytimg.com/vi/bzcdKuRy8ig/maxresdefault.jpg'

  ];
  var yotubeLinks = [
    'OEAoBN3A0gs',
    '76gZpZsjKGQ',
    '62_Zz9Ssr8Q',
    'xEAgKYcqbys',
    '-r80xuXtzjw',
    's4FexbPpjok',
    'bzcdKuRy8ig'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Think Clearly'),
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
