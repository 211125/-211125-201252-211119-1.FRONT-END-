import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView( // Añadido para que sea desplazable y evite desbordamientos
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              SizedBox(height: 20),
              InputField(label: 'name'),
              SizedBox(height: 10),
              InputField(label: 'last_name'),
              SizedBox(height: 10),
              InputField(label: 'course'),
              SizedBox(height: 10),
              InputField(label: 'gmail'),
              SizedBox(height: 10),
              Container(
                width: 250,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'password',
                  ),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Aquí implementaría la lógica para seleccionar una imagen
                },
                child: Text('Select profilePicture'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurple,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                ),
                onPressed: () {
                  // Acción al presionar el botón
                },
                child: Text('Registrarse'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class InputField extends StatelessWidget {
  final String label;

  InputField({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(),
          labelText: label,
        ),
      ),
    );
  }
}
