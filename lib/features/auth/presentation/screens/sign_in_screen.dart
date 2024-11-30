import 'package:ecommerce_app/core/apis/api_manager.dart';
import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:ecommerce_app/core/widget/custom_elevated_button.dart';
import 'package:ecommerce_app/core/widget/main_text_field.dart';
import 'package:ecommerce_app/core/widget/validators.dart';
import 'package:ecommerce_app/features/auth/data/data_source/remote/remote_auth.dart';
import 'package:ecommerce_app/features/auth/data/data_source/remote/remote_auth_imp.dart';
import 'package:ecommerce_app/features/auth/data/repo/auth_repo_imp/auth_repo_impl.dart';
import 'package:ecommerce_app/features/auth/domain/repo/auth_repo.dart';
import 'package:ecommerce_app/features/auth/domain/use_case/forget_password_use_case.dart';
import 'package:ecommerce_app/features/auth/domain/use_case/login_use_case.dart';
import 'package:ecommerce_app/features/auth/domain/use_case/new_pass_usecase.dart';
import 'package:ecommerce_app/features/auth/domain/use_case/reset_code_use_case.dart';
import 'package:ecommerce_app/features/auth/domain/use_case/signup_use_case.dart';
import 'package:ecommerce_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:toastification/toastification.dart';

import '../../../../core/resources/enums.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/styles_manager.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(
        LoginUSeCase(AuthRepoImpl(AuthRemoteDataSourceImpl(ApiManager()))),
        SignupUseCase(AuthRepoImpl(AuthRemoteDataSourceImpl(ApiManager()))),
        ForgetPasswordUSeCase(
          AuthRepoImpl(AuthRemoteDataSourceImpl(ApiManager())),
        ),
        ResetCodeUSeCase(
          AuthRepoImpl(AuthRemoteDataSourceImpl(ApiManager())),
        ),
        NewPassUSeCase(
          AuthRepoImpl(AuthRemoteDataSourceImpl(ApiManager())),
        ),
      ),
      child: BlocConsumer<AuthBloc, AuthLoginState>(
        listener: (context, state) {
          if (state.requestState == RequestState.success) {
            Navigator.pushNamedAndRemoveUntil(
                context, Routes.mainRoute, (r) => false);
            toastification.show(
              context: context,

              backgroundColor: Colors.white,
              // optional if you use ToastificationWrapper
              title: const Text(
                "Welcome Back",
                style: TextStyle(color: Colors.blue),
              ),
              autoCloseDuration: const Duration(seconds: 6),
            );
          }
          if (state.requestState == RequestState.error) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Error"),
                  content: Text(state.errorMessage ?? ""),
                );
              },
            );
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
                        height: 30.h,
                      ),
                      Center(
                        child: Image.asset(
                          "assets/images/Rectangle 13.png",
                          color: Color(0xff8E6CEF),
                        ),
                        //  Text(
                        //   "Welcome Back!",
                        //   style: getBoldStyle(color: Colors.black)
                        //       .copyWith(fontSize: FontSize.s32),
                        // ),
                      ),

                      // Center(child: SvgPicture.asset(SvgAssets.routeLogo)),
                      SizedBox(
                        height: AppSize.s65.h,
                      ),

                      Text(
                        'Sign in',
                        style: getBoldStyle(color: ColorManager.black)
                            .copyWith(fontSize: FontSize.s32.sp),
                      ),
                      SizedBox(
                        height: AppSize.s50.h,
                      ),
                      BuildTextField(
                        controller: bloc.emailCotroller,
                        backgroundColor: Color(0xffF4F4F4),
                        hint: 'Email Address',
                        textInputType: TextInputType.emailAddress,
                        validation: AppValidators.validateEmail(
                            bloc.emailCotroller.text),
                      ),
                      SizedBox(
                        height: AppSize.s28.h,
                      ),
                      BuildTextField(
                        controller: bloc.passwordCotroller,
                        hint: 'Password',
                        backgroundColor: Color(0xffF4F4F4),
                        validation: AppValidators.validatePassword(
                            bloc.passwordUpCotroller.text),
                        isObscured: true,
                        textInputType: TextInputType.text,
                      ),
                      SizedBox(
                        height: AppSize.s8.h,
                      ),
                      Row(
                        children: [
                          const Spacer(),
                          GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, Routes.forgetRoute);
                              },
                              child: Text(
                                'Forget password?',
                                style: getBoldStyle(color: ColorManager.black)
                                    .copyWith(fontSize: FontSize.s18.sp),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: AppSize.s60.h,
                      ),
                      Center(
                        child: SizedBox(
                          // width: MediaQuery.of(context).size.width * .8,
                          child: CustomElevatedButton(
                              // borderRadius: AppSize.s8,
                              isStadiumBorder: false,
                              label: 'Login',
                              backgroundColor: Color(0xff8E6CEF),
                              textStyle: getBoldStyle(
                                  color: Colors.white, fontSize: AppSize.s20),
                              onTap: () {
                                if (state.requestState == RequestState.error) {
                                  toastification.show(
                                    context: context,

                                    backgroundColor: Colors.red,
                                    // optional if you use ToastificationWrapper
                                    title: const Text(
                                      "Invalid Email or Password",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    autoCloseDuration:
                                        const Duration(seconds: 4),
                                  );
                                } else {
                                  bloc.add(LoginEvent(bloc.emailCotroller.text,
                                      bloc.passwordCotroller.text));
                                }
                              }),
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don’t have an account?',
                            style: getMediumStyle(color: ColorManager.black)
                                .copyWith(fontSize: FontSize.s16.sp),
                          ),
                          SizedBox(
                            width: AppSize.s8.w,
                          ),
                          GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, Routes.signUpRoute),
                            child: Text(
                              'Create Account',
                              style: getBoldStyle(color: ColorManager.black)
                                  .copyWith(fontSize: FontSize.s18.sp),
                            ),
                          ),
                        ],
                      )
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
