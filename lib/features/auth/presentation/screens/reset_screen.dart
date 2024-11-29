import 'package:ecommerce_app/core/cache/cache_helper.dart';
import 'package:ecommerce_app/core/resources/enums.dart';
import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:ecommerce_app/core/widget/custom_elevated_button.dart';
import 'package:ecommerce_app/features/auth/domain/entity/signup_entity.dart';
import 'package:ecommerce_app/features/auth/domain/use_case/login_use_case.dart';
import 'package:ecommerce_app/features/auth/domain/use_case/signup_use_case.dart';
import 'package:ecommerce_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:toastification/toastification.dart';

import '../../../../core/apis/api_manager.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/widget/main_text_field.dart';
import '../../../../core/widget/validators.dart';
import '../../data/data_source/remote/remote_auth_imp.dart';
import '../../data/repo/auth_repo_imp/auth_repo_impl.dart';
import '../../domain/use_case/forget_password_use_case.dart';
import '../../domain/use_case/new_pass_usecase.dart';
import '../../domain/use_case/reset_code_use_case.dart';

class ResetScreen extends StatelessWidget {
  const ResetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(
          LoginUSeCase(AuthRepoImpl(AuthRemoteDataSourceImpl(ApiManager()))),
          SignupUseCase(AuthRepoImpl(AuthRemoteDataSourceImpl(ApiManager()))),
          ForgetPasswordUSeCase(
              AuthRepoImpl(AuthRemoteDataSourceImpl(ApiManager()))),
        ResetCodeUSeCase(
          AuthRepoImpl(AuthRemoteDataSourceImpl(ApiManager())),
        ),
        NewPassUSeCase(
          AuthRepoImpl(AuthRemoteDataSourceImpl(ApiManager())),
        ),
      ),
      child: BlocConsumer<AuthBloc, AuthLoginState>(
        listener: (context, state) {

          if (state.requestState == RequestState.error) {
            toastification.show(
              context: context,
              backgroundColor: Colors.red,
              // optional if you use ToastificationWrapper
              title: const Text(
                "Please Enter a Valid Code",
                style:  TextStyle(color: Colors.white),
              ),
              autoCloseDuration: const Duration(seconds: 4),
            );
          }
          if (state.requestState == RequestState.success) {

            Navigator.pushNamed(context, Routes.newRoute);
          }
        },
        builder: (context, state) {
          var bloc = BlocProvider.of<AuthBloc>(context);
          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.p20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: AppSize.s40.h,
                      ),
                      // Center(child: SvgPicture.asset(SvgAssets.routeLogo)),
                      SizedBox(
                        height: AppSize.s40.h,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const CircleAvatar(
                          backgroundColor: Color(0xffF4F4F4),
                          radius: 20,
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            size: 20,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.sp,
                      ),
                      Text(
                        "Reset Code",
                        style: getBoldStyle(color: Colors.black)
                            .copyWith(fontSize: FontSize.s32.sp),
                      ),
                      SizedBox(
                        height: 20.sp,
                      ),
                      BuildTextField(
                        controller: bloc.resetCodeCotroller,
                        backgroundColor: Color(0xffF4F4F4),
                        hint: 'Enter Code',
                        textInputType: TextInputType.name,
                        validation: AppValidators.validateFullName,
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      Center(
                        child: SizedBox(
                          height: AppSize.s60.h,
                          width: MediaQuery.of(context).size.width * .9,
                          child: CustomElevatedButton(
                            // borderRadius: AppSize.s8,
                            label: 'Confirm',
                            backgroundColor: Color(0xff8E6CEF),
                            textStyle: getBoldStyle(
                                color: Colors.white, fontSize: AppSize.s20),
                            onTap: () {
                              bloc.add(ResetCodeEvent(bloc.resetCodeCotroller.text));


                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
