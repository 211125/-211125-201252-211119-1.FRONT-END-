import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
         home: Home()
      );
  }
}

class Home extends  StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int maxduration = 100;
  int currentpos = 0;
  String currentpostlabel = "00:00";
  String audioasset = "https://storage.googleapis.com/backsocialmovil.appspot.com/interface-124464.mp3?GoogleAccessId=firebase-adminsdk-7apgz%40backsocialmovil.iam.gserviceaccount.com&Expires=16447039200&Signature=lG%2BQxYkdMekGQTDdOFqx8ety%2BXkzJlLEmL9HvafF%2BXFpczgkYaqNIHuzv%2Bq%2BDhuvYwayd92c25kRtm%2FWdXZWX8RNIzylkdlNyprt2hGNN8P0VMzcMYOB0ZJwWbWp0ut%2Fzk2P%2Fbh6QS2etXuDsASlFcDzMzI5iD0zw%2FdWkplESs15rIAqrWjiRnbBRoZDn28%2F0wq8XP8gjn8lpy%2Bt32aYFEaVquX9d8KGKT%2Fdg6ilidrdz%2FhMbJ%2BqITCjKGOSBsopnbt08LpsRJuKdsRPMYzwUDprVWjcl6l3zy2vPR176wwXgHFa3GRlWou2fbtIxZkKLsW0DSWw5cXjZFK9eOYzag%3D%3D";
  bool isplaying = false;
  bool audioplayed = false;
  late AudioPlayer player;

  @override
  void initState() {
    super.initState();
    player = AudioPlayer();

    player.onDurationChanged.listen((Duration d) { //get the duration of audio
      setState(() {
        maxduration = d.inMilliseconds;
      });
    });

    player.onAudioPositionChanged.listen((Duration  p) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Play Audio in Flutter App"),
            backgroundColor: Colors.redAccent
        ),
        body: Container(
            margin: EdgeInsets.only(top:50),
            child: Column(
              children: [

                Container(
                  child: Text(currentpostlabel, style: TextStyle(fontSize: 25),),
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
                      if(result == 1){ //seek successful
                        setState(() {
                          currentpos = seekval;
                        });
                      } else {
                        print("Seek unsuccessful.");
                      }
                    },
                  )
                ),

                Container(
                  child: Wrap(
                    spacing: 10,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () async {
                          if(!audioplayed){
                            int result = await player.play(audioasset);
                            if(result == 1) { //play success
                              setState(() {
                                isplaying = true;
                                audioplayed = true;
                              });
                            } else {
                              print("Error while playing audio.");
                            }
                          } else if(!isplaying){
                            int result = await player.resume();
                            if(result == 1) { //resume success
                              setState(() {
                                isplaying = true;
                              });
                            } else {
                              print("Error on resume audio.");
                            }
                          } else {
                            int result = await player.pause();
                            if(result == 1) { //pause success
                              setState(() {
                                isplaying = false;
                              });
                            } else {
                              print("Error on pause audio.");
                            }
                          }
                        },
                        icon: Icon(isplaying ? Icons.pause : Icons.play_arrow),
                        label: Text(isplaying ? "Pause" : "Play")
                      ),

                      ElevatedButton.icon(
                        onPressed: () async {
                          int result = await player.stop();
                          if(result == 1) { //stop success
                            setState(() {
                              isplaying = false;
                              audioplayed = false;
                              currentpos = 0;
                            });
                          } else {
                            print("Error on stop audio.");
                          }
                        },
                        icon: Icon(Icons.stop),
                        label: Text("Stop")
                      ),
                    ],
                  ),
                )

              ],
            )
        )
    );
  }
}
