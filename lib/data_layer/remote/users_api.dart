import 'package:generic_network_layer/data_layer/remote/users_networking.dart';

import '../../dto/base_response.dart';
import '../../dto/login_response.dart';
import 'base_api.dart';

class UsersAPI extends BaseApi {
  static final shared = UsersAPI();

  Future<BaseResponse<LoginResponse>> login(
      {required String userName,required String password}) async {
    return await fetchData<LoginResponse>(Login(userName: userName, password: password), () => LoginResponse.empty());
  }
}

