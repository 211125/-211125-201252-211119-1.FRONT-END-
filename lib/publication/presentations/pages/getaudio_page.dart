import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:audioplayers/audioplayers.dart';
import '../../../reaction/data/models/post_login.dart';
import '../../../reaction/presentations/blocs/poshReaction/poshReaction_bloc.dart';
import '../../../reaction/presentations/blocs/poshReaction/poshReaction_event.dart';
import '../../../users/presentations/page/interfaz.dart';
import '../../data/models/getuser_model.dart';
import '../bloc/getaudio/getaudio_bloc.dart';
import '../bloc/getaudio/getaudio_event.dart';
import '../bloc/getaudio/getaudio_state.dart';
import '_audio.dart';
import 'getPost_page.dart';
import 'getVideo_page.dart';
import 'getgif_page.dart';

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
      appBar: AppBar(
        title: Text('Audio'),
        backgroundColor: Colors.black,
      ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<GetaudioBloc>(context).add(FetchaudioEvent());
        },
        tooltip: 'Fetch Posts',
        child: Icon(Icons.file_download),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.image),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => foto()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.audiotrack),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GetAudioPage()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.animation),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GetGifPage()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.video_collection),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GetVideoPage()),
                );
              },
            ),
          ],
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
      elevation: 4,
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
                widget.post.userFullName,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      IconButton(
                        icon: isLiked
                            ? Icon(Icons.favorite, color: Colors.red)
                            : Icon(Icons.favorite_border),
                        onPressed: () {
                          final String publicationId = widget.post.id.toString();
                          final String userId = widget.post.userId.toString();
                          final reaction = ReactionModel(
                            publicationId: publicationId,
                            userId: userId,
                          );
                          BlocProvider.of<PoshReactionBloc>(context).add(
                            PostReactionEvent(reaction),
                          );

                        },
                      ),
                      if (likeCount > 0)
                        Positioned(
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),

                            child: Text(
                              likeCount.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
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
