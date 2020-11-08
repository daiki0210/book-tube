import 'package:book_summarizer_app/components/movie/screens/video_screen.dart';
import 'package:flutter/material.dart';

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
    'qTW80vS7_BQ',
    'ul89v4C1Pxg',
    'dLCtXHvS3lc',
    'ErRrynCHoOc',
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
