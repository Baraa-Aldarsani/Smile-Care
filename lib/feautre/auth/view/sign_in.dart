import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:smile_care/core/core.dart';
import 'package:smile_care/feautre/feautre.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});
  final _controller = Get.put(AuthController());
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
              padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 150.h),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Strings.of(context)?.signIn ?? "LOGIN",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(
                              color: Theme.of(context)
                                  .extension<EXTColors>()!
                                  .buttonText),
                    ),
                    SizedBox(height: 20.h),
                    CustomTextField(
                      title: Strings.of(context)?.email ?? "Email",
                      icon: Icons.email,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email cannot be empty';
                        }
                        if (_controller.isValidEmail(value)) {
                          return 'Please enter a valid email address';
                        }
                      },
                    ),
                    SizedBox(height: 20.h),
                    CustomTextField(
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
                        if (_controller.isValidPassword(value)) {
                          return 'Password must contain at least one letter and one number';
                        }
                      },
                    ),
                    SizedBox(height: 20.h),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(Strings.of(context)?.forgotPassword ??
                          "Forget your password?"),
                    ),
                    SizedBox(height: 50.h),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedBtn(
                        title: Strings.of(context)?.signIn ?? "LOGIN",
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.push(Routes.boarding.path);
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
                          Strings.of(context)?.account ??
                              "Don’t have an account? ",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        InkWell(
                          onTap: () {
                            context.push(Routes.signUp.path);
                          },
                          child: Text(
                            Strings.of(context)?.signUp ?? "Sign up",
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
