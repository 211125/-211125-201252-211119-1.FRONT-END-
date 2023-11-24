import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/publication/data/models/getuser_model.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../page/addpuc.dart';
import '../../../transaction/presentations/page/home_page.dart';
import '../bloc/createpost/createpost_bloc.dart';
import '../bloc/getvideo/getvideo_bloc.dart';
import '../bloc/getvideo/getvideo_event.dart';
import '../bloc/getvideo/getvideo_state.dart';
import 'getPdf_page.dart';
import 'getPost_page.dart';
import 'getaudio_page.dart';
import 'gifsocialcar.dart';
import 'widgets/PDFViewerScreen.dart'; // Asegúrate de que esta es la ruta correcta

class GetVideoPage extends StatefulWidget {
  @override
  _getpdf createState() => _getpdf();
}

class _getpdf extends State<GetVideoPage> {
  late StreamSubscription<ConnectivityResult> subscription;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetvideoBloc>(context).add(FetchvideoEvent());

    subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      print(result);
      print('hh');

      if(result == ConnectivityResult.wifi || result == ConnectivityResult.mobile) {
      //  context.read<ViewVoluntarysBloc>().add(GetVoluntarys(coneccion: true));
        //ScaffoldMessenger.of(context).clearSnackBars();
      } else {
        const snackBar = SnackBar(
          content: Text('Se perdió la conectividad Wi-Fi', style: TextStyle(),),
          duration: Duration(days: 365),
        );
        //ScaffoldMessenger.of(context).showSnackBar(snackBar);
       // context.read<ViewVoluntarysBloc>().add(GetVoluntarys(coneccion: false));
      }

    });
  }
  int _currentIndex = 1; // Índice del ítem del foro
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

  void _showPdfModal(BuildContext context, String pdfUrl) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true, // Permite que el modal cubra toda la pantalla
      builder: (BuildContext context) {
        // Datos ficticios de comentarios
        final List<Map<String, String>> comments = [
          {"username": "Usuario1", "comment": "Este es un gran video!"},
          {"username": "Usuario2", "comment": "Muy informativo. Gracias."},
          {"username": "Usuario1", "comment": "Este es un gran video!"},
          {"username": "Usuario1", "comment": "Este es un gran video!"},
          {"username": "Usuario1", "comment": "Este es un gran video!"},
          {"username": "Usuario1", "comment": "Este es un gran video!"},
          {"username": "Usuario1", "comment": "Este es un gran video!"},
          {"username": "Usuario1", "comment": "Este es un gran video!"},
        ];

        return Container(
          height: MediaQuery.of(context).size.height, // Usa la altura completa de la pantalla
          child: Column(
            children: <Widget>[
              // Barra para indicar que se puede deslizar hacia abajo para cerrar
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  width: 40.0,
                  height: 4.0,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                ),
              ),
              // Contenido del modal
              Expanded(
                child: VideoPlayerScreen(videoUrls: [pdfUrl]),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Agregar tu comentario aquí!!",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.send),
                      onPressed: () {
                        // Aquí va la lógica para manejar el envío del comentario
                      },
                    ),
                  ],
                ),
              ),              Expanded(
                child: ListView.builder(
                  itemCount: comments.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(comments[index]["username"] ?? ''),
                      subtitle: Text(comments[index]["comment"] ?? ''),
                    );
                  },
                ),
              ),
              // Campo para agregar comentario con botón de enviar

            ],
          ),
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
                  return InkWell(
                    onTap: () => _showPdfModal(context, posts[index].multimedia),
                    child: Container(
                      margin: EdgeInsets.all(10), // Margen para cada publicación
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
                                      'assets/images/video3.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 16),
                                Expanded(
                                  child: Text(
                                    posts[index].description,
                                    style: TextStyle(color: Colors.white),
                                  ),
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
                                      '23', // Este número puede ser dinámico según tu modelo de datos
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                          ],
                        ),
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
