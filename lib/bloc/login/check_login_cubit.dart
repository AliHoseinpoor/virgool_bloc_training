import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:virgool_bloc_learn/bloc/login/check_login_event.dart';

class CheckLoginCubit extends Cubit<CheckLoginEvent> {
  //initial state -> not login
  CheckLoginCubit() : super(CheckLoginInitial());

  //simulate sign in method
  Future<void> signIn() async {
    emit(CheckLoginLoading());

    await Future.delayed(const Duration(seconds: 2));

    emit(CheckLoginFetched(isLogin: true));
  }

  //simulate sign out method
  void signOut() {
    emit(CheckLoginFetched(isLogin: false));
  }
}
