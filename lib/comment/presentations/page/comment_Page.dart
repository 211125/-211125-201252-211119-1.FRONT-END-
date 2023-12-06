import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../users/presentations/blocs/postLogin/postLogin_bloc.dart';
import '../../data/models/getcomment.dart';
import '../blocs/getcomment/getcomment_bloc.dart';
import '../blocs/poshcomment/poshcommentBloc.dart';





class commentPage extends StatefulWidget {
  final int idPublicacion; // Agrega esta línea

  commentPage({Key? key, required this.idPublicacion}) : super(key: key); // Modifica el constructor

  @override
  _commentPage createState() => _commentPage();
}

class _commentPage extends State<commentPage> {
  final TextEditingController _commentController = TextEditingController();

  late int userId;

  @override
  void initState() {
    super.initState();


    BlocProvider.of<GetcommentBloc>(context).add(FetchcommentEvent(idpublicacion: widget.idPublicacion));
  }

  @override
  Widget build(BuildContext context) {

    final postLoginBloc = context.read<PostLoginBloc>();
    userId = postLoginBloc.userId ?? 0;
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Post Example'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: BlocBuilder<GetcommentBloc, GetcommentState>(
                builder: (context, state) {
                  if (state is GetcommentInitialState) {
                    return Text('Press the button to fetch posts.');
                  } else if (state is GetcommentLoadingState) {
                    return CircularProgressIndicator();
                  } else if (state is GetcommentLoadedState) {
                    // Aquí puedes mostrar los datos en la interfaz
                    List<GetCommentModel> posts = state.posts; // Reemplaza 'posts' con el nombre real de tu lista de publicaciones
                    return ListView.builder(
                      itemCount: posts.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                            title: Text(posts[index].userName),

                            subtitle: Text(posts[index].content)

                        );
                      },
                    );
                  } else if (state is GetcommentErrorState) {
                    return Text('Error occurred: ${state.error}');
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _commentController,
                    decoration: InputDecoration(
                      hintText: 'Comentar...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                  String  comment= _commentController.text;
                    commentPressed evet1 = commentPressed(id_user: userId, id_publicacion: widget.idPublicacion, content: comment );
                    context.read<poshcommentBloc>().add(evet1);
                    // Aquí puedes manejar la lógica para enviar el comentario
                    print('Comentario enviado: ${_commentController.text}');

                    _commentController.clear();

                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}