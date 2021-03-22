import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:async';

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

List list = [
  "http://video.cnnb.com.cn/mixmedia/2020/09/15/5fec0e55-5cd2-42d3-83c3-20c96dc2b86a.mp3",
  "http://video.cnnb.com.cn/mixmedia/2020/07/16/8804a1c6-c7c7-4e49-ac2b-ffe13421e98b.mp3",
  "http://video.cnnb.com.cn/mixmedia/2020/03/19/b0aaf0f9-6d5a-4a9b-b08a-0e6fd06390aa.mp3",
];

class _PlayState extends State<Play> {
  String url;
  PlayerMode mode;
  int _index;

  AudioPlayer _audioPlayer;

  Duration _duration;
  Duration _position;

  AudioPlayerState playerState;

  StreamSubscription _durationSubscription;
  StreamSubscription _positionSubscription;
  StreamSubscription _playerCompleteSubscription;
  StreamSubscription _playerErrorSubscription;
  StreamSubscription _playerStateSubscription;

  get _durationText => _duration?.toString()?.split('.')?.first ?? '';
  get _positionText => _position?.toString()?.split('.')?.first ?? '';

  _PlayState(this.url, this.mode);

  void _initAudioPlayer() {
    //初始化
    _audioPlayer = AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);
    /**
     * 时长事件
     */
    _durationSubscription = _audioPlayer.onDurationChanged.listen((duration) {
      setState(() => _duration = duration);
      if (Theme.of(context).platform == TargetPlatform.iOS) {
        _audioPlayer.startHeadlessService();
        _audioPlayer.setNotification(
            title: 'App Name',
            artist: 'Artist or blank',
            albumTitle: 'Name or blank',
            imageUrl: 'url or blank',
            forwardSkipInterval: const Duration(seconds: 30),
            backwardSkipInterval: const Duration(seconds: 30),
            duration: duration,
            elapsedTime: Duration(seconds: 0));
      }
    });

    //监听进度
    _positionSubscription = _audioPlayer.onAudioPositionChanged.listen(
      (p) => setState(
        () {
          _position = p;
        },
      ),
    );

    //播放完成
    _playerCompleteSubscription =
        _audioPlayer.onPlayerCompletion.listen((event) {
      setState(
        () {
          _position = Duration();
          _index = _index + 1;
          _play();
        },
      );
    });

    //监听报错
    _playerErrorSubscription = _audioPlayer.onPlayerError.listen((msg) {
      print('audioPlayer error : $msg');
      setState(
        () {
          _duration = Duration(seconds: 0);
          _position = Duration(seconds: 0);
        },
      );
    });

    //播放状态改变
    _audioPlayer.onPlayerStateChanged.listen((state) {
      if (!mounted) {
        return;
      }
      setState(
        () {
          playerState = state;
        },
      );
    });

    _audioPlayer.onNotificationPlayerStateChanged.listen((state) {
      if (!mounted) {
        return;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _index = 0;
    _initAudioPlayer();
    playerState = AudioPlayerState.PAUSED;
  }

  Future<int> _play() async {
    final playPosition = (_position != null &&
            _duration != null &&
            _position.inMilliseconds > 0 &&
            _position.inMilliseconds < _duration.inMilliseconds)
        ? _position
        : null;
    final result =
        await _audioPlayer.play(list[_index], position: playPosition);
    if (result == 1) {
      print('succes');
    }
    _audioPlayer.setPlaybackRate(playbackRate: 1.0);
    return result;
  }

  //暂停
  Future<int> _pause() async {
    final result = await _audioPlayer.pause();
    if (result == 1) {
      print('succes');
    }
    return result;
  }

  //停止播放
  Future<int> _stop() async {
    final result = await _audioPlayer.stop();
    if (result == 1) {
      setState(() {
        _position = Duration();
      });
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfffdfdfd),
        leading: Icon(
          Icons.arrow_left_sharp,
          color: Color(0xff2f3a4c),
        ),
        title: Text(
          '哈哈哈',
          style: TextStyle(color: Color(0xff2f3a4c)),
        ),
        actions: <Widget>[
          Icon(
            Icons.share_rounded,
            color: Color(0xff989898),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Center(
                  child: Image.network(
                      'https://img.tingchina.com/bookimg/yousheng/31113.gif'),
                ),
              ),
            ),
            Center(
              child: Text('001_看一眼就会死的诡异镜子(已死38人)'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.play_circle_fill),
                        Text("搜藏"),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.play_circle_fill),
                        Text("搜藏"),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.play_circle_fill),
                        Text("搜藏"),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.play_circle_fill),
                        Text("搜藏"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 50,
                  color: Colors.red,
                  child: Text(
                    _position != null ? _positionText : '',
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Slider(
                        onChanged: (v) {
                          final position = v * _duration.inMilliseconds;
                          _audioPlayer
                              .seek(Duration(milliseconds: position.round()));
                        },
                        value: (_position != null &&
                                _duration != null &&
                                _position.inMilliseconds > 0 &&
                                _position.inMilliseconds <
                                    _duration.inMilliseconds)
                            ? _position.inMilliseconds /
                                _duration.inMilliseconds
                            : 0.0,
                        inactiveColor: Color(0xff817b7f),
                        activeColor: Color(0xffff3587),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 50,
                  color: Colors.red,
                  child: Text(
                    _duration != null ? _durationText : '',
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    child: Icon(
                      Icons.remove,
                      color: Color(0xff222222),
                      size: 38,
                    ),
                    onTap: () {
                      if (_index == 0) {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => Text("aaa"));
                      } else {
                        setState(() {
                          _index = _index + 1;
                        });
                        _play();
                      }
                    },
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    child: Icon(
                      Icons.skip_previous_rounded,
                      color: Color(0xff222222),
                      size: 38,
                    ),
                    onTap: () {
                      _play();
                    },
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    child: playerState == AudioPlayerState.PLAYING
                        ? Icon(
                            Icons.pause_circle_filled,
                            color: Color(0xfff55197),
                            size: 38,
                          )
                        : Icon(Icons.play_circle_fill),
                    onTap: () {
                      if (playerState == AudioPlayerState.PLAYING) {
                        _pause();
                      } else {
                        _play();
                      }
                    },
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    child: Icon(
                      Icons.skip_next_rounded,
                      color: Color(0xff222222),
                      size: 38,
                    ),
                    onTap: () {
                      _play();
                    },
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    child: Icon(
                      Icons.add,
                      color: Color(0xff222222),
                      size: 38,
                    ),
                    onTap: () {
                      if (_index == list.length - 1) {
                        // 底部弹出框
                      } else {
                        setState(() {
                          _index = _index + 1;
                        });
                        _play();
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
