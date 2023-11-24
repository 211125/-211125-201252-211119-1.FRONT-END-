import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart'; // Importar el paquete file_picker

import '../../../users/presentations/blocs/postLogin/postLogin_bloc.dart';
import '../../data/models/posh_model.dart';
import '../bloc/createpost/createpost_bloc.dart';
import '../bloc/createpost/createpost_event.dart';
import '../bloc/createpost/createpost_state.dart';


class CreatePostPage extends StatefulWidget {
  CreatePostBloc bloc;

  CreatePostPage({required this.bloc});

  @override
  _CreatePostPageState createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  final _picker = ImagePicker();
  String? _imagePath;
  final _userIdController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final postLoginBloc = context.read<PostLoginBloc>();

    return Scaffold(
      appBar: AppBar(title: Text('Crear publicación')),
      body: BlocBuilder<CreatePostBloc, CreatePostState>(
        bloc: widget.bloc,
        builder: (context, state) {
          if (state is UserLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is UserCreationFailure) {
            return Center(child: Text('Error al crear la publicación'));
          } else {
            return Column(
              children: [
                

                TextFormField(
                  controller: _descriptionController,
                  decoration: InputDecoration(labelText: 'Descripción'),
                ),
                ElevatedButton(
                  child: Text('Seleccionar archivo'),
                  onPressed: () async {
                    FilePickerResult? result = await FilePicker.platform.pickFiles(
                      type: FileType.custom,
                      allowedExtensions: ['jpg', 'png', 'gif', 'mp4', 'mp3','pdf'],

                    );
                    if (result != null) {
                      PlatformFile file = result.files.first;
                      if (file.extension == 'jpg' || file.extension == 'png' || file.extension == 'gif'|| file.extension == 'mp3' || file.extension == 'mp4'|| file.extension == 'pdf') {

                        setState(() {
                          _imagePath = file.path;
                        });
                      } else {
                        // Para otros tipos de archivo como audio o video
                        setState(() {
                          _imagePath = file.path; // Aquí puedes almacenar la ruta o el archivo según sea necesario para tu lógica de negocio
                        });
                      }
                    }
                  },
                ),

                ElevatedButton(
                  child: Text('Crear publicación'),
                  onPressed: () {
                    if (_imagePath != null) {
                      int userId = postLoginBloc.userId ?? 0; // Obtener el userId
                      print("mi user id${userId}");

                      print(userId);
                      context.read<CreatePostBloc>().add(CreateUserEvent(
                        user: createModel(
                          userId: userId,
                          description: _descriptionController.text,
                          filePath: _imagePath!,
                        ),
                      ));
                      print("_imagePath");
                      print(_imagePath!);

                   // widget.bloc.add(CreateUserEvent(user: createModel(userId: "1", courseId:"contaduria", description:"_descriptionController.text", filePath:"/home/osvaldoangel/Imágenes/Capturas de pantalla/Captura desde 2023-10-18 18-46-09.png")));
                    }
                  },
                ),

              ],
            );
          }
        },
      ),
    );
  }
}
