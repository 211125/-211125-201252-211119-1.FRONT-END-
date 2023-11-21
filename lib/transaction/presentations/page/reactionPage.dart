import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/addBalanceModel.dart';
import '../blocs/poshReaction/poshReaction_bloc.dart';
import '../blocs/poshReaction/poshReaction_event.dart';
class PoshReactionScreen extends StatelessWidget {
  final TextEditingController publicationIdController = TextEditingController();
  final TextEditingController userIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posh Reaction'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: publicationIdController,
              decoration: InputDecoration(labelText: 'Enter Publication ID'),
            ),
            TextField(
              controller: userIdController,
              decoration: InputDecoration(labelText: 'Enter User ID'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final String publicationId = publicationIdController.text;
                final String userId = userIdController.text;
                /*final reaction = ReactionModel(
                  publicationId: publicationId,
                  userId: userId,
                );*/
             //   BlocProvider.of<PoshReactionBloc>(context).add(
               //   PostReactionEvent(reaction),
                //);
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
