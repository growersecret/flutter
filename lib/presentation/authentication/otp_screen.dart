import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

import '../../data/repository/resend_otp_repositoty.dart';
import '../../theme/custom_theme.dart';
import '../update_profile/cubit/user_details/user_details_cubit.dart';
import '../widgets/custom_button_widget.dart';
import '../widgets/error_diolog.dart';
import '../widgets/success_popup_widget.dart';
import 'cubit/email_checker/email_checker_cubit.dart';
import 'cubit/isSignInValid/is_signin_valid_cubit.dart';
import 'cubit/is_focus/is_foces_cubit.dart';
import 'cubit/verify_otp/verify_otp_cubit.dart';
import 'widget/show_toast_message.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key, required this.email});
  final String email;
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final pinController = TextEditingController();
  bool isFocused = false;
  bool isValid = false;

  final formKey = GlobalKey<FormState>();
  TextEditingController _otpController = TextEditingController();
  int _timerDuration = 30;
  int expairTime = 180;
  final viewInsets = EdgeInsets.fromViewPadding(
      WidgetsBinding.instance.window.viewInsets,
      WidgetsBinding.instance.window.devicePixelRatio);
  void startExpairTimer() {
    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (expairTime == 1) {
        setState(() {
          timer.cancel();
        });
      }
      setState(() {
        expairTime--;
      });
    });
  }

  void startTimer() {
    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (_timerDuration == 1) {
        setState(() {
          timer.cancel();
        });
      }
      setState(() {
        _timerDuration--;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
    startExpairTimer();
  }

  @override
  void dispose() {
    pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0)),
      child: BlocConsumer<VerifyOtpCubit, VerifyOtpState>(
        listener: (context, state) {
          if (state.status == VerifyStatus.loading) {
            // return loadingDialog(context);
          }
          if (state.status == VerifyStatus.error) {
            errorDialog(context, state.error.errMsg);
          }
          if (state.status == VerifyStatus.loaded &&
              context.read<VerifyOtpCubit>().state.verifyotp.status == 200) {
            showDialog(
                context: context,
                builder: (context) {
                  return SuccessPopUpWidget(
                    title: 'OTP Verification successful !',
                  );
                });
            Timer(Duration(seconds: 2), () {
              context.goNamed('calculator', pathParameters: {
                'profile_setup': context
                    .read<UserDetailsCubit>()
                    .state
                    .userDetails
                    .data
                    .profileSetup
                    .toString()
              });
            });
          }
        },
        builder: (context, state) {
          String twoDigits(int n) => n.toString().padLeft(2, '0');
          final seconds = twoDigits(_timerDuration);
          print(expairTime);
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.white,
            body: Container(
              //  height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: CustomTheme.primaryColor,
              child: SingleChildScrollView(

                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: () {
                        context.read<EmailCheckerCubit>().getemailInitialState();
                        context.read<IsSigninValidCubit>().emitInitialState();
                        context.read<IsFocesCubit>().emitinitialState();
                        context.go('/login');
                      },
                      child: Container(
                        height: 38,
                        width: 38,
                        margin: EdgeInsets.only(top: 50.0, left: 20),
                        decoration: BoxDecoration(
                          color: CustomTheme.seconderyColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    // Spacer(),
                    Center(
                      child: Container(
                        height: 90,
                        width: 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: CustomTheme.seconderyColor,
                        ),
                        child: Center(
                          child: Image.asset('assets/otp_logo.png'),
                        ),
                      ),
                    ),
                    //      Spacer(),
                    Container(
                      //  height: MediaQuery.of(context).size.height * 0.73,  // remove render flex overflowed
                      width: MediaQuery.of(context).size.width,
                      /* margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom * 0.4,
                ),*/
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                        ),
                        /* image: DecorationImage(
                    image: AssetImage('assets/bg_round.png'),
                    fit: BoxFit.cover,
                  ),*/
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                                    'We have successfully sent an OTP (One-Time-\nPassword) to ',
                                    style:
                                    TextStyle(color: Colors.black, fontSize: 14),
                                  ),
                                  TextSpan(
                                    text: widget.email,
                                    style: TextStyle(
                                        color: CustomTheme.primaryColor,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Pinput(
                            onTapOutside: (event) {
                              FocusManager.instance.primaryFocus?.unfocus();
                            },
                            controller: _otpController,
                            length: 4,
                            defaultPinTheme: CustomTheme.pintheme,
                            focusedPinTheme: CustomTheme.pintheme,
                            submittedPinTheme: CustomTheme.pintheme,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                            ],
                            validator: (s) {
                              if (s!.isEmpty) {
                                return "invalid Otp!";
                              }
                            },
                            onTap: () {
                              setState(() {
                                isFocused = true;
                              });
                            },
                            pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                            showCursor: true,
                            onCompleted: (pin) {
                              setState(() {
                                isValid = true;
                                isFocused = false;
                              });
                            },
                          ),
                          SizedBox(height: 10,),
                          expairTime == 0
                              ? Text('Expired Otp !',
                              style: TextStyle(
                                  color: CustomTheme.redErrorColor))
                              : context
                              .read<VerifyOtpCubit>()
                              .state
                              .verifyotp
                              .status ==
                              403
                              ? Padding(
                            padding: EdgeInsets.symmetric(vertical: 6.0),
                            child: Text(
                              'Invalid Otp !',
                              style: TextStyle(
                                  color: CustomTheme.redErrorColor),
                            ),
                          )
                              : Container(),
                          Center(
                            child: Text(
                              '00:$_timerDuration sec',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          Center(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Did’t receive OTP yet?",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                                TextButton(
                                  onPressed: () async {
                                    if (_timerDuration == 0) {
                                      setState(() {
                                        _timerDuration = 30;
                                        expairTime = 180;
                                      });
                                      startTimer();
                                      startExpairTimer();
                                      await resendOtp(widget.email);
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          Future.delayed(Duration(seconds: 1), () {
                                            Navigator.of(context).pop(true);
                                          });
                                          return ShowToastMessage();
                                        },
                                      );
                                    }
                                  },
                                  child: Text(
                                    'Resend',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: _timerDuration == 0
                                            ? CustomTheme.primaryColor
                                            : CustomTheme.seconderyColor),
                                  ),
                                )
                              ],
                            ),
                          ),
                          //  Spacer(),
                          CustomButtonWidget(
                            isValid: isValid,
                            btnTitle: 'Continue',
                            onBtnPress: () {
                              if (isFocused || isValid) {
                                context
                                    .read<VerifyOtpCubit>()
                                    .otpVerify(widget.email, _otpController.text);
                                if (context.read<VerifyOtpCubit>().state.status ==
                                    VerifyStatus.loaded &&
                                    context
                                        .read<VerifyOtpCubit>()
                                        .state
                                        .verifyotp
                                        .status ==
                                        200) {
                                  Timer(Duration(seconds: 2), () {
                                    Navigator.pop(context);
                                  });
                                }
                              }
                            },
                          ),
                          // SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}