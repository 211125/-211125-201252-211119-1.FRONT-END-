import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Red Social'),
      ),
      body: ListView(
        children: <Widget>[
          SocialCard(
            username: 'Nombre de Usuario',
            userImage: 'https://storage.googleapis.com/backsocialmovil.appspot.com/1.png?GoogleAccessId=firebase-adminsdk-7apgz%40backsocialmovil.iam.gserviceaccount.com&Expires=16447039200&Signature=JYrRGOYxczIycI3amstubYd2Y1ABrxA6SuIQHwUA%2Bp%2BumhInMp74oQiz8eWQQX7fari6VKVnrkRWbhhl5CBuuSQGMEExMxIZpWtmC%2FOZxr2weaKb2D13KR7kRa5eFn3VZabiLdMCV%2FOxZMALxI4L8sWBqhR2uimQPkbJ7y5i3dV6aKl9UeYEZmtgWhqirQuwQ9e%2FWSsWupLSkCWWyXp523hOCOtlSdVEBu0PKZfRYMaD%2B32l%2BceQutLI3KoFxR3rV5f0oeHcADBnpHr8Mm9%2BcocUCUA7bJOehmapoZDjuIf7Vpn89Pv43Cf90FMJMtHSbIVlaV%2F4yhR1qkhW1TncdQ%3D%3D',
            postImage: 'https://storage.googleapis.com/backsocialmovil.appspot.com/1.png?GoogleAccessId=firebase-adminsdk-7apgz%40backsocialmovil.iam.gserviceaccount.com&Expires=16447039200&Signature=JYrRGOYxczIycI3amstubYd2Y1ABrxA6SuIQHwUA%2Bp%2BumhInMp74oQiz8eWQQX7fari6VKVnrkRWbhhl5CBuuSQGMEExMxIZpWtmC%2FOZxr2weaKb2D13KR7kRa5eFn3VZabiLdMCV%2FOxZMALxI4L8sWBqhR2uimQPkbJ7y5i3dV6aKl9UeYEZmtgWhqirQuwQ9e%2FWSsWupLSkCWWyXp523hOCOtlSdVEBu0PKZfRYMaD%2B32l%2BceQutLI3KoFxR3rV5f0oeHcADBnpHr8Mm9%2BcocUCUA7bJOehmapoZDjuIf7Vpn89Pv43Cf90FMJMtHSbIVlaV%2F4yhR1qkhW1TncdQ%3D%3D',
            description: 'Descripción del post',
          ),
          SocialCard(
            username: 'Nombre de Usuario',
            userImage: 'https://storage.googleapis.com/backsocialmovil.appspot.com/1.png?GoogleAccessId=firebase-adminsdk-7apgz%40backsocialmovil.iam.gserviceaccount.com&Expires=16447039200&Signature=JYrRGOYxczIycI3amstubYd2Y1ABrxA6SuIQHwUA%2Bp%2BumhInMp74oQiz8eWQQX7fari6VKVnrkRWbhhl5CBuuSQGMEExMxIZpWtmC%2FOZxr2weaKb2D13KR7kRa5eFn3VZabiLdMCV%2FOxZMALxI4L8sWBqhR2uimQPkbJ7y5i3dV6aKl9UeYEZmtgWhqirQuwQ9e%2FWSsWupLSkCWWyXp523hOCOtlSdVEBu0PKZfRYMaD%2B32l%2BceQutLI3KoFxR3rV5f0oeHcADBnpHr8Mm9%2BcocUCUA7bJOehmapoZDjuIf7Vpn89Pv43Cf90FMJMtHSbIVlaV%2F4yhR1qkhW1TncdQ%3D%3D',
            postImage: 'https://storage.googleapis.com/backsocialmovil.appspot.com/1.png?GoogleAccessId=firebase-adminsdk-7apgz%40backsocialmovil.iam.gserviceaccount.com&Expires=16447039200&Signature=JYrRGOYxczIycI3amstubYd2Y1ABrxA6SuIQHwUA%2Bp%2BumhInMp74oQiz8eWQQX7fari6VKVnrkRWbhhl5CBuuSQGMEExMxIZpWtmC%2FOZxr2weaKb2D13KR7kRa5eFn3VZabiLdMCV%2FOxZMALxI4L8sWBqhR2uimQPkbJ7y5i3dV6aKl9UeYEZmtgWhqirQuwQ9e%2FWSsWupLSkCWWyXp523hOCOtlSdVEBu0PKZfRYMaD%2B32l%2BceQutLI3KoFxR3rV5f0oeHcADBnpHr8Mm9%2BcocUCUA7bJOehmapoZDjuIf7Vpn89Pv43Cf90FMJMtHSbIVlaV%2F4yhR1qkhW1TncdQ%3D%3D',
            description: 'Descripción del post',
          ),
          // Puedes añadir más SocialCard aquí si lo deseas
        ],
      ),
    );
  }
}
class SocialCard extends StatefulWidget {
  final String username;
  final String userImage;
  final String postImage;
  final String description;

  SocialCard({
    required this.username,
    required this.userImage,
    required this.postImage,
    required this.description,
  });

  @override
  _SocialCardState createState() => _SocialCardState();
}

class _SocialCardState extends State<SocialCard> {
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

  @override
  Widget build(BuildContext context) {
    return Container(
   decoration: BoxDecoration(
        border: Border.all(color: Colors.purple, width: 2.0), // Agrega el borde
        borderRadius: BorderRadius.circular(12.0), // Ajusta el radio del borde
        color: Color.fromARGB(255, 209, 118, 223), // Ajusta el color de fondo a morado
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
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  isLiked ? Icons.favorite : Icons.favorite_border,
                  color: isLiked ? Colors.red : null,
                ),
                onPressed: _likePost,
              ),
              Text('${likeCount}'),
            ],
          ),
        ],
      ),
    );
  }
}
