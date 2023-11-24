import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../users/presentations/blocs/postLogin/postLogin_bloc.dart';
import '../blocs/getAlltransaction/getAlltransactionBloc.dart';

class getAlltransactionpage extends StatefulWidget {
  @override
  _getAlltransactionpage createState() => _getAlltransactionpage();
}

class _getAlltransactionpage extends State<getAlltransactionpage> {
  int accountId = 1;
  late int userId;

  @override
  void initState() {
    final postLoginBloc = context.read<PostLoginBloc>();
    userId = postLoginBloc.userId ?? 0;

    super.initState();
    context.read<GetAllTransactionsBloc>().add(FetchGetallTransactionsBloceEvent(accountId: userId));
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: BlocBuilder<GetAllTransactionsBloc, GetalltransactionState>(
        builder: (context, state) {
          if (state is GetalltransactionLoadedState) {
            return ListView.builder(
              itemCount: state.balances.length,
              itemBuilder: (context, index) {
                String amountPrefix = state.balances[index].type ? '\$ ' : '- ';
                Widget transactionIcon = state.balances[index].type
                    ? Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(55, 135, 250, 3),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: Icon(
                    Icons.transit_enterexit_rounded,
                    color: Colors.green,
                    size: 20,
                  ),
                )
                    : Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(41, 255, 0, 0),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: Icon(
                    Icons.north_west_sharp,
                    color: Colors.red,
                    size: 20,
                  ),
                );

                return Padding(
                  padding: const EdgeInsets.all(8.0), // Agrega un margen a cada fila
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      transactionIcon, // Usa el contenedor según el tipo
                      Text(
                        state.balances[index].description,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        amountPrefix + state.balances[index].amount.toString(),
                        style: TextStyle(
                          color: state.balances[index].type ? Colors.green : Colors.red,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (state is GetalltransactionErrorState) {
            return Center(child: Text('Error: ${state.error}'));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
