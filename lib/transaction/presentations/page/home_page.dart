import 'package:flutter/material.dart';
import 'package:flutter_application_1/transaction/presentations/page/poshTransaction_page.dart';
import 'package:flutter_application_1/transaction/presentations/page/poshaddBalance_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../publication/presentations/pages/getVideo_page.dart';
import '../blocs/getbalance/getBalanceBloc.dart';
import 'getAlltransaction_page.dart';

class Home_page extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home_page> {
  int _currentIndex = 0;
  int id = 1;
  int userId = 1;
  @override
  void initState() {
    super.initState();

    context
        .read<GetBalanceBloc>()
        .add(FetchBalanceEvent(id: id, userId: userId));
  }

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
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => poshaddBalancePage()),
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/deposito.png',
                                width: 40,
                                height: 40,
                              ),
                              Text(
                                'Depósito',
                                style: TextStyle(
                                    color: Colors.yellow, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    BlocBuilder<GetBalanceBloc, GetBalanceState>(
                      builder: (context, state) {
                        String balance = "Cargando..."; // Valor por defecto
                        if (state is GetBalanceLoadedState) {
                          balance =
                              '\$ ' + state.balances.first.balance.toString();
                        } else if (state is GetBalanceErrorState) {
                          balance = "Error: " + state.error;
                          print("Error: " + state.error);
                        }
                        return Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            balance,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 50),
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
                      child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => PoshTransactionPage()),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/expense.png',
                          width: 40,
                          height: 40,
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
                  )),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/grafica.png',
                          width: 40,
                          height: 40,
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
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => getAlltransactionpage()),
                    );
                  },
                  child:Text(
                      'Ver todo',
                      style: TextStyle(
                        color: Colors.purple,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
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
              icon: Icon(Icons.forum),
              label: 'Foro',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Setting',
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
            switch (index) {
              case 0:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home_page()),
                );
                break;
              case 1:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GetVideoPage()),
                );
                break;
              case 2:
                //  Navigator.pushReplacementNamed(context, '/SettingsPage');
                break;
            }
          },
        ),
      ),
    );
  }
}
