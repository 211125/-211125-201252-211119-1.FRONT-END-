import 'package:flutter/material.dart';

void main() {
  runApp(Home_page());
}

class Home_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          backgroundColor: const Color.fromARGB(255, 94, 0, 110),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 140,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 94, 0, 110),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.account_balance_sharp,
                              color: Color.fromARGB(255, 255, 187, 0),
                              size: 40,
                            ),
                            Text(
                              'Depósito',
                              style:
                                  TextStyle(color: Colors.yellow, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        '\$ 2554.92',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only( left: 50), 
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Acceso rápido',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.swap_horizontal_circle_outlined,
                          color: Color.fromARGB(255, 255, 187, 0),
                          size: 40,
                        ),
                        Text(
                          'Gastos',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            //   fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.receipt_long,
                          color: Color.fromARGB(255, 255, 187, 0),
                          size: 40,
                        ),
                        Text(
                          'Gráfica',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 254, 254),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Transacciones',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Ver todo',
                      style: TextStyle(
                        color: Colors.purple,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(
                            41, 255, 0, 0), // Color verde más claro
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      child: Icon(
                        Icons.north_west_sharp,
                        color: Colors.red,
                        size: 20,
                      ),
                    ),
                    Text(
                      'Al fin pagaron!',
                      style: TextStyle(
                        color: Colors.black,
                        //  fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '-3,982.5',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(
                            55, 135, 250, 3), // Color verde más claro
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      child: Icon(
                        Icons.transit_enterexit_rounded,
                        color: Colors.green,
                        size: 20,
                      ),
                    ),
                    Text(
                      'Al fin pagaron!',
                      style: TextStyle(
                        color: Colors.black,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '+3,982.5',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          // currentIndex: _currentIndex,
          backgroundColor: const Color.fromARGB(255, 94, 0,
              110), // Color morado para el fondo de la barra de navegación
          selectedItemColor:
              Colors.amber, // Color amarillo para el ítem seleccionado
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
          onTap: (index) {},
        ),
      ),
    );
  }
}
