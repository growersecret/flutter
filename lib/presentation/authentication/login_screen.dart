import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../theme/custom_theme.dart';
import '../widgets/custom_button_widget.dart';
import '../widgets/custom_textfield_widget.dart';
import '../widgets/error_diolog.dart';
import '../widgets/loading_dialog.dart';
import 'cubit/email_checker/email_checker_cubit.dart';
import 'cubit/isSignInValid/is_signin_valid_cubit.dart';
import 'cubit/is_focus/is_foces_cubit.dart';
import 'cubit/login/login_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();

    emailController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isFocused = context.watch<IsFocesCubit>().state.isFocus;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state.status == LoginStatus.error) {
            errorDialog(context, state.error.errMsg);
          }
          if (state.status == LoginStatus.loading) {
            return loadingDialog(context);
          }
          if (state.status == LoginStatus.loaded) {
            context.goNamed('otp', params: {'email': emailController.text});
          }
        },
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: MediaQuery.of(context).size.width,
                  minHeight: MediaQuery.of(context).size.height,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        color: CustomTheme.primaryColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Spacer(),

                            // SizedBox(height: 87.h),
                            Center(
                              child: Container(
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: CustomTheme.seconderyColor,
                                ),
                                margin: EdgeInsets.only(top: 30, bottom: 10),
                                child: Center(
                                    child: Icon(
                                  Icons.mail_outline,
                                  color: CustomTheme.primaryColor,
                                  size: 60,
                                )),
                              ),
                            ),
                            Spacer(),
                            // SizedBox(height: 70.h),
                            Container(
                              height: 460.h,
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.only(
                                left: 20,
                                right: 20,
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom,
                                //     MediaQuery.of(context).viewInsets.bottom,
                              ),
                              margin: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom *
                                        0.4,
                              ),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                        'assets/bg_round.png',
                                      ),
                                      fit: BoxFit.cover)),
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(top: 30.0, left: 10),
                                      child: Text(
                                        'Email Address',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize:
                                                CustomTheme.fontsize['sm']),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10.0),
                                      child: CustomTextFieldWidget(
                                        isfocused: isFocused,
                                        controller: emailController,
                                        hinttext: 'abc@gmail.com',
                                        ontap: () {
                                          context
                                              .read<IsFocesCubit>()
                                              .focusChanger();
                                        },
                                        onChanged: (value) {
                                          context
                                              .read<EmailCheckerCubit>()
                                              .checkEmail(value);
                                          context
                                              .read<IsSigninValidCubit>()
                                              .checkSignIn(context
                                                  .read<EmailCheckerCubit>()
                                                  .state
                                                  .isemailValid);
                                        },
                                        validator: (value) {
                                          return null;
                                        },
                                      ),
                                    ),
                                    context
                                            .watch<EmailCheckerCubit>()
                                            .state
                                            .isemailValid
                                        ? Container()
                                        : Padding(
                                            padding: const EdgeInsets.only(
                                                top: 7.0, left: 10),
                                            child: Text(
                                                'Please enter a valid email address !',
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.red,
                                                )),
                                          ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 15.0, left: 10),
                                      child: Text(
                                        'Please enter your email to receive an OTP (One Time Password)',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: CustomTheme.greyshade1
                                              .withOpacity(0.8),
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    Column(
                                      children: [
                                        context
                                                .watch<IsSigninValidCubit>()
                                                .state
                                                .isSignInValid
                                            ? Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 8.0),
                                                child: CustomButtonWidget(
                                                  isValid: context
                                                      .read<
                                                          IsSigninValidCubit>()
                                                      .state
                                                      .isSignInValid,
                                                  btnTitle: 'Continue',
                                                  onBtnPress: () {
                                                    if (_formKey.currentState!
                                                            .validate() ||
                                                        emailController
                                                            .text.isNotEmpty) {
                                                      try {
                                                        context
                                                            .read<LoginCubit>()
                                                            .loginUser(
                                                                emailController
                                                                    .text);
                                                      } catch (e) {
                                                        print(e);
                                                      }
                                                    }
                                                  },
                                                ),
                                              )
                                            : CustomButtonWidget(
                                                isValid: context
                                                    .watch<IsSigninValidCubit>()
                                                    .state
                                                    .isSignInValid,
                                                btnTitle: 'Continue',
                                                onBtnPress: () {},
                                              ),
                                        isFocused
                                            ? Container()
                                            : RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text:
                                                          'By Clicking Continue, you agree to our ',
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          color: Colors.black),
                                                    ),
                                                    TextSpan(
                                                        text:
                                                            ' Terms of Services',
                                                        style: CustomTheme
                                                            .primarytextStyle(
                                                                10,
                                                                FontWeight
                                                                    .bold)),
                                                    TextSpan(
                                                      text: ' and',
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          color: Colors.black),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                        isFocused
                                            ? Container()
                                            : Center(
                                                child: Padding(
                                                    padding: EdgeInsets.only(
                                                        bottom: 25.h),
                                                    child: Text(
                                                        'Privacy Policy.',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: CustomTheme
                                                            .primarytextStyle(
                                                                10,
                                                                FontWeight
                                                                    .bold))))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
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
