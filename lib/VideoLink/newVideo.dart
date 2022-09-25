import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:mansoor/VideoLink/model.dart';
import 'package:video_player/video_player.dart';

class Physics_Chp1_Video extends StatefulWidget {
  const Physics_Chp1_Video({Key? key}) : super(key: key);

  static String Physics_chp1_VideoTime = "30";
  String getVideoTime() {
    return Physics_chp1_VideoTime;
  }

  void setVideoTime(String time) {
    Physics_chp1_VideoTime = time;
  }

  @override
  State<Physics_Chp1_Video> createState() => Physics_Chp1_VideoState();
}

class Physics_Chp1_VideoState extends State<Physics_Chp1_Video> {
  late VideoPlayerController _controller;
  bool isMusicOn = true;

  void _playerVideo({int index = 0, bool init = false}) {
    // if (index < 0 || index >= videos.length) return;

    _controller = VideoPlayerController.asset('assets/ph_chp1.mp4')
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((value) => _controller.play());
  }

  String seconds = "";
  String minutes = "";

  String _videoDurationPosition(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    minutes = twoDigits(duration.inMinutes % 60);
    seconds = twoDigits(duration.inSeconds % 60);
    Physics_Chp1_Video.Physics_chp1_VideoTime = minutes + ":" + seconds;

    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(':');
  }

  String _videoDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    minutes = twoDigits(duration.inMinutes % 60);
    seconds = twoDigits(duration.inSeconds % 60);

    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(':');
  }

  void soundToggle() {
    setState(() {
      isMusicOn == false
          ? _controller.setVolume(1.0)
          : _controller.setVolume(0.0);
      isMusicOn = !isMusicOn;
    });
  }

  @override
  void initState() {
    super.initState();
    _playerVideo(init: true);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Video Lecture'),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                // color: Colors.lightBlue,
                // height: 300,
                child: _controller.value.isInitialized
                    ? SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 200,
                              child: VideoPlayer(_controller),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                ValueListenableBuilder(
                                  valueListenable: _controller,
                                  builder:
                                      (context, VideoPlayerValue value, child) {
                                    return Text(
                                      _videoDurationPosition(value.position),
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                      ),
                                    );
                                  },
                                ),
                                Expanded(
                                  child: SizedBox(
                                    height: 20,
                                    child: VideoProgressIndicator(
                                      _controller,
                                      allowScrubbing: true,
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 0,
                                        horizontal: 12,
                                      ),
                                    ),
                                  ),
                                ),
                                ValueListenableBuilder(
                                  valueListenable: _controller,
                                  builder:
                                      (context, VideoPlayerValue value, child) {
                                    return Text(
                                      _videoDuration(
                                          _controller.value.duration),
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: () => _controller.value.isPlaying
                                      ? _controller.pause()
                                      : _controller.play(),
                                  // onPressed: () => {
                                  //   if (_controller.value.isPlaying)
                                  //     {
                                  //       _controller.pause(),
                                  //     }
                                  //   else
                                  //     {
                                  //       _controller.play(),
                                  //       // ignore: unrelated_type_equality_checks
                                  //       timeStorage ==
                                  //           ValueListenableBuilder(
                                  //               valueListenable: _controller,
                                  //               builder: (context, VideoPlayerValue value,
                                  //                   child) {
                                  //                 return Text(
                                  //                   _videoDuration(value.position),
                                  //                   style: const TextStyle(
                                  //                     color: Colors.white,
                                  //                     fontSize: 20,
                                  //                   ),
                                  //                 );
                                  //               }).toString(),
                                  //     }
                                  // },
                                  icon: Icon(
                                      _controller.value.isPlaying
                                          ? Icons.pause
                                          : Icons.play_arrow,
                                      color: Colors.black,
                                      size: 40),
                                ),
                                const SizedBox(
                                  width: 90,
                                ),
                                IconButton(
                                  onPressed: () {
                                    soundToggle();
                                  },
                                  icon: Icon(
                                    _controller.value.isPlaying
                                        ? isMusicOn == true
                                            ? Icons.volume_up
                                            : Icons.volume_off
                                        : Icons.volume_off,
                                    color: Colors.black,
                                    size: 35,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            LandscapePlayerPage(
                                          controller: _controller,
                                        ),
                                      ),
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.fullscreen,
                                    color: Colors.black,
                                    size: 40,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    : const Center(
                        child: CircularProgressIndicator(
                          color: Colors.black,
                        ),
                      ),
              ),
            ),
          ],
        ),
      );
}

// chapter 2 video
class Physics_Chp2_Video extends StatefulWidget {
  const Physics_Chp2_Video({Key? key}) : super(key: key);

  static String Ph_Chp2_Time = "60";
  String getVideoTime() {
    return Ph_Chp2_Time;
  }

