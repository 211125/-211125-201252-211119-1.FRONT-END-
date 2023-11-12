import 'package:flutter/material.dart';
import 'package:flutter_application_1/publication/data/models/getuser_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/getpost_usercase.dart.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import '../bloc/getvideo/getvideo_bloc.dart';
import '../bloc/getvideo/getvideo_event.dart';
import '../bloc/getvideo/getvideo_state.dart';
import 'fondo.dart';
import 'getPost_page.dart';
import 'getaudio_page.dart';
import 'getgif_page.dart';
import 'gifsocialcar.dart';

class GetVideoPage extends StatefulWidget {
  @override
  _GetVideoPageState createState() => _GetVideoPageState();
}

class _GetVideoPageState extends State<GetVideoPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetvideoBloc>(context).add(FetchvideoEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video'),
        backgroundColor: Colors.purple,
        actions: <Widget>[
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
      body: Center(
        child: BlocBuilder<GetvideoBloc, GetvideoState>(
          builder: (context, state) {
            if (state is GetvideoInitialState) {
              return Text('Press the button to fetch posts.');
            } else if (state is GetvideoLoadingState) {
              return CircularProgressIndicator();
            } else if (state is GetvideoLoadedState) {
              List<PostModel> posts = state.posts;
              return ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(posts[index].description),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('By: ${posts[index].userFullName}'),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VideoPlayerScreen(
                                  videoUrls: [posts[index].multimedia],
                                ),
                              ),
                            );
                          },
                          child: Text('Play Video'),
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        // Aquí va tu lógica para manejar el evento de clic del icono de corazón.
                        // Puede ser un cambio de estado, una función de manejo de datos, etc.
                      },
                      icon: Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    ),
                  );
                },
              );
            } else if (state is GetvideoErrorState) {
              return Text('Error occurred: ${state.error}');
            } else {
              return Container();
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("hola mundo");
        },
        tooltip: 'Fetch Posts',
        child: Icon(Icons.file_download),
      ),
    );
  }
}
