import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/publication/data/models/getuser_model.dart';
import '../../../users/presentations/blocs/postUser/postUser_bloc.dart';
import '../../../users/presentations/page/postUser_page.dart';
import '../../domain/usecases/getpost_usercase.dart.dart';
import '../bloc/createpost/createpost_bloc.dart';
import '../bloc/getpost/getpost_bloc.dart';
import '../bloc/getpost/getpost_event.dart';
import '../bloc/getpost/getpost_state.dart';

import 'createpost_page.dart';
import 'fondo.dart';
import 'getVideo_page.dart';
import 'getaudio_page.dart';
import 'getgif_page.dart';

class foto extends StatefulWidget {
  @override
  _fotoState createState() => _fotoState();
}

class _fotoState extends State<foto> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetPostBloc>(context).add(FetchPostEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('img'),
        backgroundColor: Colors.purple, // Cambia el color del AppBar a morado
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.image),
            onPressed: () {
              // Lógica para la opción de imagen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => foto()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.audiotrack),
            onPressed: () {
              // Lógica para la opción de audio
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GetAudioPage()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.animation),
            onPressed: () {
              // Lógica para la opción de animaciones
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GetGifPage()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.video_collection),
            onPressed: () {
              // Lógica para la opción de video GetVideoPage
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GetVideoPage()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: BlocBuilder<GetPostBloc, GetPostState>(
          builder: (context, state) {
            if (state is GetPostInitialState) {
              return Text('Loading posts...');
            } else if (state is GetPostLoadingState) {
              return CircularProgressIndicator();
            } else if (state is GetPostLoadedState) {
              List<PostModel> posts = state.posts;
              return ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(10.0),
                    child: SocialCardC(
                      username: posts[index].userFullName,
                      userImage: posts[index].multimedia,
                      postImage: posts[index].multimedia,
                      description: posts[index].description,
                    ),
                  );
                },
              );
            } else if (state is GetPostErrorState) {
              return Text('Error occurred: ${state.error}');
            } else {
              return Container();
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreatePostPage(bloc: BlocProvider.of<CreatePostBloc>(context)),
            ),
          );
        },


        tooltip: 'Fetch Posts',
        child: Icon(Icons.file_download),
        backgroundColor: Colors.purple, // Cambia el color del botón a morado
      ),
    );
  }
}
