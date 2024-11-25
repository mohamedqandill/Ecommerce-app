import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/faliures/faliures.dart';
import 'package:ecommerce_app/features/auth/data/models/user.dart';
import 'package:ecommerce_app/features/auth/domain/entity/signup_entity.dart';
import 'package:ecommerce_app/features/auth/domain/repo/auth_repo.dart';


class SignupUseCase {
  AuthRepo authRepo;
  SignupUseCase(this.authRepo);

  Future<Either<RouteFailures,UserModel>> call(SignUpEntity signUpEntity)async {
    return await authRepo.SignUp(signUpEntity);


  }

}
