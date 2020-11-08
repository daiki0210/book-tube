import 'package:book_summarizer_app/components/movie/screens/video_screen.dart';
import 'package:flutter/material.dart';

class Life_Shift extends StatelessWidget {
  // <- (※1)
  var title = [
    '【18分で解説】LIFE SHIFT(ライフシフト)｜人生100年時代のサラリーマン生存戦略',
    '【7分で解説】「LIFE SHIFT / ライフシフト」を世界一わかりやすく要約してみた【本要約】',
    '【14分で解説】LIFE SHIFTライフ・シフト１００年時代の人生戦略 前編（リンダ グラットン / 著）'
  ];
  var thumbnail = [
    'https://i.ytimg.com/vi/3vhbX2CcXmg/maxresdefault.jpg',
    'https://i.ytimg.com/vi/bsKowpYzrio/maxresdefault.jpg',
    'https://i.ytimg.com/vi/Q5PbrO7U3-U/maxresdefault.jpg',
  ];
  var yotubeLinks = [
    '3vhbX2CcXmg',
    'bsKowpYzrio',
    'Q5PbrO7U3-U'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LIFE SHIFT'),
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
