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

import '../../../../core/apis/api_manager.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/widget/main_text_field.dart';
import '../../../../core/widget/validators.dart';
import '../../data/data_source/remote/remote_auth_imp.dart';
import '../../data/repo/auth_repo_imp/auth_repo_impl.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(LoginUSeCase(AuthRepoImpl(AuthRemoteDataSourceImpl(ApiManager()))),
          SignupUseCase(AuthRepoImpl(AuthRemoteDataSourceImpl(ApiManager())))),
      child: BlocConsumer<AuthBloc, AuthLoginState>(
  listener: (context, state) {
    if(state.requestState == RequestState.success){
      Navigator.pushNamed(context,Routes.signInRoute );
    }
    if(state.requestState == RequestState.error){
     print(state.errorMessage??"");
    }
  },
  builder: (context, state) {
    var bloc=BlocProvider.of<AuthBloc>(context);
    return Scaffold(
        backgroundColor: ColorManager.primary,
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
                  Center(child: SvgPicture.asset(SvgAssets.routeLogo)),
                  SizedBox(
                    height: AppSize.s40.h,
                  ),
                  BuildTextField(
                    controller: bloc.nameCotroller,
                    backgroundColor: ColorManager.white,
                    hint: 'enter your full name',
                    label: 'Full Name',
                    textInputType: TextInputType.name,
                    validation: AppValidators.validateFullName,
                  ),
                  SizedBox(
                    height: AppSize.s18.h,
                  ),
                  BuildTextField(
                    controller: bloc.phoneCotroller,
                    hint: 'enter your mobile no.',
                    backgroundColor: ColorManager.white,
                    label: 'Mobile Number',
                    validation: AppValidators.validatePhoneNumber,
                    textInputType: TextInputType.phone,
                  ),
                  SizedBox(
                    height: AppSize.s18.h,
                  ),
                  BuildTextField(
                    controller: bloc.emailUpCotroller,
                    hint: 'enter your email address',
                    backgroundColor: ColorManager.white,
                    label: 'E-mail address',
                    validation: AppValidators.validateEmail,
                    textInputType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: AppSize.s18.h,
                  ),
                  BuildTextField(
                    controller: bloc.passwordUpCotroller,
                    hint: 'enter your password',
                    backgroundColor: ColorManager.white,
                    label: 'password',
                    validation: AppValidators.validatePassword,
                    isObscured: true,
                    textInputType: TextInputType.text,
                  ),
                  BuildTextField(
                    controller: bloc.rePasswordCotroller,
                    hint: 'enter your password',
                    backgroundColor: ColorManager.white,
                    label: 'password',
                    validation: AppValidators.validatePassword,
                    isObscured: true,
                    textInputType: TextInputType.text,
                  ),
                  SizedBox(
                    height: AppSize.s50.h,
                  ),
                  Center(
                    child: SizedBox(
                      height: AppSize.s60.h,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * .9,
                      child: CustomElevatedButton(
                        // borderRadius: AppSize.s8,
                        label: 'Sign Up',
                        backgroundColor: ColorManager.white,
                        textStyle: getBoldStyle(
                            color: ColorManager.primary, fontSize: AppSize.s20),
                        onTap: () {
                          SignUpEntity signUpEntity=SignUpEntity(
                            email: bloc.emailUpCotroller.text,
                            name: bloc.nameCotroller.text,
                            password: bloc.passwordUpCotroller.text,
                            phone: bloc.phoneCotroller.text,
                            rePassword: bloc.rePasswordCotroller.text
                          );
                          bloc.add(SignUpEvent(signUpEntity
                          ));
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
