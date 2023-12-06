import 'package:flutter/material.dart';
import 'package:flutter_application_1/publication/data/models/getuser_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/getpost_usercase.dart.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Aquí importarías tus clases y paquetes necesarios

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/getaudio/getaudio_bloc.dart';
import '../bloc/getaudio/getaudio_event.dart';
import '../bloc/getaudio/getaudio_state.dart';


/*
class prueba extends StatefulWidget {
  @override
  _prueba createState() => _prueba();
}

class _prueba extends State<prueba> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetaudioBloc>(context).add(FetchaudioEvent());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Post Example'),
      ),
      body: Center(
        child: BlocBuilder<GetaudioBloc, GetaudioState>(
          builder: (context, state) {
            if (state is GetaudioInitialState) {
              return Text('Press the button to fetch posts.');
            } else if (state is GetaudioLoadingState) {
              return CircularProgressIndicator();
            } else if (state is GetaudioLoadedState) {
              // Aquí puedes mostrar los datos en la interfaz
              List<PostModel> posts = state.posts; // Reemplaza 'posts' con el nombre real de tu lista de publicaciones
              return ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      title: Text(posts[index].description),

                      subtitle: Text(posts[index].multimedia)

                  );
                },
              );
            } else if (state is GetaudioErrorState) {
              return Text('Error occurred: ${state.error}');
            } else {
              return Container();
            }
          },
        ),
      ),

    );
  }
}*/