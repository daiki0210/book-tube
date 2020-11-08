import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Output extends StatelessWidget {
  // <- (※1)
  var title = [
    '【12分で解説】学びを結果に変えるアウトプット大全 (Sanctuary books)【世界を変えるのはいつもアウトプット】',
    '【樺沢紫苑】「アウトプット大全」を世界一わかりやすく要約してみた【脳科学】',
    'アウトプット大全を書評&実践してみたよ！',
    '知識をつけたいならアウトプットが全て！ ７分で学ぶ『アウトプット大全』',
    '【アニメで】「アウトプット大全」を世界一わかりやすく要約してみた【本要約】',
    '【8分で解説】 学びを結果に変えるアウトプット大全（樺沢紫苑/著）',
  ];
  var thumbnail = [
    'https://i.ytimg.com/vi/PdyEIAOYH5w/maxresdefault.jpg',
    'https://i.ytimg.com/vi/_p4ZllRD0Ew/maxresdefault.jpg',
    'https://i.ytimg.com/vi/rOCZCqcub6o/maxresdefault.jpg',
    'https://i.ytimg.com/vi/ZRo6SGlT9Bk/maxresdefault.jpg',
    'https://i.ytimg.com/vi/5QtiLFb9kBA/maxresdefault.jpg',
    'https://i.ytimg.com/vi/QYofEnSgKMY/maxresdefault.jpg',
  ];
  var yotubeLinks = [
    'https://youtu.be/PdyEIAOYH5w',
    'https://youtu.be/_p4ZllRD0Ew',
    'https://youtu.be/rOCZCqcub6o',
    'https://youtu.be/ZRo6SGlT9Bk',
    'https://youtu.be/5QtiLFb9kBA',
    'https://youtu.be/QYofEnSgKMY',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('アウトプット大全'),
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
