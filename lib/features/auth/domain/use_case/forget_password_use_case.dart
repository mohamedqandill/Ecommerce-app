import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/faliures/faliures.dart';
import 'package:ecommerce_app/features/auth/domain/repo/auth_repo.dart';



class ForgetPasswordUSeCase {
  AuthRepo authRepo;
  ForgetPasswordUSeCase(this.authRepo);

  Future<Either<RouteFailures,bool>> call(String email)async {
    return await authRepo.forgetPassword(email);


  }

}
