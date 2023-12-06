import 'package:flutter/material.dart';
import 'package:flutter_application_1/postcase_config.dart';

import 'package:flutter_application_1/publication/data/datasources/user_data_source.dart';
import 'package:flutter_application_1/publication/domain/repositories/user_repository.dart';
import 'package:flutter_application_1/publication/presentations/bloc/connectivity_service.dart';
import 'package:flutter_application_1/publication/presentations/bloc/createpost/createpost_bloc.dart';
import 'package:flutter_application_1/publication/presentations/bloc/getaudio/getaudio_bloc.dart';
import 'package:flutter_application_1/publication/presentations/bloc/getgif/getgif_bloc.dart';
import 'package:flutter_application_1/publication/presentations/bloc/getpdf/getpdf_bloc.dart';
import 'package:flutter_application_1/publication/presentations/bloc/getpost/getpost_bloc.dart';
import 'package:flutter_application_1/publication/presentations/bloc/getvideo/getvideo_bloc.dart';
import 'package:flutter_application_1/publication/presentations/pages/_audio.dart';
import 'package:flutter_application_1/publication/presentations/pages/createpost_page.dart';
import 'package:flutter_application_1/publication/presentations/pages/getPdf_page.dart';
import 'package:flutter_application_1/publication/presentations/pages/getPost_page.dart';
import 'package:flutter_application_1/publication/presentations/pages/getVideo_page.dart';
import 'package:flutter_application_1/publication/presentations/pages/getaudio_page.dart';
import 'package:flutter_application_1/publication/presentations/pages/getgif_page.dart';
import 'package:flutter_application_1/publication/presentations/pages/getprueba.dart';
import 'package:flutter_application_1/commentcase_config.dart';
import 'package:flutter_application_1/transaction/presentations/blocs/getAlltransaction/getAlltransactionBloc.dart';
import 'package:flutter_application_1/transaction/presentations/blocs/getbalance/getBalanceBloc.dart';
import 'package:flutter_application_1/transaction/presentations/blocs/poshTransaction/poshTransactionBloc.dart';
import 'package:flutter_application_1/transaction/presentations/blocs/poshaddBalance/poshaddBalanceBloc.dart';
import 'package:flutter_application_1/transaction/presentations/blocs/poshreduceBalance/poshreduceBalanceBloc.dart';
import 'package:flutter_application_1/transaction/presentations/page/home_page.dart';
import 'package:flutter_application_1/transaction/presentations/page/poshTransaction_page.dart';
import 'package:flutter_application_1/transaction/presentations/page/poshaddBalance_page.dart';
import 'package:flutter_application_1/users/presentations/page/postLogin_page.dart';
import 'package:flutter_application_1/userscase_config.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'addBalancecase_config.dart';
import 'comment/presentations/blocs/getcomment/getcomment_bloc.dart';
import 'comment/presentations/blocs/poshcomment/poshcommentBloc.dart';
import 'movil/interfaz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'users/presentations/blocs/postLogin/postLogin_bloc.dart';
import 'users/presentations/blocs/postUser/postUser_bloc.dart';
import 'users/presentations/page/home_page.dart';
import 'users/presentations/page/postUser_page.dart';

//como mandar una imagen de flutter al back
UsercaseConfig usercaseConfig = UsercaseConfig();
PostcaseConfig postcaseConfig = PostcaseConfig();
CommentcaseConfig commentcaseConfig =CommentcaseConfig();
TransactioncaseConfig transactioncaseConfig = TransactioncaseConfig();
final connectivityService = ConnectivityService();

void main() async {

  runApp(
    //posh
    //nombre-de usuario, reacion,descripsion,que no diplique la imagen o nombre unico de la imagen y cerrar secion 
    MultiProvider(
      providers: [

       // Provider<poshLocalDataSourceImp>( 
         // create: (context) => poshLocalDataSourceImp(),
        //),
        BlocProvider<GetaudioBloc>(
          create: (context) => GetaudioBloc(
              getaudioUseCase: postcaseConfig.getaudioUseCase,
            connectivityService: connectivityService,

          ),
        ),
        BlocProvider<GetPostBloc>(
          create: (context) => GetPostBloc(
              getpostUseCase: postcaseConfig.getpostUseCase,
            connectivityService: connectivityService,
          ),
        ),
        BlocProvider<GetvideoBloc>(
          create: (context) => GetvideoBloc(
              getvideoUseCase: postcaseConfig.getvideoUseCase,
            connectivityService: connectivityService,

          ),
        ),

        BlocProvider<CreatePostBloc>(
          create: (context) => CreatePostBloc(
              createUserUseCase: postcaseConfig.createpostUseCase,
            connectivityService: connectivityService,

          ),
        ),

        BlocProvider<GetgifBloc>(
          create: (context) => GetgifBloc(
              getgitUseCase: postcaseConfig.getgitUseCase
          ),
        ),

        BlocProvider<GetpdfBloc>(
          create: (context) => GetpdfBloc(
              getpdfUseCase: postcaseConfig.getpdfUseCase,
                  connectivityService: connectivityService, // Pasa el servicio aquí

          ),
        ),
//User
        BlocProvider<CreateUserBloc>(
          create: (context) => CreateUserBloc(
               poshCreateUsersUseCase: usercaseConfig.poshCreateUsersUseCase
          ),
        ),
        BlocProvider<PostLoginBloc>(
          create: (context) => PostLoginBloc(
              loginUser: usercaseConfig.loginUser
          ),
        ),
//comment
        BlocProvider<poshcommentBloc>(
          create: (context) => poshcommentBloc(
              poshcommentUseCase: commentcaseConfig.poshcommentUseCase
          ),
        ),
        BlocProvider<GetcommentBloc>(
            create: (context) => GetcommentBloc(
                getCommentUseCase: commentcaseConfig.getCommentUseCase
            )
        ),

//finansas

        BlocProvider<CreatetransactionBloc>(
          create: (context) => CreatetransactionBloc(
              createtransactionUseCase: transactioncaseConfig.createtransactionUseCase
          ),
        ),
        BlocProvider<AddBalanceBloc>(
          create: (context) => AddBalanceBloc(
              poshaddBalanceUseCase: transactioncaseConfig.poshaddBalanceUseCase
          ),
        ),
        BlocProvider<GetBalanceBloc>(
          create: (context) => GetBalanceBloc(
              getaccountUseCase: transactioncaseConfig.getaccountUseCase
          ),
        ),
        BlocProvider<GetAllTransactionsBloc>(
          create: (context) => GetAllTransactionsBloc(
              getAllTransactionsUseCase: transactioncaseConfig.getAllTransactionsUseCase,
            connectivityService: connectivityService,

          ),
        ),
        BlocProvider<ReduceBalanceBloc>(
          create: (context) => ReduceBalanceBloc(
              poshreduceBalanceUseCase: transactioncaseConfig.poshreduceBalanceUseCase
          ),
          //GetAllTransactionsBloc
        ),

      ],
      child: MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  // Esta función verifica si existe un token guardado
  Future<bool> isUserLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    return token != null && token.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder<bool>(
        future: isUserLoggedIn(),
        builder: (context, snapshot) {
          // Mientras se carga, puedes mostrar un indicador de carga
          if (!snapshot.hasData) return CircularProgressIndicator();

          // Si el usuario está logueado (existe token), muestra HomePage, de lo contrario LoginPage
          if (snapshot.data == true) {
            return Home_page();  // Asegúrate de tener una clase HomePage implementada
          } else {
            return LoginPage();
          }
        },
      ),
    );
  }
}

