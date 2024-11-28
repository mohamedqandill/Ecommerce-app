import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/faliures/faliures.dart';
import 'package:ecommerce_app/features/auth/domain/repo/auth_repo.dart';



class NewPassUSeCase {
  AuthRepo authRepo;
  NewPassUSeCase(this.authRepo);

  Future<Either<RouteFailures,bool>> call(String email, String password)async {
    return await authRepo.newPassword(email, password);


  }

}
