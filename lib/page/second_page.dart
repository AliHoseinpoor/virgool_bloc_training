import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:virgool_bloc_learn/bloc/counter_cubit.dart';
import 'package:virgool_bloc_learn/bloc/login/check_login_cubit.dart';
import 'package:virgool_bloc_learn/bloc/login/check_login_event.dart';

import 'login_page.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<CheckLoginCubit, CheckLoginEvent>(
      listener: (context, CheckLoginEvent state) {
        if (state is CheckLoginFetched) {
          if (!state.isLogin) {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => LoginPage(),
              ),
              (route) => false,
            );
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('SecondPage'),
          leading: IconButton(
            onPressed: () => context.read<CheckLoginCubit>().signOut(),
            icon: Icon(
              Icons.logout,
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('با دکمه های پایین میتونی عدد رو کم و زیاد کنی'),
              const SizedBox(
                height: 20,
              ),
              Builder(
                builder: (context) {
                  final int state = context.watch<CounterCubit>().state;
                  return Text(
                    state.toString(),
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () => context.read<CounterCubit>().increment(),
              backgroundColor: Colors.green,
              heroTag: null,
              child: Center(
                child: Icon(
                  Icons.add,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            FloatingActionButton(
              onPressed: () => context.read<CounterCubit>().decrement(),
              backgroundColor: Colors.red,
              heroTag: null,
              child: Center(
                child: Icon(
                  Icons.remove,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
