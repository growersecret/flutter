import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../theme/custom_theme.dart';
import '../update_profile/cubit/user_details/user_details_cubit.dart';
import '../widgets/custom_button_widget.dart';

class WelcomeBackScreen extends StatefulWidget {
  const WelcomeBackScreen({super.key});

  @override
  State<WelcomeBackScreen> createState() => _WelcomeBackScreenState();
}

class _WelcomeBackScreenState extends State<WelcomeBackScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeInFadeOut;

  @override
  void initState() {
    super.initState();
    context.read<UserDetailsCubit>().userDetails();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _fadeInFadeOut = Tween<double>(begin: 0.0, end: 1).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeInToLinear));
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = ScreenUtil().screenWidth;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: FadeTransition(
            opacity: _fadeInFadeOut,
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  Container(
                      child: Image.asset(
                    'assets/bg2.png',
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  )),
                  Positioned(bottom: 0, child: Container(
                      width: screenWidth,
                      child: Image.asset('assets/bg.png', fit: BoxFit.fill,))),
                  TweenAnimationBuilder<Offset>(
                    duration: const Duration(milliseconds: 1200),
                    curve: Curves.linear,
                    tween: Tween<Offset>(
                        begin: Offset(43.w, 575.h), end: Offset(43.w, 515.h)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Welcome back to",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                        Text("Grower’s Secret Calculator",
                            style: TextStyle(
                                color: CustomTheme.primaryColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    builder: (context, offset, child) {
                      return Transform.translate(offset: offset, child: child);
                    },
                  ),
                  TweenAnimationBuilder<Offset>(
                    duration: const Duration(milliseconds: 1300),
                    curve: Curves.linear,
                    tween: Tween<Offset>(
                        begin: Offset(20.w, 575.h), end: Offset(20.w, 550.h)),
                    child: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: CustomButtonWidget(
                            isValid: true,
                            btnTitle: 'Continue',
                            onBtnPress: () {
                              context.goNamed('calculator', pathParameters: {
                                'profile_setup': context
                                    .read<UserDetailsCubit>()
                                    .state
                                    .userDetails
                                    .data
                                    .profileSetup
                                    .toString()
                              });
                            })),
                    builder: (context, offset, child) {
                      return Transform.translate(offset: offset, child: child);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
