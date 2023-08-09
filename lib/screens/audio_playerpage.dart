import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart'; // Make sure to include the audioplayers package

class AudioPlayerWidget extends StatefulWidget {
  @override
  _AudioPlayerWidgetState createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  late AudioPlayer audioPlayer;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
  }

  void _playAudio() async {
    await audioPlayer.play(AssetSource('audio/Cold_Day.mp3'),);
      setState(() {
        isPlaying = true;
      });
  }

  void _pauseAudio() async {
    await audioPlayer.pause();
      setState(() {
        isPlaying = false;
      });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Audio Player"),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade100.withOpacity(0.55),
          image: DecorationImage(
            image: AssetImage("assets/image/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              width: (MediaQuery.of(context).size.width),
              height: (MediaQuery.of(context).size.height),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ClipOval(
                    child: Image(
                      image: AssetImage("assets/image/bg.jpg"),
                      width: (MediaQuery.of(context).size.width) - 200,
                      height: (MediaQuery.of(context).size.width) - 200,
                      fit: BoxFit.fill,
                    ),
                  ),
                  IconButton(
                    icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow, color: Colors.white,size: 55,),
                    onPressed: isPlaying ? _pauseAudio : _playAudio,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
