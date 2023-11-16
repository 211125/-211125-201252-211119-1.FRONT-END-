import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

import '../publication/presentations/pages/getPdf_page.dart';
import '../publication/presentations/pages/getaudio_page.dart';

class BottomSheetApp extends StatelessWidget {
  const BottomSheetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Foro',
            style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
          ),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
            onPressed: () {},
          ),
          elevation: 0.0, // Elimina el sombreado de la AppBar
        ),
        body: Column(
          children: [
            Expanded(child: GetAudioPage()),
            Expanded(child: BottomSheetExample()),
          ],
        ),
      ),
    );
  }
}

class BottomSheetExample extends StatelessWidget {
  BottomSheetExample({Key? key}) : super(key: key);
  int _currentIndex = 2; // Índice del ítem del foro

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.forum),
            label: 'Foro',
          ),
        ],
        onTap: (index) {
          // Aquí puedes cambiar el índice actual
          // _currentIndex = index; (Necesitarás un StatefulWidget para esto)
        },
      ),
    );
  }
}
