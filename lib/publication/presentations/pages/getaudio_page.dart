import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:audioplayers/audioplayers.dart';
import '../../../movil/addpuc.dart';
import '../../../movil/home_page.dart';
import '../../../reaction/data/models/post_login.dart';
import '../../../reaction/presentations/blocs/poshReaction/poshReaction_bloc.dart';
import '../../../reaction/presentations/blocs/poshReaction/poshReaction_event.dart';
import '../../data/models/getuser_model.dart';
import '../bloc/createpost/createpost_bloc.dart';
import '../bloc/getaudio/getaudio_bloc.dart';
import '../bloc/getaudio/getaudio_event.dart';
import '../bloc/getaudio/getaudio_state.dart';
import 'getPdf_page.dart';
import 'getPost_page.dart';
import 'getVideo_page.dart';

class GetAudioPage extends StatefulWidget {
  @override
  _GetAudioPageState createState() => _GetAudioPageState();
}

class _GetAudioPageState extends State<GetAudioPage> {
  int _currentIndex = 1; // Índice del ítem del foro

  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetaudioBloc>(context).add(FetchaudioEvent());
  }
  void _showadd(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Post_Page(bloc: BlocProvider.of<CreatePostBloc>(context)),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Foro',
          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
          onPressed: () {
            // Acción para el botón de atrás
          },
        ),
        elevation: 0.0, // Elimina el sombreado de la AppBar
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add, color: Color.fromARGB(255, 0, 0, 0)),
            onPressed: () {
              _showadd(context);
            },
          ),
          PopupMenuButton<String>(
            icon: Icon(Icons.more_vert, color: Color.fromARGB(255, 0, 0, 0)), // Icono de menú en negro
            onSelected: (String result) {
              switch (result) {
                case 'PDF':
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Getpdf_page()),
                  );
                  break;

                case 'Video':
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GetVideoPage()),
                  );
                  break;
                case 'Imagen':
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => foto()),
                  );                  break;
                case 'Audio':
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GetAudioPage()),
                  );                    break;
                case 'Publicación':
                // Navegar a Publicacion_page
                  break;
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'PDF',
                child: Text('PDF'),
              ),
              const PopupMenuItem<String>(
                value: 'Video',
                child: Text('Video'),
              ),
              const PopupMenuItem<String>(
                value: 'Imagen',
                child: Text('Imagen'),
              ),
              const PopupMenuItem<String>(
                value: 'Audio',
                child: Text('Audio'),
              ),
              const PopupMenuItem<String>(
                value: 'Publicación',
                child: Text('Publicación'),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Establecer el margen deseado

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
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0), // Add margin/padding here
                  child: AudioItemWidget(post: posts[index]),
                );

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
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 94, 0, 110),
        selectedItemColor: Colors.amber,
        unselectedItemColor: Color.fromARGB(255, 99, 93, 93),
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.forum),
            label: 'Foro',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home_page()),
              );                break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GetVideoPage()),
              );
              break;
            case 2:
            //  Navigator.pushReplacementNamed(context, '/SettingsPage');
              break;
          }
        },
      ),
    );
  }
}

class AudioItemWidget extends StatefulWidget {
  final PostModel post;

  const AudioItemWidget({Key? key, required this.post}) : super(key: key);

  @override
  _AudioItemWidgetState createState() => _AudioItemWidgetState();
}

class _AudioItemWidgetState extends State<AudioItemWidget> {
  late AudioPlayer player;
  bool isPlaying = false;
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
    return InkWell(
     // onTap: () => _showBottomSheet(context),
      child: Container(

        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 39, 66, 88),
          borderRadius: BorderRadius.circular(10.0),
        ),

        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        'assets/images/perfil.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      widget.post.description,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Positioned(
                    top: 56,
                    child: CircleAvatar(
                      radius: 15,
                      backgroundImage: AssetImage('assets/images/perfil.jpg'),
                    ),
                  ),
                ],
              ),
              Row(
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

              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Comentar',
                    style: TextStyle(color: Colors.white),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                      SizedBox(width: 5),
                      Text(
                        '23',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


}
