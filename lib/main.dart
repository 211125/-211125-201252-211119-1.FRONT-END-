import 'package:flutter/material.dart';
import 'package:flutter_application_1/postcase_config.dart';

import 'package:flutter_application_1/publication/data/datasources/user_data_source.dart';
import 'package:flutter_application_1/publication/domain/repositories/user_repository.dart';
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
import 'package:flutter_application_1/reactioncase_config.dart';
import 'package:flutter_application_1/users/presentations/page/postLogin_page.dart';
import 'package:flutter_application_1/userscase_config.dart';
import 'movil/interfaz.dart';
import 'reaction/presentations/blocs/getReaction/getReaction_bloc.dart';
import 'reaction/presentations/blocs/poshReaction/poshReaction_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'users/presentations/blocs/postLogin/postLogin_bloc.dart';
import 'users/presentations/blocs/postUser/postUser_bloc.dart';
import 'users/presentations/page/home_page.dart';
import 'users/presentations/page/postUser_page.dart';

//como mandar una imagen de flutter al back
UsercaseConfig usercaseConfig = UsercaseConfig();
PostcaseConfig postcaseConfig = PostcaseConfig();
ReactioncaseConfig reactioncaseConfig = ReactioncaseConfig();

void main() {

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
              getaudioUseCase: postcaseConfig.getaudioUseCase
          ),
        ),
        BlocProvider<GetPostBloc>(
          create: (context) => GetPostBloc(
              getpostUseCase: postcaseConfig.getpostUseCase
          ),
        ),
        BlocProvider<GetvideoBloc>(
          create: (context) => GetvideoBloc(
              getvideoUseCase: postcaseConfig.getvideoUseCase
          ),
        ),

        BlocProvider<CreatePostBloc>(
          create: (context) => CreatePostBloc(
              createUserUseCase: postcaseConfig.createpostUseCase
          ),
        ),

        BlocProvider<GetgifBloc>(
          create: (context) => GetgifBloc(
              getgitUseCase: postcaseConfig.getgitUseCase
          ),
        ),

        BlocProvider<GetpdfBloc>(
          create: (context) => GetpdfBloc(
              getpdfUseCase: postcaseConfig.getpdfUseCase
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
//reaction
        BlocProvider<GetReactionBloc>(
          create: (context) => GetReactionBloc(
              getReactionCountUseCase: reactioncaseConfig.getReactionCountUseCase
          ),
        ),

        BlocProvider<PoshReactionBloc>(
          create: (context) => PoshReactionBloc(
              poshReactionUseCase: reactioncaseConfig.poshReactionUseCase
          ),
        ),



      ],
      child: MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BottomSheetApp(),
    );
  }
}







// BlocProvider<CreatePostBloc>(
// create: (context) => CreatePostBloc(createUserUseCase:  postcaseConfig.createpostUseCase),

//create: (context) => CreatePostBloc(
//  createUserUseCase: postcaseConfig.createUserUseCase

// poshCreateUsersUseCase: usercaseConfig.poshCreateUsersUseCase
// ),
// child: CreatePostPage(bloc: BlocProvider.of<CreatePostBloc>(context)),
// ),
/*class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:CreateUserPage(bloc: BlocProvider.of<CreateUserBloc>(context)),
      //BlocProvider<CreateUserBloc>(
       // create: (context) => CreateUserBloc(
         //   poshCreateUsersUseCase: usercaseConfig.poshCreateUsersUseCase
        //),
       // child: CreateUserPage(bloc: BlocProvider.of<CreateUserBloc>(context)),
      //),
    );
  }
}
*/






