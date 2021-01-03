import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:virgool_bloc_learn/bloc/counter_cubit.dart';
import 'package:virgool_bloc_learn/bloc/login/check_login_cubit.dart';
import 'package:virgool_bloc_learn/page/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckLoginCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LoginPage(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  final CounterCubit counterCubit = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Push The Button For Change the Number'),
            const SizedBox(height: 10),
            BlocBuilder<CounterCubit, int>(
              cubit: counterCubit,
              builder: (context, int state) {
                return Text(
                  state.toString(),
                  style: TextStyle(fontSize: 40),
                );
              },
            ),
            const SizedBox(height: 10),
            RaisedButton(onPressed: () => counterCubit.increment(), child: Text('Increment')),
            const SizedBox(height: 1),
            RaisedButton(onPressed: () => counterCubit.decrement(), child: Text('Decrement')),
          ],
        ),
      ),
    );
  }
}
