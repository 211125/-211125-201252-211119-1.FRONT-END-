import 'dart:async';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class HomeAudio extends StatefulWidget {
  final List<String> audioAssets;

  HomeAudio({required this.audioAssets});

  @override
  State<HomeAudio> createState() => _HomeState();
}

class _HomeState extends State<HomeAudio> {
  int maxduration = 100;
  int currentpos = 0;
  String currentpostlabel = "00:00";
  bool isplaying = false;
  bool audioplayed = false;
  late AudioPlayer player;
  int currentAudioIndex = 0;

  @override
  void initState() {
    super.initState();
    player = AudioPlayer();

    player.onDurationChanged.listen((Duration d) {
      setState(() {
        maxduration = d.inMilliseconds;
      });
    });

    player.onAudioPositionChanged.listen((Duration p) {
      setState(() {
        currentpos = p.inMilliseconds;
        int shours = p.inHours;
        int sminutes = p.inMinutes;
        int sseconds = p.inSeconds;

        int rhours = shours;
        int rminutes = sminutes - (shours * 60);
        int rseconds = sseconds - (sminutes * 60 + shours * 60 * 60);

        currentpostlabel = "$rhours:$rminutes:$rseconds";
      });
    });
  }

  Future<void> playAudio(String audioUrl) async {
    int result = await player.play(audioUrl);
    if (result == 1) {
      setState(() {
        isplaying = true;
        audioplayed = true;
      });
    } else {
      print("Error while playing audio.");
    }
  }

  Future<void> stopAudio() async {
    int result = await player.stop();
    if (result == 1) {
      setState(() {
        isplaying = false;
        audioplayed = false;
        currentpos = 0;
      });
    } else {
      print("Error on stop audio.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Play Audio in Flutter App"),
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: widget.audioAssets.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("Audio ${index + 1}"),
                    onTap: () {
                      setState(() {
                        currentAudioIndex = index;
                      });
                      playAudio(widget.audioAssets[currentAudioIndex]);
                    },
                  );
                },
              ),
            ),
            Container(
              child: Text(
                currentpostlabel,
                style: TextStyle(fontSize: 25),
              ),
            ),
            Container(
              child: Slider(
                value: currentpos.toDouble(),
                min: 0,
                max: maxduration.toDouble(),
                divisions: maxduration,
                label: currentpostlabel,
                onChanged: (double value) async {
                  int seekval = value.round();
                  int result = await player.seek(Duration(milliseconds: seekval));
                  if (result == 1) {
                    setState(() {
                      currentpos = seekval;
                    });
                  } else {
                    print("Seek unsuccessful.");
                  }
                },
              ),
            ),
            Container(
              child: Wrap(
                spacing: 10,
                children: [
                  ElevatedButton.icon(
                    onPressed: () => playAudio(widget.audioAssets[currentAudioIndex]),
                    icon: Icon(isplaying ? Icons.pause : Icons.play_arrow),
                    label: Text(isplaying ? "Pause" : "Play"),
                  ),
                  ElevatedButton.icon(
                    onPressed: stopAudio,
                    icon: Icon(Icons.stop),
                    label: Text("Stop"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
