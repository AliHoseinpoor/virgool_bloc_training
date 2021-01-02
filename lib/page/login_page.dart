import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:virgool_bloc_learn/bloc/login/check_login_cubit.dart';
import 'package:virgool_bloc_learn/bloc/login/check_login_event.dart';

import 'home_page.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Center(
        child: BlocConsumer<CheckLoginCubit, CheckLoginEvent>(
          listener: (context, CheckLoginEvent state) {
            if (state is CheckLoginFetched) {
              if (state.isLogin) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              }
            }
          },
          builder: (context, CheckLoginEvent state) {
            if (state is CheckLoginLoading) {
              return CircularProgressIndicator();
            } else {
              return RaisedButton(
                onPressed: () {
                  context.read<CheckLoginCubit>().signIn();
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.login),
                    const SizedBox(
                      width: 5,
                    ),
                    Text('Login'),
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
