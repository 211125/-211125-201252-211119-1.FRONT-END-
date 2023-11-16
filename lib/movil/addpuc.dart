import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';

import '../publication/data/models/posh_model.dart';
import '../publication/presentations/bloc/createpost/createpost_bloc.dart';
import '../publication/presentations/bloc/createpost/createpost_event.dart';
import '../publication/presentations/bloc/createpost/createpost_state.dart';

class Post_Page extends StatefulWidget {
  CreatePostBloc bloc;

  Post_Page({required this.bloc});

  @override
  _CreatePostPageState createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<Post_Page> {
  final _picker = ImagePicker();
  String? _imagePath;
  final _userIdController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CreatePostBloc, CreatePostState>(
        bloc: widget.bloc,
        builder: (context, state) {
          if (state is UserLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is UserCreationFailure) {
            return Center(child: Text('Error al crear la publicación'));
          } else {
            return SingleChildScrollView(
              child: Column(
                children: [

                  Container(

                   // width: MediaQuery.of(context).size.width * 0.6,
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
                              CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage('assets/images/perfil.jpg'),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: TextFormField(
                                  controller: _descriptionController,
                                  decoration: InputDecoration(
                                    hintText: 'Agrega publicación',
                                    hintStyle: TextStyle(
                                        color: Color.fromARGB(255, 114, 100, 100)),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                child: Text('Seleccionar archivo'),
                                onPressed: () async {
                                  FilePickerResult? result = await FilePicker.platform.pickFiles(
                                    type: FileType.custom,
                                    allowedExtensions: ['jpg', 'png', 'gif', 'mp4', 'mp3'], // Permitir extensiones de imagen, video y audio
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
                                style: ElevatedButton.styleFrom(
                                  primary: Color.fromARGB(255, 250, 84, 18),
                                ),
                              ),

                              ElevatedButton(
                                child: Text('Publicar'),
                                onPressed: () {
                                  if (_imagePath != null) {
                                    context.read<CreatePostBloc>().add(CreateUserEvent(
                                      user: createModel(
                                        userId: 1,
                                        description: _descriptionController.text,
                                        filePath: _imagePath!,
                                      ),
                                    ));
                                    print("_imagePath");
                                    print(_imagePath!);

                                    // widget.bloc.add(CreateUserEvent(user: createModel(userId: "1", courseId:"contaduria", description:"_descriptionController.text", filePath:"/home/osvaldoangel/Imágenes/Capturas de pantalla/Captura desde 2023-10-18 18-46-09.png")));
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Color.fromARGB(255, 250, 84, 18),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20), // Espacio entre el Container y los otros elementos



                ],
              ),
            );
          }
        },
      ),
    );
  }
}
