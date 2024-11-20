
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/auth/data/data_source/remote/remote_auth.dart';
import 'package:ecommerce_app/features/auth/data/models/user.dart';
import 'package:ecommerce_app/features/auth/domain/entity/signup_entity.dart';

import '../../../../core/faliures/faliures.dart';

abstract class AuthRepo{


  Future<Either<RouteFailures,bool>> login(String email,String password);
  Future<Either<RouteFailures,UserModel>> SignUp(SignUpEntity signUpEntity);
}