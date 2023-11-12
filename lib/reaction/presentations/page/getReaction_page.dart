
import 'package:flutter/material.dart';

import '../../data/datasources/reaction_data_source.dart';import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/getReaction/getReaction_bloc.dart';
import '../blocs/getReaction/getReaction_event.dart';
import '../blocs/getReaction/getReaction_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/reaction/presentations/blocs/getReaction/getReaction_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MyButtonScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Interfaz de Ejemplo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<GetReactionBloc>(context).add(FetchReactionCountEvent(id: 4));
              },
              child: Text('Obtener Reacción'),
            ),
            BlocBuilder<GetReactionBloc, GetReactionState>(
              builder: (context, state) {
                if (state is GetReactionLoading) {
                  return CircularProgressIndicator();
                } else if (state is GetReactionLoaded) {
                  return Text('Conteo de reacciones: ${state.count}');
                } else if (state is GetReactionError) {
                  return Text('Error: ${state.message}');
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
