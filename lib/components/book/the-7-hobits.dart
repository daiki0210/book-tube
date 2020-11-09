import 'package:book_summarizer_app/components/movie/screens/video_screen.dart';
import 'package:flutter/material.dart';

class The_7_Hobits extends StatelessWidget {
  // <- (※1)
  var title = [
    '【14分で解説】7つの習慣｜King of 自己啓発',
    '【7つの習慣①】',
    '【7つの習慣②】',
    '【7つの習慣③】',
    '【7つの習慣④】',
    '【7つの習慣⑤】',
    '【7つの習慣⑥】',
    'ロングセラー本「7つの習慣」を7分で簡単解説！'
  ];
  var thumbnail = [
    'https://i.ytimg.com/vi/21aJYzS_Sxc/maxresdefault.jpg',
    'https://i.ytimg.com/vi/HaTDjEhdDfc/maxresdefault.jpg',
    'https://i.ytimg.com/vi/EE-yUv66eVo/maxresdefault.jpg',
    'https://i.ytimg.com/vi/PIi1k3DpgCw/maxresdefault.jpg',
    'https://i.ytimg.com/vi/MbIGisQzw4c/mqdefault.jpg',
    'https://i.ytimg.com/vi/vkV1snsAQt8/maxresdefault.jpg',
    'https://i.ytimg.com/vi/ReJAtOg2aAI/maxresdefault.jpg',
    'https://i.ytimg.com/vi/OXK8WF7uF_Y/maxresdefault.jpg'
  ];
  var yotubeLinks = [
    '21aJYzS_Sxc',
    'HaTDjEhdDfc',
    'EE-yUv66eVo',
    'PIi1k3DpgCw',
    'MbIGisQzw4c',
    'vkV1snsAQt8',
    'ReJAtOg2aAI',
    'OXK8WF7uF_Y'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('七つの習慣'),
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
