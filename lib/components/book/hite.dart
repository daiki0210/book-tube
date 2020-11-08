import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Hite extends StatelessWidget {
  // <- (※1)
  var title = [
    '【嫌われる勇気】トラウマは存在しない',
    '【15分で解説】嫌われる勇気｜承認欲求は生ゴミでした。',
    'アドラー心理学「嫌われる勇気」を読むだけじゃ意味がない',
    '【嫌われる勇気】アニメで５分！復習用【アドラー心理学】',
    '【8分で解説】嫌われる勇気―――自己啓発の源流「アドラー」の教え（岸見一郎・古賀史健 /著）'
  ];
  var thumbnail = [
    'https://i.ytimg.com/vi/N-fT1KjtGGA/maxresdefault.jpg',
    'https://i.ytimg.com/vi/rZBeETz8YSw/maxresdefault.jpg',
    'https://i.ytimg.com/vi/D26oBz1ocaY/maxresdefault.jpg',
    'https://i.ytimg.com/vi/JXJ4OVv2n6w/maxresdefault.jpg',
    'https://i.ytimg.com/vi/I7S5uttrvtE/maxresdefault.jpg'
  ];
  var yotubeLinks = [
    'https://youtu.be/N-fT1KjtGGA',
    'https://youtu.be/rZBeETz8YSw',
    'https://youtu.be/D26oBz1ocaY',
    'https://youtu.be/JXJ4OVv2n6w',
    'https://youtu.be/I7S5uttrvtE'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('嫌われる勇気'),
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
