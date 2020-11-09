import 'package:book_summarizer_app/components/movie/screens/video_screen.dart';
import 'package:flutter/material.dart';

class How_Do_You_Live extends StatelessWidget {
  // <- (※1)
  var title = [
   '【君たちはどう生きるか①】〜歴史的名著「君たちはどう生きるか」2018年一番読まれた本を中田が解説〜',
   '【君たちはどう生きるか②】〜勉強・発見・貧乏・ありがたい・偉大な人とは何か？〜',
   '【君たちはどう生きるか③】〜過ちを乗り越えた先にある真理とは？〜',
   '【7分で解説】君たちはどう生きるか【歴史的名著】世界に中心などない',
   '【10分で分かる「君たちはどう生きるか」】人生をよくする４つの大切な視点とは？'
   '【アニメで】「君たちはどう生きるか」を世界一わかりやすく要約してみた【本要約】',
   '【8分で解説】漫画 君たちはどう生きるか（吉野源三郎、羽賀翔一 / 著）'
  ];
  var thumbnail = [
    'https://i.ytimg.com/vi/0OntLo9AM2w/maxresdefault.jpg',
    'https://i.ytimg.com/vi/NukUvUGMcCI/maxresdefault.jpg',
    'https://i.ytimg.com/vi/lp1VKcEnpO0/maxresdefault.jpg',
    'https://i.ytimg.com/vi/sOV5kSAbRzo/maxresdefault.jpg',
    'https://i.ytimg.com/vi/nrBL-FNkEcg/maxresdefault.jpg',
    'https://i.ytimg.com/vi/JZqwSBmxDT4/hqdefault.jpg',
    'https://i.ytimg.com/vi/kbqTWv3HpNs/maxresdefault.jpg'

  ];
  var yotubeLinks = [
    '0OntLo9AM2w',
    'NukUvUGMcCI',
    'lp1VKcEnpO0',
    'sOV5kSAbRzo',
    'nrBL-FNkEcg',
    'JZqwSBmxDT4',
    'kbqTWv3HpNs',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('君たちはどう生きるか'),
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
