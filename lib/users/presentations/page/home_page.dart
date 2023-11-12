import 'package:flutter/material.dart';



class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Column(
        children: <Widget>[
          // Encabezado
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/404.jpg'),
                  radius: 25,
                ),
                Icon(Icons.add, size: 30),
              ],
            ),
          ),

          // Cuerpo del mensaje
          Expanded(
            child: Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/images/404.jpg', // Aquí la imagen de la persona
                    height: 100,
                  ),
                  Image.asset(
                    'assets/images/404.jpg', // Aquí la imagen de la persona
                    height: 100,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'EYEWAR',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('A World Exclusive'),
                ],
              ),
            ),
          ),

          // Barra de herramientas de edición
          Container(
            height: 60,
            color: Colors.purple[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Icon(Icons.brush, size: 30),
                Slider(
                  value: 0.5,
                  onChanged: (double value) {
                    // Aquí puedes manejar el cambio de valor del slider
                  },
                ),
                Icon(Icons.delete, size: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
