import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../transaction/presentations/page/home_page.dart';
import '../blocs/postLogin/postLogin_bloc.dart';

import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatelessWidget {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF5C2684),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Color(0xFF5C2684),
              padding: EdgeInsets.only(top: 95.0), // Ajusta este valor para cambiar la posición vertical
              child: Center(
                child: CustomLoginWidget(),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // Alinea los elementos al centro vertical
                children: <Widget>[
                  SizedBox(height: 20.0),
                  TextField(
                    controller: _emailController, // Asignar el controlador al campo de texto
                    decoration: InputDecoration(
                      hintText: 'Enter your email',
                      labelText: 'Email',
                    ),
                  ),
                  SizedBox(height: 20.0),
                  TextField(
                    controller: _passwordController, // Asignar el controlador al campo de texto
                    decoration: InputDecoration(
                      hintText: 'Enter your password',
                      labelText: 'Password',
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF5C2684)),
                      minimumSize: MaterialStateProperty.all<Size>(Size(double.infinity, 50)), // Ajusta el ancho y alto del botón
                    ),
                    onPressed: () async {

                      String email = _emailController.text;
                      String password = _passwordController.text;
                      bool login = await context.read<PostLoginBloc>().login(email, password);
                      if(login) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                Home_page(),
                          ),
                        );
                      }
                    },
                    child: Text(
                      'Log In',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 10.0), // Añadido para el espacio entre el botón y el texto
                  Text(
                    'Create an account?',
                    style: TextStyle(
                      color: Color(0xFF5C2684),
                    ),
                  ),
                 BlocBuilder<PostLoginBloc, InicioState>(
                      builder: (context, state) {
                        if(state is InicioCoordinadorLoading){
                          return const Text("Cargando ...");
                        } else if( state is InicioCoordinadorFailure){
                          print('Errores:');
                          print(state.error);
                          print('Errores e :');
                          Fluttertoast.showToast(
                            msg: state.error,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                          return Text(state.error);
                        }else {
                          return Container();
                        }
                      }
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomLoginWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
        ),
      ),
      child: Center(
        child: Text(
          'Login',
          style: TextStyle(
            color: Color(0xFF5C2684),
            fontSize: 16.0, // Ajusta el tamaño de fuente aquí
          ),
        ),
      ),
    );
  }
}

