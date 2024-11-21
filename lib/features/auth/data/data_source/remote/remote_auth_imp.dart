import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/apis/api_manager.dart';
import 'package:ecommerce_app/core/apis/end_points.dart';
import 'package:ecommerce_app/core/apis/status_code.dart';
import 'package:ecommerce_app/core/exceptions/exceptions.dart';
import 'package:ecommerce_app/features/auth/data/data_source/remote/remote_auth.dart';
import 'package:ecommerce_app/features/auth/data/models/user.dart';
import 'package:ecommerce_app/features/auth/domain/entity/signup_entity.dart';

import '../../../../../core/cache/cache_helper.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiManager apiManager;
  AuthRemoteDataSourceImpl(this.apiManager);

  @override
  Future<bool> Login(String email, String password) async {
    try {
      final response = await apiManager.postData(
          endPoints: EndPoints.login,
          body: {"email": email, "password": password});
      if (response.statusCode == 200) {
        print(response.data['token']);
        await CacheHelper.saveData<String>("token", response.data['token']);

        return true;
      }
      return false;
    } catch (e) {
      throw RouteRemoteExceptions(e.toString());
    }
  }

  @override
  Future<UserModel> SignUp(SignUpEntity signUpEntity) async {
    try {
      var response = await apiManager.postData(endPoints: EndPoints.signUp,body: {
        "email": signUpEntity.email,
        "phone": signUpEntity.phone,
        "name": signUpEntity.name,
        "rePassword": signUpEntity.rePassword,
        "password": signUpEntity.password
      });
      UserModel userModel=UserModel.fromJson(response.data);
      return userModel;
    } catch (e) {
      throw RouteRemoteExceptions(e.toString());
    }
  }
}
