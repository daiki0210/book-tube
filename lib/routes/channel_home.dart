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
  bool isLoading = true;
  List<Channel> _channel = [];
  List list = ['UCEixleMT76xDzoiEb9ZA7XA', 'UCcdd3kS52T9Zyo-SWfj86bA', 'UCL4QAojeGy6CJ9R2PwmlmJQ'
    ,'UCaG7jufgiw4p5mphPPVbqhw','UC2OetCavEd3foO6GkU5NOyQ','UCC4NkFV-L-vVYD5z_Ei5dUA','UCyk6NETMxuVIWQMv3Vh6Epw'];

  @override
  void initState() {
    super.initState();
    _initChannel();
  }

  _initChannel() async {

    for(int i = 0; i < list.length; i++)
    {
      Channel channel = await APIService.instance
          .fetchChannel(channelId: list[i]);
      _channel.add(channel);
    }

    setState(() {
      isLoading = false;
    });
  }

  _buildProfileInfo(int index) {

    return ListTile(
      title: Container(
        child: Row(
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 35.0,
              backgroundImage: NetworkImage(_channel[index].profilePictureUrl),
            ),
            SizedBox(width: 12.0),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    _channel[index].title,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '${_channel[index].subscriberCount} subscribers',
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
          MaterialPageRoute(builder: (context) => ChannelScreen(_channel[index])),
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
      body:isLoading == false
          ? NotificationListener<ScrollNotification>(
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            if (index < list.length) {
              return _buildProfileInfo(index);
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