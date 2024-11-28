import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/faliures/faliures.dart';
import 'package:ecommerce_app/features/auth/domain/repo/auth_repo.dart';



class ResetCodeUSeCase {
  AuthRepo authRepo;
  ResetCodeUSeCase(this.authRepo);

  Future<Either<RouteFailures,bool>> call(String code)async {
    return await authRepo.resetCode(code);


  }

}
