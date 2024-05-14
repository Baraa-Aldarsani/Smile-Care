import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smile_care/feautre/feautre.dart';

import '../../../core/core.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});
  final AuthController _controller = Get.put(AuthController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        bottom: false,
        // top: false,
        maintainBottomViewPadding: false,
        child: Stack(
          children: [
            CustomPaint(
              size: Size(Dimens.screenW,
                  (Dimens.screenW * 2.9733333333333334).toDouble()),
              painter: RPSCustomPainterTop(),
            ),
            CustomPaint(
              size: Size(Dimens.screenW,
                  (Dimens.screenW * 2.1653333333333333).toDouble()),
              painter: RPSCustomPainterDown(),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                Images.logoAuth,
                scale: 6.h,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 120.h),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Strings.of(context)?.signUp ?? "Register",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(
                              color: Theme.of(context)
                                  .extension<EXTColors>()!
                                  .buttonText),
                    ),
                    SizedBox(height: 50.h),
                    CustomTextField(
                      controller: _controller.emailController,
                      title: Strings.of(context)?.email ?? "Email",
                      icon: Icons.email,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email cannot be empty';
                        }
                      },
                    ),
                    SizedBox(height: 20.h),
                    CustomTextField(
                      controller: _controller.passwordController,
                      title: Strings.of(context)?.password ?? "Password",
                      icon: Icons.lock,
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password cannot be empty';
                        }
                        if (value.length < 8) {
                          return 'Password must be at least 8 characters long';
                        }
                      },
                    ),
                    SizedBox(height: 20.h),
                    CustomTextField(
                      controller: _controller.confirmPasswordController,
                      title: Strings.of(context)?.confirmPassword ??
                          "Confirm Password",
                      icon: Icons.lock,
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password cannot be empty';
                        }
                        if (value.length < 8) {
                          return 'Password must be at least 8 characters long';
                        }
                      },
                    ),
                    SizedBox(height: 50.h),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedBtn(
                        title: Strings.of(context)?.signUp ?? "Register",
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            EasyLoading.show(
                                status: 'loading...',
                                maskType: EasyLoadingMaskType.black);
                            _controller.createAccount();
                          }
                        },
                        width: 150.w,
                        height: 45.h,
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          Strings.of(context)?.account ?? "have an account? ",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        InkWell(
                          onTap: () {
                            _controller.clearData();
                            Get.to(SignIn());
                          },
                          child: Text(
                            Strings.of(context)?.signUp ?? "Sign In",
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Theme.of(context)
                                          .extension<EXTColors>()!
                                          .buttonText,
                                    ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
