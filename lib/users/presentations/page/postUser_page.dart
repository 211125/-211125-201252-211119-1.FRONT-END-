import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_application_1/users/presentations/blocs/postUser/postUser_bloc.dart';
import 'package:flutter_application_1/users/presentations/blocs/postUser/postUser_event.dart';
import 'package:flutter_application_1/users/presentations/blocs/postUser/postUser_state.dart';

import '../../data/models/post_user.dart';

class CreateUserPage extends StatefulWidget {
  CreateUserBloc bloc;

  CreateUserPage({required this.bloc});

  @override
  _CreateUserPageState createState() => _CreateUserPageState();
}
class _CreateUserPageState extends State<CreateUserPage> {
  final _picker = ImagePicker();
  String? _imagePath;
  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Crear usuario')),
      body: BlocBuilder<CreateUserBloc, PostUserState>(
        bloc: widget.bloc,
        builder: (context, state) {
          if (state is PostUserLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is PostUserFailure) {
            return Center(child: Text('Error al crear el usuario'));
          } else {
            return Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Nombre'),
                ),
                TextFormField(
                  controller: _lastNameController,
                  decoration: InputDecoration(labelText: 'Apellido'),
                ),

                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Correo electrónico'),
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(labelText: 'Contraseña'),
                  obscureText: true,
                ),
                ElevatedButton(
                  child: Text('Seleccionar imagen'),
                  onPressed: () async {
                    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
                    setState(() {
                      if (pickedFile != null) {
                        _imagePath = pickedFile.path;
                      }
                    });
                  },
                ),
                ElevatedButton(
                  child: Text('Crear usuario'),
                  onPressed: () {
                    if (_imagePath != null) {
                      widget.bloc.add(CreateUserEvent(user: UserModel(name: _nameController.text, last_name:_lastNameController.text, gmail:_emailController.text, password:_passwordController.text, filePath:_imagePath!)));
                   /**/
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
