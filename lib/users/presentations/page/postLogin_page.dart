import 'package:flutter/material.dart';
import 'package:flutter_application_1/users/presentations/page/postUser_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../publication/presentations/pages/getPost_page.dart';
import '../blocs/postLogin/postLogin_bloc.dart';
import '../blocs/postLogin/postLogin_event.dart';
import '../blocs/postLogin/postLogin_state.dart';
import '../blocs/postUser/postUser_bloc.dart';
import '../blocs/postUser/postUser_state.dart';
import 'RegisterPage.dart';
import 'home_page.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login '),
        backgroundColor: Colors.blue, // Setting app bar background color
      ),
      body: BlocListener<PostLoginBloc, PostLoginState>(
        listener: (context, state) {
          if (state is PostLoginSuccess) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => foto()),
            );
          }
        },
        child: BlocBuilder<PostLoginBloc, PostLoginState>(
          builder: (context, state) {
            if (state is PostLoginLoading) {
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue), // Setting color of the loading indicator
                ),
              );
            } else if (state is PostLoginFailure) {
              return Center(
                child: Text(
                  'Login Failed: ${state.message}',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16.0,
                  ),
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0), // Setting border radius of the text field
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0), // Setting border radius of the text field
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<PostLoginBloc>(context).add(
                          PostLoginStarted(
                            email: _emailController.text,
                            password: _passwordController.text,
                          ),
                        );
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue, // Setting button background color
                        onPrimary: Colors.white, // Setting text color of the button
                        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 50.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0), // Setting border radius of the button
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CreateUserPage(bloc: BlocProvider.of<CreateUserBloc>(context)),
                          ),
                        );
                      },
                      child: Text(
                        'register',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue, // Setting button background color
                        onPrimary: Colors.white, // Setting text color of the button
                        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 50.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0), // Setting border radius of the button
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
