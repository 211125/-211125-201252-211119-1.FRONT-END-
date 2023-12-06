import 'package:flutter/material.dart';
import 'package:flutter_application_1/users/presentations/page/postUser_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../publication/presentations/pages/widgets/PDFViewerScreen.dart';
import '../../../transaction/presentations/page/home_page.dart';
import '../../data/models/post_user.dart';
import '../blocs/postLogin/postLogin_bloc.dart';

import 'package:fluttertoast/fluttertoast.dart';

import '../blocs/postUser/postUser_bloc.dart';
import '../blocs/postUser/postUser_event.dart';
import 'RegisterPage.dart';
class RegisterPage extends StatefulWidget {



  @override
  _RegisterPageState createState() => _RegisterPageState();
}
class _RegisterPageState extends State<RegisterPage> {
  final _picker = ImagePicker();
  String? _imagePath;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  void _registerPayment()async {
    // Verifica si los campos están vacíos
    if (_nameController.text.isEmpty || _lastNameController.text.isEmpty|| _emailController.text.isEmpty|| _passwordController.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Error: campo vacío",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return;
    }




    context.read<CreateUserBloc>().add(CreateUserEvent(user: UserModel(name: _nameController.text, last_name:_lastNameController.text, gmail:_emailController.text, password:_passwordController.text, filePath:_imagePath!)));

    Fluttertoast.showToast(
        msg: "Registro exitoso",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
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
      body: SingleChildScrollView(
        child:Column(
          children: [

            Container(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center, // Alinea los elementos al centro vertical
                  children: <Widget>[


                    SizedBox(height: 20.0),
                    TextField(
                      controller: _nameController, // Asignar el controlador al campo de texto
                      decoration: InputDecoration(
                        hintText: 'agrege su nombre',
                        labelText: 'Nombre',
                      ),
                    ),

                    SizedBox(height: 20.0),
                    TextField(
                      controller: _lastNameController, // Asignar el controlador al campo de texto
                      decoration: InputDecoration(
                        hintText: 'agrege su apellido',
                        labelText: 'Apellido',
                      ),
                    ),

                    SizedBox(height: 20.0),
                    TextField(
                      controller: _emailController, // Asignar el controlador al campo de texto
                      decoration: InputDecoration(
                        hintText: 'agrege su gmail',
                        labelText: 'Gmail',
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
                    SizedBox(height: 20.0),
                    ElevatedButton(
                    onPressed: _registerPayment,

                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF5C2684)),
                        minimumSize: MaterialStateProperty.all<Size>(Size(double.infinity, 50)), // Ajusta el ancho y alto del botón
                      ),
                     /* onPressed: () {
                      if (_imagePath != null) {
                        context.read<CreateUserBloc>().add(CreateUserEvent(user: UserModel(name: _nameController.text, last_name:_lastNameController.text, gmail:_emailController.text, password:_passwordController.text, filePath:_imagePath!)));
                        /**/
                      }*/

                      child: Text(
                        'Register',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () =>_showPdfModal(context, "https://storage.googleapis.com/backsocialmovil.appspot.com/C3%20-%20A4%20-%20Aviso%20de%20privacidad%20simplificado.pdf?GoogleAccessId=firebase-adminsdk-7apgz%40backsocialmovil.iam.gserviceaccount.com&Expires=16447017600&Signature=mtUO%2BbEl75cfNqhkMndtE%2BTXNrenLRmiQ415AC%2BAiTPnqGBmVZEmAk7VbDccPcCwAhAAgPzDO%2Bq%2FhMi7M5aIAfZr8H7BuWUibWCRVvXjN2lzBtazsk%2FFmsd%2BmDrsCr5k3k1xP5y8HnxTdzFvTywc3f1EhLisPnyHDN9PxbiylHd5YzshQHky9E3o3bXNvrGD0Cf%2BE37UYXtUcJv5thxW8f0vI6Ik0QPNCy1MgvPH20fImNQtplKSVyHBhBZSjXLFUJhRlCKuSQU0ZjpV5%2BhMF8aQ7Jq%2FBKXhx9X97g3DgJ9fcan36ERN1CBHtJEH6c7Jyj72nBSVigD9SC3Nw5Nuyg%3D%3D"),

                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF5C2684)),
                        minimumSize: MaterialStateProperty.all<Size>(Size(double.infinity, 50)), // Ajusta el ancho y alto del botón
                      ),
                      /* onPressed: () {
                      if (_imagePath != null) {
                        context.read<CreateUserBloc>().add(CreateUserEvent(user: UserModel(name: _nameController.text, last_name:_lastNameController.text, gmail:_emailController.text, password:_passwordController.text, filePath:_imagePath!)));
                        /**/
                      }*/

                      child: Text(
                        'Aviso de privacidad',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 10.0), // Añadido para el espacio entre el botón y el texto
                    InkWell( // Utiliza InkWell para efecto visual al tocar
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CreateUserPage(bloc: BlocProvider.of<CreateUserBloc>(context),)), // Asegúrate de tener una clase RegisterPage
                        );
                      },
                      child: Text(
                        'Create an account?',
                        style: TextStyle(
                          color: Color(0xFF5C2684),
                          //  decoration: TextDecoration.underline, // Opcional: Subraya el texto para dar aspecto de enlace
                        ),
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

