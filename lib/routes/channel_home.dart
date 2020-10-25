import 'package:book_summarizer_app/components/movie/models/channel_model.dart';
import 'package:book_summarizer_app/components/movie/screens/channel_screen.dart';
import 'package:book_summarizer_app/components/movie/services/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChannelHome extends StatefulWidget{
  @override
  _ChannelHome createState() => _ChannelHome();
}

class _ChannelHome extends State {
  Channel _channel;

  @override
  void initState() {
    super.initState();
    _initChannel();
  }

  _initChannel() async {
    Channel channel = await APIService.instance
        .fetchChannel(channelId: 'UCEixleMT76xDzoiEb9ZA7XA');
    setState(() {
      _channel = channel;
    });
  }

  _buildProfileInfo() {
    return ListTile(
      // margin: EdgeInsets.all(20.0),
      // padding: EdgeInsets.all(20.0),
      // height: 100.0,
      // decoration: BoxDecoration(
      //   color: Colors.white,
      //   boxShadow: [
      //     BoxShadow(
      //       color: Colors.black12,
      //       offset: Offset(0, 1),
      //       blurRadius: 6.0,
      //     ),
      //   ],
      // ),

      title: Container(
        child: Row(
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 35.0,
              backgroundImage: NetworkImage(_channel.profilePictureUrl),
            ),
            SizedBox(width: 12.0),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    _channel.title,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '${_channel.subscriberCount} subscribers',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChannelScreen()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('YouTube Channel'),
      ),
      body: _channel != null
          ? NotificationListener<ScrollNotification>(
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return _buildProfileInfo();
            } else{
              return Text("error");
            }
          },
        ),
      )
          : Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
            Theme.of(context).primaryColor, // Red
          ),
        ),
      ),
    );
  }
}