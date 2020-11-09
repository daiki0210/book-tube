import 'package:book_summarizer_app/components/movie/screens/video_screen.dart';
import 'package:flutter/material.dart';

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
    'PdyEIAOYH5w',
    '_p4ZllRD0Ew',
    'rOCZCqcub6o',
    'ZRo6SGlT9Bk',
    '5QtiLFb9kBA',
    'QYofEnSgKMY',
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
