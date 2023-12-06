import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/publication/data/models/getuser_model.dart';

import '../../../comment/presentations/page/comment_Page.dart';
import '../bloc/getaudio/getaudio_bloc.dart';
import '../bloc/getaudio/getaudio_event.dart';
import '../bloc/getpost/getpost_bloc.dart';
import '../bloc/getpost/getpost_event.dart';
import '../bloc/getvideo/getvideo_bloc.dart';
import '../bloc/getvideo/getvideo_event.dart';
import '../page/addpuc.dart';
import '../../../transaction/presentations/page/home_page.dart';
import '../bloc/createpost/createpost_bloc.dart';
import 'getPost_page.dart';
import 'getVideo_page.dart';
import 'getaudio_page.dart';
import 'widgets/PDFViewerScreen.dart';

import '../bloc/getpdf/getpdf_bloc.dart';
import '../bloc/getpdf/getpdf_event.dart';
import '../bloc/getpdf/getpdf_state.dart';

class Getpdf_page extends StatefulWidget {
  @override
  _getpdf createState() => _getpdf();
}

class _getpdf extends State<Getpdf_page> {
  int _currentIndex = 1; // Índice del ítem del foro
  @override
  void initState() {
    super.initState();

    // Emitir evento para cargar los datos PDF al iniciar
    context.read<GetpdfBloc>().add(FetchpdfEvent());

    // Escuchar cambios de conectividad para mostrar el snackBar
    late StreamSubscription<ConnectivityResult> subscription;
    subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Se perdió la conectividad Wi-Fi', style: TextStyle()),
            duration: Duration(seconds: 3),
          ),
        );
      }
    });
  }
  void _showcomment(BuildContext context,int idPublicacion) {
    showModalBottomSheet<void>(
      isScrollControlled: true, // Permite que el modal cubra toda la pantalla
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.8,
          child: commentPage(idPublicacion:idPublicacion),
        );
      },
    );
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
  void _showPdfModal(BuildContext context, String pdfUrl) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.8,
          child: PDFViewerScreen(pdfUrls: [pdfUrl]),
        );
      },
    );
  }
  //
  void _fetchData() async {
    try {
      context.read<GetpdfBloc>().add(FetchpdfEvent());
    } catch (e) {
      _showConnectivityError();
    }
  }

  void _showConnectivityError() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Conéctate a internet'),
        duration: Duration(seconds: 3),
      ),
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
                  BlocProvider.of<GetpdfBloc>(context).add(FetchpdfEvent());

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
        child: BlocBuilder<GetpdfBloc, GetpdfState>(
          builder: (context, state) {
            if (state is GetpdfInitialState) {
              return Text('Press the button to fetch posts.');
            } else if (state is GetpdfLoadingState) {
              return CircularProgressIndicator();
            } else if (state is GetpdfLoadedState) {
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
                                      'assets/images/icono2.png',
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
                                GestureDetector(
                                  onTap:() => _showcomment(context, posts[index].id),
                                  child: Text(
                                    'Comentar',
                                    style: TextStyle(color: Colors.white),
                                  ),
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
            } else if (state is GetpdfErrorState) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Algo salió mal, por favor intenta nuevamente.'),
                    Image.asset('assets/images/gesper.png'), // Agregar la imagen aquí
                    ElevatedButton(
                      onPressed: _fetchData,
                      child: Text('Reintentar'),
                    ),
                  ],
                ),
              );            } else {
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
