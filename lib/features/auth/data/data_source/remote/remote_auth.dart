import 'package:ecommerce_app/features/auth/data/models/user.dart';
import 'package:ecommerce_app/features/auth/domain/entity/signup_entity.dart';

abstract class AuthRemoteDataSource{

  Future<bool> Login(String email,String password);
  Future<bool> newPassword(String email,String password);
  Future<UserModel> SignUp(SignUpEntity signUpEntity);
  Future<bool> forgetPassword(String email);
  Future<bool> resetCode(String code);
}