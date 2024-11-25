import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/faliures/faliures.dart';
import 'package:ecommerce_app/features/auth/domain/repo/auth_repo.dart';



class LoginUSeCase {
  AuthRepo authRepo;
  LoginUSeCase(this.authRepo);

  Future<Either<RouteFailures,bool>> call(String email, String password)async {
    return await authRepo.login(email, password);
    

  }
      
}
