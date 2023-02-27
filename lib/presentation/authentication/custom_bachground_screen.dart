import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../theme/custom_theme.dart';
import 'cubit/email_checker/email_checker_cubit.dart';
import 'cubit/isSignInValid/is_signin_valid_cubit.dart';
import 'cubit/is_focus/is_foces_cubit.dart';

class CustomBackgroundWidget extends StatelessWidget {
  const CustomBackgroundWidget(
      {super.key, required this.widget, required this.isLogin});
  final Widget widget;
  final bool isLogin;
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: CustomTheme.primaryColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                isLogin
                    ? Container()
                    : InkWell(
                        onTap: () {
                          context
                              .read<EmailCheckerCubit>()
                              .getemailInitialState();
                          context.read<IsSigninValidCubit>().emitInitialState();
                          context.read<IsFocesCubit>().emitinitialState();
                          context.go('/login');
                        },
                        child: Container(
                          height: 38,
                          width: 38,
                          margin: EdgeInsets.only(top: 20, left: 20),
                          decoration: BoxDecoration(
                              color: CustomTheme.seconderyColor,
                              borderRadius: BorderRadius.circular(50)),
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                      ),
                isLogin ? SizedBox(height: 87.h) : SizedBox(height: 39.h),
                Center(
                  child: Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: CustomTheme.seconderyColor,
                    ),
                    child: Center(
                      child: isLogin
                          ? Icon(
                              Icons.mail_outline,
                              color: CustomTheme.primaryColor,
                              size: 60,
                            )
                          : Image.asset('assets/otp_logo.png'),
                    ),
                  ),
                ),
                SizedBox(height: 70.h),
                Container(
                  height: 437.h,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/bg_round.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: widget,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
