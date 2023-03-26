import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../data_layer/remote/users_api.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);

  bool isPasswordVisible = true;
  void changePasswordVisible(){
    isPasswordVisible = !isPasswordVisible;
    emit(LoginInitial());
  }
  void fetchData(){
    UsersAPI.shared.login(userName:"userName",password:"password").then((value) => {

    }).catchError((error)=>{

    });

  }
}
