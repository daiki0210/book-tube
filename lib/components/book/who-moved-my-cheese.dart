import 'package:book_summarizer_app/components/movie/screens/video_screen.dart';
import 'package:flutter/material.dart';

class Who_Moved_My_Cheese extends StatelessWidget {
  // <- (※1)
  var title = [
    '【18分で解説】チーズはどこへ消えた?｜変化がどうしても怖いあなたに',
    '現状に満足してない人必見の1冊 ８分で学ぶ『チーズはどこへ消えた』',
    '1時間で読めて10年間役立つ本『チーズはどこへ消えた？』を熱く紹介します！',
    'チーズはどこへ消えた【６分まとめ 】[スペンサー・ジョンソン著]',
    '【12分で解説】チーズはどこへ消えた？（スペンサー・ジョンソン / 著）',
  ];
  var thumbnail = [
    'https://i.ytimg.com/vi/wn9xelq7bLg/maxresdefault.jpg',
    'https://i.ytimg.com/vi/Hm4_1ZzPEDs/maxresdefault.jpg',
    'https://i.ytimg.com/vi/V7lBa85hBmU/maxresdefault.jpg',
    'https://i.ytimg.com/vi/P6Ce9r1cnbg/maxresdefault.jpg',
    'https://i.ytimg.com/vi/dkI6iO2k-vY/maxresdefault.jpg',
  ];
  var yotubeLinks = [
    'wn9xelq7bLg',
    'Hm4_1ZzPEDs',
    'V7lBa85hBmU',
    'P6Ce9r1cnbg',
    'dkI6iO2k-vY',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('チーズはどこへ消えた？'),
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
