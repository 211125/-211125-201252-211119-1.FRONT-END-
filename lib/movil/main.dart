import 'package:flutter/material.dart';



void main() => runApp(const BottomSheetApp());

class BottomSheetApp extends StatelessWidget {
  const BottomSheetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Bottom Sheet Sample')),
        body: const BottomSheetExample(),
      ),
    );
  }
}class BottomSheetExample extends StatelessWidget {
  const BottomSheetExample({Key? key}) : super(key: key);

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          color: Colors.amber,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text('Modal BottomSheet'),
                ElevatedButton(
                  child: const Text('Close BottomSheet'),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () => _showBottomSheet(context),
        child: Container(
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
                          'assets/images/perfil.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        '¿Saben qué es un egreso pasivo?',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Positioned(
                      top: 56,
                      child: CircleAvatar(
                        radius: 15,
                        backgroundImage: AssetImage('assets/images/perfil.jpg'),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Comentar',
                      style: TextStyle(color: Colors.white),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                        SizedBox(width: 5),
                        Text(
                          '23',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