  void setVideoTime(String time) {
    Ph_Chp2_Time = time;
  }

  @override
  State<Physics_Chp2_Video> createState() => Physics_Chp2_VideoState();
}

class Physics_Chp2_VideoState extends State<Physics_Chp2_Video> {
  late VideoPlayerController _controller;
  bool isMusicOn = true;

  void _playerVideo({int index = 0, bool init = false}) {
    // if (index < 0 || index >= videos.length) return;

    _controller = VideoPlayerController.asset('assets/ph_chp2.mp4')
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((value) => _controller.play());
  }

  String seconds = "";
  String minutes = "";

  String _videoDurationPosition(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    minutes = twoDigits(duration.inMinutes % 60);
    seconds = twoDigits(duration.inSeconds % 60);
    Physics_Chp2_Video.Ph_Chp2_Time = minutes + ":" + seconds;

    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(':');
  }

  String _videoDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    minutes = twoDigits(duration.inMinutes % 60);
    seconds = twoDigits(duration.inSeconds % 60);

    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(':');
  }

  void soundToggle() {
    setState(() {
      isMusicOn == false
          ? _controller.setVolume(1.0)
          : _controller.setVolume(0.0);
      isMusicOn = !isMusicOn;
    });
  }

  @override
  void initState() {
    super.initState();
    _playerVideo(init: true);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Video Lecture'),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                // color: Colors.lightBlue,
                // height: 300,
                child: _controller.value.isInitialized
                    ? SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 200,
                              child: VideoPlayer(_controller),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                ValueListenableBuilder(
                                  valueListenable: _controller,
                                  builder:
                                      (context, VideoPlayerValue value, child) {
                                    return Text(
                                      _videoDurationPosition(value.position),
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                      ),
                                    );
                                  },
                                ),
                                Expanded(
                                  child: SizedBox(
                                    height: 20,
                                    child: VideoProgressIndicator(
                                      _controller,
                                      allowScrubbing: true,
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 0,
                                        horizontal: 12,
                                      ),
                                    ),
                                  ),
                                ),
                                ValueListenableBuilder(
                                  valueListenable: _controller,
                                  builder:
                                      (context, VideoPlayerValue value, child) {
                                    return Text(
                                      _videoDuration(
                                          _controller.value.duration),
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: () => _controller.value.isPlaying
                                      ? _controller.pause()
                                      : _controller.play(),
                                  // onPressed: () => {
                                  //   if (_controller.value.isPlaying)
                                  //     {
                                  //       _controller.pause(),
                                  //     }
                                  //   else
                                  //     {
                                  //       _controller.play(),
                                  //       // ignore: unrelated_type_equality_checks
                                  //       timeStorage ==
                                  //           ValueListenableBuilder(
                                  //               valueListenable: _controller,
                                  //               builder: (context, VideoPlayerValue value,
                                  //                   child) {
                                  //                 return Text(
                                  //                   _videoDuration(value.position),
                                  //                   style: const TextStyle(
                                  //                     color: Colors.white,
                                  //                     fontSize: 20,
                                  //                   ),
                                  //                 );
                                  //               }).toString(),
                                  //     }
                                  // },
                                  icon: Icon(
                                      _controller.value.isPlaying
                                          ? Icons.pause
                                          : Icons.play_arrow,
                                      color: Colors.black,
                                      size: 40),
                                ),
                                const SizedBox(
                                  width: 90,
                                ),
                                IconButton(
                                  onPressed: () {
                                    soundToggle();
                                  },
                                  icon: Icon(
                                    _controller.value.isPlaying
                                        ? isMusicOn == true
                                            ? Icons.volume_up
                                            : Icons.volume_off
                                        : Icons.volume_off,
                                    color: Colors.black,
                                    size: 35,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            LandscapePlayerPage(
                                          controller: _controller,
                                        ),
                                      ),
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.fullscreen,
                                    color: Colors.black,
                                    size: 40,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    : const Center(
                        child: CircularProgressIndicator(
                          color: Colors.black,
                        ),
                      ),
              ),
            ),
          ],
        ),
      );
}

class LandscapePlayerPage extends StatefulWidget {
  const LandscapePlayerPage({Key? key, required this.controller})
      : super(key: key);

  final VideoPlayerController controller;

  @override
  State<LandscapePlayerPage> createState() => _LandscapePlayerPageState();
}

class _LandscapePlayerPageState extends State<LandscapePlayerPage> {
  Future _landscapeMode() async {
    await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _landscapeMode();
  }

  Future _setAllOrientation() async {
    await SystemChrome.setPreferredOrientations(DeviceOrientation.values);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _setAllOrientation();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VideoPlayer(widget.controller);
  }
}
