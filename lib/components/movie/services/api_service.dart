import 'dart:convert';
import 'dart:io';
import 'package:book_summarizer_app/components/movie/models/channel_model.dart';
import 'package:book_summarizer_app/components/movie/models/video_model.dart';
import 'package:book_summarizer_app/components/movie/utilities/keys.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:youtube_api/youtube_api.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class APIService {
  APIService._instantiate();

  static final APIService instance = APIService._instantiate();

  final String _baseUrl = 'www.googleapis.com';
  String _nextPageToken = '';

  Future<Channel> fetchChannel({String channelId}) async {
    Map<String, String> parameters = {
      'part': 'snippet, contentDetails, statistics',
      'id': channelId,
      'key': API_KEY,
    };
    Uri uri = Uri.https(
      _baseUrl,
      '/youtube/v3/channels',
      parameters,
    );
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    // Get Channel
    var response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body)['items'][0];
      Channel channel = Channel.fromMap(data);

      // Fetch first batch of videos from uploads playlist
      channel.videos = await fetchVideosFromPlaylist(
        playlistId: channel.uploadPlaylistId,
      );
      return channel;
    } else {
      throw json.decode(response.body)['error']['message'];
    }
  }

  Future<List<Video>> fetchVideosFromPlaylist({String playlistId}) async {
    Map<String, String> parameters = {
      'part': 'snippet',
      'playlistId': playlistId,
      'maxResults': '8',
      'pageToken': _nextPageToken,
      'key': API_KEY,
    };
    Uri uri = Uri.https(
      _baseUrl,
      '/youtube/v3/playlistItems',
      parameters,
    );
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    // Get Playlist Videos
    var response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      _nextPageToken = data['nextPageToken'] ?? '';
      List<dynamic> videosJson = data['items'];

      // Fetch first eight videos from uploads playlist
      List<Video> videos = [];
      videosJson.forEach(
            (json) => videos.add(
          Video.fromMap(json['snippet']),
        ),
      );
      return videos;
    } else {
      throw json.decode(response.body)['error']['message'];
    }
  }

}








class VideosPage extends StatefulWidget {
  @override
  _VideosPageState createState() => _VideosPageState();
}

class _VideosPageState extends State<VideosPage> {
  bool _isLoading = false;
  Channel _channel;
  static String key = API_KEY;
  bool recordsLoaded = false;
  static int maxResults = 90;

 static String videosType = "channel";
  // static String videosType = "videos";
// static String videosType = "playlist";

  YoutubeAPI ytApi = new YoutubeAPI(
    key,
    maxResults: maxResults,
    type: videosType,
  );
  List<YT_API> ytResult = [];

  callAPI() async {
    // print('UI callled');
//    CircularProgressIndicator();
    String query = "ひかきん";
    ytResult = await ytApi.search(query);
    setState(() {
//      print('UI Updated 2');
      recordsLoaded = true;
    });
  }

  @override
  void initState() {
//    _loadList();
//    super.initState();
    super.initState();
    callAPI();
//    print('hello');
    recordsLoaded = false;
  }

  @override
  Widget build(BuildContext context) {
//    var locale = Localizations.localeOf(context).languageCode;
    timeago.setLocaleMessages('ja', timeago.JaMessages());
    timeago.setLocaleMessages('en', timeago.EnMessages());

    return Scaffold(
      appBar: AppBar(
        title: Text("aa"),
        elevation: 0,
      ),
      body: Container(
          child: recordsLoaded
              ? ListView.builder(
              itemCount: ytResult.length,
              itemBuilder: (_, int index) => listItem(index))
              : Center(
            child: Container(
              child: CircularProgressIndicator(),
            ),
          )),
    );
  }

  Widget listItem(index) {
    var publishedAt =
    timeago.format(DateTime.parse(ytResult[index].publishedAt));
    return new Card(
      child: new Container(
        margin: EdgeInsets.symmetric(vertical: 7.0),
        padding: EdgeInsets.all(6.0),
        child: new Row(
          children: <Widget>[
            new InkWell(
              child: CachedNetworkImage(
                imageUrl: ytResult[index].thumbnail['default']['url'],
                width: 90,
                height: 90,
              ),
              onTap: () {
                print(ytResult[index].url);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => YouTubeVideoPlayer(
                //         title: ytResult[index].title, url: ytResult[index].id),
                //   ),
                // );
              },
            ),
            new Padding(padding: EdgeInsets.only(right: 10.0)),
            new Expanded(
                child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new InkWell(
                        child: new Text(
                          ytResult[index].title,
                          softWrap: true,
                          style: TextStyle(fontSize: 16.0),
                        ),
                        onTap: () {
                          print('${ytResult[index].title} ${ytResult[index].id} ');
                        },
                      ),
                      new Padding(padding: EdgeInsets.only(bottom: 1.5)),
                      new Text(
                        ytResult[index].channelTitle,
                        softWrap: true,
                        style: TextStyle(fontSize: 14.0, color: Colors.grey[600]),
                      ),
                      new Padding(padding: EdgeInsets.only(bottom: 3.0)),
                      new Text(
                        publishedAt,
                        softWrap: true,
                        style: TextStyle(fontSize: 12.0, color: Colors.grey),
                      ),
                    ]))
          ],
        ),
      ),
    );
  }

}