import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/publication/data/models/getuser_model.dart';

import '../../../movil/pdf_prueba.dart'; // Asegúrate de que esta es la ruta correcta
import '../bloc/getpdf/getpdf_bloc.dart';
import '../bloc/getpdf/getpdf_event.dart';
import '../bloc/getpdf/getpdf_state.dart';

class Getpdf_page extends StatefulWidget {
  @override
  _getpdf createState() => _getpdf();
}

class _getpdf extends State<Getpdf_page> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetpdfBloc>(context).add(FetchpdfEvent());
  }

  void _showPdfModal(BuildContext context, String pdfUrl) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.8,
          child: PDFViewerScreen(pdfUrls: [pdfUrl]),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<GetpdfBloc, GetpdfState>(
          builder: (context, state) {
            if (state is GetpdfInitialState) {
              return Text('Press the button to fetch posts.');
            } else if (state is GetpdfLoadingState) {
              return CircularProgressIndicator();
            } else if (state is GetpdfLoadedState) {
              List<PostModel> posts = state.posts;
              return ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => _showPdfModal(context, posts[index].multimedia),
                    child: Container(
                      margin: EdgeInsets.all(10), // Margen para cada publicación
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
                                      'assets/images/icono2.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 16),
                                Expanded(
                                  child: Text(
                                    posts[index].description,
                                    style: TextStyle(color: Colors.white),
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
                                      '23', // Este número puede ser dinámico según tu modelo de datos
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            } else if (state is GetpdfErrorState) {
              return Text('Error occurred: ${state.error}');
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
