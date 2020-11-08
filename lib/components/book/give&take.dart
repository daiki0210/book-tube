import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Give_Take extends StatelessWidget {
  // <- (※1)
  var title = [
    '【GIVE&TAKE①】与える人こそ成功する時代',
    '【GIVE&TAKE②】人当たりのいい戦略型テイカーの見分け方',
    '【11分で解説】GIVE & TAKE byアダム・グラント｜ギブしときゃ成功する、わけない',
    '【13分で解説】GIVE & TAKE 「与える人」こそ成功する時代（アダム・グラント / 著）',
  
  ];
  var thumbnail = [
    'https://i.ytimg.com/vi/qTW80vS7_BQ/maxresdefault.jpg',
    'https://i.ytimg.com/vi/ul89v4C1Pxg/maxresdefault.jpg',
    'https://i.ytimg.com/vi/dLCtXHvS3lc/sddefault.jpg',
    'https://i.ytimg.com/vi/ErRrynCHoOc/maxresdefault.jpg',
  ];
  var yotubeLinks = [
    'https://youtu.be/qTW80vS7_BQ',
    'https://youtu.be/ul89v4C1Pxg',
    'https://youtu.be/dLCtXHvS3lc',
    'https://youtu.be/ErRrynCHoOc',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GIVE&TAKE'),
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
