import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart'; // Importa el paquete intl
import 'package:fluttertoast/fluttertoast.dart'; // Importa fluttertoast

import '../blocs/poshTransaction/poshTransactionBloc.dart';

class Payment {
  String description;
  double amount;
  String category;

  Payment(this.description, this.amount, this.category);
}

class poshaddBalancePage extends StatefulWidget {
  @override
  _PoshTransactionPageState createState() => _PoshTransactionPageState();
}

class _PoshTransactionPageState extends State<poshaddBalancePage> {
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _amountController = TextEditingController();
  String selectedCategory = "Comida";

  int getCategoryID(String category) {
    switch (category) {
      case 'Comida':
        return 1;
      case 'Transporte':
        return 2;
      case 'Renta':
        return 3;
      case 'Otros':
        return 4;
      default:
        return 0; // O un valor que consideres apropiado por defecto
    }
  }

  List<String> categories = ["Comida", "Transporte", "Renta", "Otros"];

  List<Payment> payments = [];
  void _registerPayment() {
    // Verifica si los campos están vacíos
    if (_descriptionController.text.isEmpty || _amountController.text.isEmpty) {
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

    // Si no están vacíos, continúa con el registro
    String date = DateFormat("yyyy-MM-ddTHH:mm:ss").format(DateTime.now());
    bool type = true;
    int amount = int.tryParse(_amountController.text) ?? 0;
    String description = _descriptionController.text;
    int categoriId = 4;
    int accountId = 1;

    CreatetransactionPressed event = CreatetransactionPressed(
      date: date,
      type: type,
      amount: amount,
      description: description,
      categoriId: categoriId,
      accountId: accountId,
    );

    context.read<CreatetransactionBloc>().add(event);

    Fluttertoast.showToast(
        msg: "Registro exitoso",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'nuevo ingreso',
          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
          onPressed: () {
            // Acción para el botón de atrás
          },
        ),
        elevation: 0.0, // Elimina el sombreado de la AppBar
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                color: Colors.white70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Available balance',
                      style: TextStyle(color: Colors.purple, fontSize: 20),
                    ),
                    Text(
                      '\$ 2,000',
                      style: TextStyle(color: Colors.green, fontSize: 18),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Descripción'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Monto'),
              ),
              SizedBox(height: 10),

              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _registerPayment,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
                ),
                child: Text(
                  'Registrar ingreso',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
