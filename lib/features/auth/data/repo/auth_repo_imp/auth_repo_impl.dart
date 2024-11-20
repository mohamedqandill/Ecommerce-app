import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/auth/data/data_source/remote/remote_auth.dart';
import 'package:ecommerce_app/features/auth/domain/entity/signup_entity.dart';
import 'package:ecommerce_app/features/auth/domain/repo/auth_repo.dart';

import '../../../../../core/faliures/faliures.dart';
import '../../models/user.dart';

class AuthRepoImpl implements AuthRepo{
  AuthRemoteDataSource authRemoteDataSource;
  AuthRepoImpl(this.authRemoteDataSource);

  @override
  Future<Either<RouteFailures,bool>> login(String email, String password)async {
   try{
     bool loggedIn=await authRemoteDataSource.Login(email, password);
     if(!loggedIn){
       return Left(RouteInvalidCredintailFailures("Invalid username or password "));
     }
     return Right(loggedIn);

   }
   catch(e){
     return Left(RouteRemoteFailures(e.toString()));
   }
  }

  @override
  Future<Either<RouteFailures, UserModel>> SignUp(SignUpEntity signUpEntity)async {
    try{
      var userModel= await authRemoteDataSource.SignUp(signUpEntity);

      return Right(userModel);

    }
    catch(e){
      return Left(RouteRemoteFailures(e.toString()));
    }
  }






}