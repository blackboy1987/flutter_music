import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Play extends StatefulWidget {
  final String url;
  final PlayerMode mode;

  Play({
    Key key,
    this.url,
    this.mode = PlayerMode.MEDIA_PLAYER,
  }) : super(key: key);

  @override
  _PlayState createState() => _PlayState(url, mode);
}

class _PlayState extends State<Play> {
  String url;
  PlayerMode mode;
  Duration _duration;

  AudioPlayer _audioPlayer = AudioPlayer();

  _PlayState(this.url, this.mode);

  void _initAudioPlayer() {
    _audioPlayer = AudioPlayer(mode: mode);
    _audioPlayer.onDurationChanged.listen((duration) {
      print("====================");
      print('$duration');
      setState(() => _duration = duration);
      if (Theme.of(context).platform == TargetPlatform.iOS) {
        _audioPlayer.startHeadlessService();
        _audioPlayer.setNotification(
          title: 'App Name',
          artist: 'Artist or blank',
          albumTitle: 'Name or blank',
          imageUrl: 'url or blank',
          duration: duration,
          elapsedTime: Duration(seconds: 0),
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _initAudioPlayer();
  }

  Future<int> _play() async {
    final result = await _audioPlayer.play(
        'https://bootx-mp3.oss-cn-hangzhou.aliyuncs.com/1.mp3?Expires=1616340918&OSSAccessKeyId=TMP.3KijtDquhzebv7ZR6MH3BiPMH5Xm5aj1LsRmcQ1JbSMgY82Mmz691QusTtyJi2na5tT3gGi6g7qrXtxZAm6CEGFWyHJYxF&Signature=F2W452R%2BVTNwwsaEjlnPDJouE%2B4%3D');
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.play_arrow),
              onPressed: () {
                _play();
              },
            ),
            Container(
              child: Text('$_duration'),
            ),
          ],
        ),
      ),
    );
  }
}
