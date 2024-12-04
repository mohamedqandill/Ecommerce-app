import 'dart:io';

import 'package:ecommerce_app/core/cache/cache_helper.dart';
import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/font_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/features/main_layout/profile_tab/presentation/image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/routes_manager/routes.dart';
import '../../../../core/widget/main_text_field.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  ProfileTabState createState() => ProfileTabState();
}

File? pickedImage;

class ProfileTabState extends State<ProfileTab> {
  bool isFullNameReadOnly = true;
  bool isEmailReadOnly = true;
  bool isPasswordReadOnly = true;
  bool isMobileNumberReadOnly = true;
  bool isAddressReadOnly = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p20),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppSize.s20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Welcome, ${CacheHelper.getData<String>("name")}',
                    style: getSemiBoldStyle(
                        color: ColorManager.purbble, fontSize: FontSize.s18),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,


                      ),
                      onPressed: () {
                    Navigator.pushNamed(context, Routes.signInRoute);
                    CacheHelper.removeData("token");
                  }, child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Log out",
                        style: getMediumStyle(color: Colors.black)
                            .copyWith(fontSize: FontSize.s22),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      const Icon(
                        Icons.login,
                        size: 30,
                        color: Colors.black,
                      ),
                    ],
                  )),
                ],
              ),
              Text(
                '${CacheHelper.getData<String>("email")}',
                style: getRegularStyle(
                    color: ColorManager.primary.withOpacity(.5),
                    fontSize: FontSize.s14),
              ),
              SizedBox(height: AppSize.s18.h),
              Center(
                child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                            content: SizedBox(
                          width: 250,
                          height: 90,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () async {
                                  File? temp =
                                      await ImageFunction.cameraPicker();
                                  if (temp != null) {
                                    pickedImage = temp;
                                    ImageFunction.saveImagePath(temp.path);

                                    setState(() {});
                                  }
                                },
                                child: const Column(
                                  children: [
                                    Icon(
                                      Icons.camera,
                                      size: 45,
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      "Camera",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 22),
                                    )
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  File? temp =
                                      await ImageFunction.galleryPicker();
                                  if (temp != null) {
                                    pickedImage = temp;
                                    ImageFunction.saveImagePath(temp.path);

                                    setState(() {});
                                  }
                                },
                                child: const Column(
                                  children: [
                                    Icon(
                                      Icons.photo,
                                      size: 45,
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      "Gallery",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 22),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ));
                      },
                    );
                  },
                  child: CircleAvatar(
                    backgroundImage:
                        pickedImage == null ? null : FileImage(pickedImage!),
                    radius: 70,
                    backgroundColor: pickedImage != null
                        ? Colors.transparent
                        : Colors.grey.withOpacity(0.5),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        pickedImage == null
                            ? const Icon(
                                Icons.person,
                                color: Colors.black54,
                                size: 70,
                              )
                            : const SizedBox(),
                        pickedImage != null ? const Spacer() : const SizedBox(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            pickedImage == null
                                ? const Icon(
                                    color: Colors.black54,
                                    Icons.camera_alt,
                                    size: 25,
                                  )
                                : const SizedBox(),
                            InkWell(
                              onTap: () {
                                pickedImage = null;
                                setState(() {});
                              },
                              child: pickedImage == null
                                  ? const SizedBox()
                                  : const Icon(
                                      color: Colors.red,
                                      Icons.delete,
                                      size: 25,
                                    ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              BuildTextField(
                borderBackgroundColor: ColorManager.primary.withOpacity(.5),
                readOnly: isFullNameReadOnly,
                backgroundColor: ColorManager.white,
                hint: 'Enter your full name',
                label: 'Full Name',
                controller: TextEditingController(
                    text: CacheHelper.getData<String>("name")),
                labelTextStyle: getMediumStyle(
                    color: ColorManager.primary, fontSize: FontSize.s18),
                suffixIcon: IconButton(
                  icon: SvgPicture.asset(SvgAssets.edit),
                  onPressed: () {
                    setState(() {
                      isFullNameReadOnly = false;
                    });
                  },
                ),
                textInputType: TextInputType.text,
                hintTextStyle: getRegularStyle(color: ColorManager.primary)
                    .copyWith(fontSize: 18.sp),
              ),
              SizedBox(height: AppSize.s18.h),
              BuildTextField(
                borderBackgroundColor: ColorManager.primary.withOpacity(.5),
                readOnly: isEmailReadOnly,
                backgroundColor: ColorManager.white,
                hint: 'Enter your email address',
                label: 'E-mail address',
                controller: TextEditingController(
                    text: CacheHelper.getData<String>("email")),
                labelTextStyle: getMediumStyle(
                    color: ColorManager.primary, fontSize: FontSize.s18),
                suffixIcon: IconButton(
                  icon: SvgPicture.asset(SvgAssets.edit),
                  onPressed: () {
                    setState(() {
                      isEmailReadOnly = false;
                    });
                  },
                ),
                textInputType: TextInputType.emailAddress,
                hintTextStyle: getRegularStyle(color: ColorManager.primary)
                    .copyWith(fontSize: 18.sp),
              ),
              SizedBox(height: AppSize.s18.h),
              BuildTextField(
                onTap: () {
                  setState(() {
                    isPasswordReadOnly = false;
                  });
                },
                controller: TextEditingController(
                    text: CacheHelper.getData<String>("password")),
                borderBackgroundColor: ColorManager.primary.withOpacity(.5),
                readOnly: isPasswordReadOnly,
                backgroundColor: ColorManager.white,
                hint: 'Enter your password',
                label: 'Password',
                isObscured: true,
                labelTextStyle: getMediumStyle(
                    color: ColorManager.primary, fontSize: FontSize.s18),
                suffixIcon: SvgPicture.asset(SvgAssets.edit),
                textInputType: TextInputType.text,
                hintTextStyle: getRegularStyle(color: ColorManager.primary)
                    .copyWith(fontSize: 18.sp),
              ),
              SizedBox(height: AppSize.s18.h),
              BuildTextField(
                controller: TextEditingController(
                    text: CacheHelper.getData<String>("phone")),
                borderBackgroundColor: ColorManager.primary.withOpacity(.5),
                readOnly: isMobileNumberReadOnly,
                backgroundColor: ColorManager.white,
                hint: 'Enter your mobile no.',
                label: 'Your mobile number',
                labelTextStyle: getMediumStyle(
                    color: ColorManager.primary, fontSize: FontSize.s18),
                suffixIcon: IconButton(
                  icon: SvgPicture.asset(SvgAssets.edit),
                  onPressed: () {
                    setState(() {
                      isMobileNumberReadOnly = false;
                    });
                  },
                ),
                textInputType: TextInputType.phone,
                hintTextStyle: getRegularStyle(color: ColorManager.primary)
                    .copyWith(fontSize: 18.sp),
              ),
              SizedBox(height: AppSize.s18.h),
              // BuildTextField(
              //   controller:
              //   TextEditingController(text: '6th October, street 11.....'),
              //   borderBackgroundColor: ColorManager.primary.withOpacity(.5),
              //   readOnly: isAddressReadOnly,
              //   backgroundColor: ColorManager.white,
              //   hint: '6th October, street 11.....',
              //   label: 'Your Address',
              //   labelTextStyle: getMediumStyle(
              //       color: ColorManager.primary, fontSize: FontSize.s18),
              //   suffixIcon: IconButton(
              //     icon: SvgPicture.asset(SvgAssets.edit),
              //     onPressed: () {
              //       setState(() {
              //         isAddressReadOnly = false;
              //       });
              //     },
              //   ),
              //   textInputType: TextInputType.streetAddress,
              //
              //   hintTextStyle: getRegularStyle(color: ColorManager.primary)
              //       .copyWith(fontSize: 18.sp),
              // ),
              // SizedBox(height: AppSize.s50.h),
            ],
          ),
        ),
      ),
    );
  }
}
