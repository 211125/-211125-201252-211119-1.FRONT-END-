import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/publication/data/models/getuser_model.dart';


import '../bloc/getgif/getgif_bloc.dart';
import '../bloc/getgif/getgif_event.dart';
import '../bloc/getgif/getgif_state.dart';
import 'fondo.dart';
import 'getPost_page.dart';
import 'getVideo_page.dart';
import 'getaudio_page.dart';



class GetGifPage extends StatefulWidget {
  @override
  _GetGifPageState createState() => _GetGifPageState();
}

class _GetGifPageState extends State<GetGifPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetgifBloc>(context).add(FetchgifEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Images'),
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
        child: BlocBuilder<GetgifBloc, GetgifState>(
          builder: (context, state) {
            if (state is GetgifInitialState) {
              return Text('Press the button to fetch posts.');
            } else if (state is GetgifLoadingState) {
              return CircularProgressIndicator();
            } else if (state is GetgifLoadedState) {
              List<PostModel> posts = state.posts;
              return ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(10.0),
                    child: SocialCardC(
                      username: posts[index].userProfile,
                      userImage: posts[index].multimedia,
                      postImage: posts[index].multimedia,
                      description: posts[index].description,
                    ),
                  );
                },
              );
            } else if (state is GetgifErrorState) {
              return Text('Error occurred: ${state.error}');
            } else {
              return Container();
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<GetgifBloc>(context).add(FetchgifEvent());
        },
        tooltip: 'Fetch Posts',
        child: Icon(Icons.file_download),
        backgroundColor: Colors.purple, // Cambia el color del botón a morado
      ),
    );
  }
}
