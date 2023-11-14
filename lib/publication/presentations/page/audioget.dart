
//
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:audioplayers/audioplayers.dart';
import '../../../reaction/data/models/post_login.dart';
import '../../../reaction/presentations/blocs/poshReaction/poshReaction_bloc.dart';
import '../../../reaction/presentations/blocs/poshReaction/poshReaction_event.dart';
import '../../data/models/getuser_model.dart';
import '../bloc/getaudio/getaudio_bloc.dart';
import '../bloc/getaudio/getaudio_event.dart';
import '../bloc/getaudio/getaudio_state.dart';


class GetAudioPage extends StatefulWidget {
  @override
  _GetAudioPageState createState() => _GetAudioPageState();
}

class _GetAudioPageState extends State<GetAudioPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetaudioBloc>(context).add(FetchaudioEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: BlocBuilder<GetaudioBloc, GetaudioState>(
          builder: (context, state) {
            if (state is GetaudioInitialState) {
              return Center(child: Text('Press the button to fetch posts.'));
            } else if (state is GetaudioLoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is GetaudioLoadedState) {
              List<PostModel> posts = state.posts;
              return ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return AudioItemWidget(post: posts[index]);
                },
              );
            } else if (state is GetaudioErrorState) {
              return Center(child: Text('Error occurred: ${state.error}'));
            } else {
              return Container();
            }
          },
        ),
      ),


    );
  }
}
class AudioItemWidget extends StatefulWidget {
  final PostModel post;

  const AudioItemWidget({Key? key, required this.post}) : super(key: key);

  @override
  _AudioItemWidgetState createState() => _AudioItemWidgetState();
}class _AudioItemWidgetState extends State<AudioItemWidget> {
  late AudioPlayer player;
  bool isPlaying = false;
  bool isLiked = false; // Nuevo estado para el botón de "Me gusta"
  int likeCount = 0; // Contador de Me gusta
  double currentPos = 0;
  double maxDuration = 0;

  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
    player.onDurationChanged.listen((Duration d) {
      setState(() {
        maxDuration = d.inMilliseconds.toDouble();
      });
    });
    player.onAudioPositionChanged.listen((Duration p) {
      setState(() {
        currentPos = p.inMilliseconds.toDouble();
      });
    });
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(
              title: Text(
                widget.post.description,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
              ),
              subtitle: Text(
                widget.post.userProfile,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [

                  IconButton(
                    icon: isPlaying ? Icon(Icons.pause) : Icon(Icons.play_arrow),
                    onPressed: () {
                      if (isPlaying) {
                        player.pause();
                      } else {
                        player.play(widget.post.multimedia);
                      }
                      setState(() {
                        isPlaying = !isPlaying;
                      });
                    },
                  ),
                ],
              ),
            ),
            Slider(
              value: currentPos,
              min: 0,
              max: maxDuration,
              onChanged: (value) {
                player.seek(Duration(milliseconds: value.toInt()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
