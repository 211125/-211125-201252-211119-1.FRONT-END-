import 'package:flutter/material.dart';

import '../../../comment/presentations/page/comment_Page.dart';

class SocialCardC extends StatefulWidget {
  final String username;
  final String userImage;
  final String postImage;
  final String description;
  final int idpublicacion;

  SocialCardC({
    required this.idpublicacion,
    required this.username,
    required this.userImage,
    required this.postImage,
    required this.description,
  });

  @override
  _SocialCardState createState() => _SocialCardState();
}

class _SocialCardState extends State<SocialCardC> {
  bool isLiked = false;
  int likeCount = 0;

  void _likePost() {
    setState(() {
      if (isLiked) {
        likeCount -= 1;
        isLiked = false;
      } else {
        likeCount += 1;
        isLiked = true;
      }
    });
  }
  void _showcomment(BuildContext context,int idPublicacion) {
    showModalBottomSheet<void>(
      isScrollControlled: true, // Permite que el modal cubra toda la pantalla
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.8,
          child: commentPage(idPublicacion:idPublicacion),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
       // border: Border.all(color: Colors.purple, width: 2.0), // Agrega el borde
        borderRadius: BorderRadius.circular(12.0), // Ajusta el radio del borde
        color: Color.fromARGB(255, 39, 66, 88),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListTile(
            contentPadding: EdgeInsets.all(0), // Ajusta el relleno del ListTile
            leading: CircleAvatar(
              radius: 20.0, // Ajusta el radio del avatar
              backgroundImage: NetworkImage(widget.userImage),
            ),
            title: Text(
              widget.username,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10.0), // Añade espacio entre el ListTile y la imagen
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0), // Ajusta el radio de la imagen
            child: Image.network(
              widget.postImage,
              height: 200.0, // Ajusta la altura de la imagen
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10.0), // Añade espacio entre la imagen y la descripción
          Text(
            widget.description,
            style: TextStyle(fontSize: 16.0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap:() => _showcomment(context,widget.idpublicacion),
                child: Text(
                  'Comentar',
                  style: TextStyle(color: Colors.white),
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }
}
