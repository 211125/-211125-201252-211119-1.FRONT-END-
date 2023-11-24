import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/publication/data/models/getuser_model.dart';
import '../page/addpuc.dart';
import '../../../transaction/presentations/page/home_page.dart';
import '../../../users/presentations/blocs/postUser/postUser_bloc.dart';
import '../../../users/presentations/page/postUser_page.dart';
import '../../domain/usecases/getpost_usercase.dart.dart';
import '../bloc/createpost/createpost_bloc.dart';
import '../bloc/getpost/getpost_bloc.dart';
import '../bloc/getpost/getpost_event.dart';
import '../bloc/getpost/getpost_state.dart';

import 'createpost_page.dart';
import 'fondo.dart';
import 'getPdf_page.dart';
import 'getVideo_page.dart';
import 'getaudio_page.dart';
import 'getgif_page.dart';

class foto extends StatefulWidget {
  @override
  _fotoState createState() => _fotoState();
}

class _fotoState extends State<foto> {
  int _currentIndex = 1; // Índice del ítem del foro

  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetPostBloc>(context).add(FetchPostEvent());
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
                      username: posts[index].userProfile,
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
      /*floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Post_Page(bloc: BlocProvider.of<CreatePostBloc>(context)),
            ),
          );
        },


        tooltip: 'Fetch Posts',
        child: Icon(Icons.file_download),
        backgroundColor: Colors.purple, // Cambia el color del botón a morado
      ),*/
    );
  }
}
