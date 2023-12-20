import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:grower/presentation/widgets/custom_button_widget.dart';
import '../../theme/custom_theme.dart';
import 'cubit/change_image/change_image_cubit.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeInFadeOut;
  Timer? _timer;
  List<String> imageUrls = [
    'assets/signup_screenbg.png',
    'assets/signup_bg1.png'
  ]; // Define a variable to keep track of the current image index
  int currentIndex = 0;

// Define a function to switch to the next image
  void switchToNextImage() {
    currentIndex = (currentIndex + 1) % imageUrls.length;

   if(mounted){
     setState(() {});
   }
  }

  @override
  void initState() {
    super.initState();
    context.read<ChangeImageCubit>().changeImage();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _fadeInFadeOut = Tween<double>(begin: 0.0, end: 1).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeInToLinear));
    _controller.forward();

     _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      switchToNextImage();
    });
  }
@override
  void dispose() {
    _controller.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0)),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: FadeTransition(
            opacity: _fadeInFadeOut,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  AnimatedSwitcher(
                    duration: Duration(milliseconds: 1500),
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                    child: FadeInImage(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      key: ValueKey<int>(currentIndex),
                      placeholder: AssetImage('assets/signup_screenbg.png'),
                      image: AssetImage(imageUrls[currentIndex]),
                      fit: BoxFit.cover,
                    ),
                  ),
                  TweenAnimationBuilder<Offset>(
                    duration: const Duration(milliseconds: 1600),
                    curve: Curves.linear,
                    tween: Tween<Offset>(
                        begin: Offset(43.w, -10), end: Offset(43.w, 45.h)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome to',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 20),
                        ),
                        Text(
                          "Grower’s Secret Calculator",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: CustomTheme.primaryColor,
                              fontSize: 20),
                        ),
                      ],
                    ),
                    builder: (context, offset, child) {
                      return Transform.translate(offset: offset, child: child);
                    },
                  ),
                  TweenAnimationBuilder<Offset>(
                    duration: const Duration(milliseconds: 1600),
                    curve: Curves.linear,
                    tween: Tween<Offset>(
                        begin: Offset(500, 160.h), end: Offset(210.h, 160.h)),
                    child: Container(
                      height: 180,
                      width: 180,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100)),
                      child: const CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 50,
                        backgroundImage: AssetImage('assets/truck.png'),
                      ),
                    ),
                    builder: (context, offset, child) {
                      return Transform.translate(offset: offset, child: child);
                    },
                  ),
                  TweenAnimationBuilder<Offset>(
                    duration: const Duration(milliseconds: 1600),
                    curve: Curves.linear,
                    tween: Tween<Offset>(
                        begin: Offset(-100, 300.h), end: Offset(-30, 300.h)),
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100)),
                      child: const CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 50,
                        backgroundImage: AssetImage('assets/harvest.png'),
                      ),
                    ),
                    builder: (context, offset, child) {
                      return Transform.translate(offset: offset, child: child);
                    },
                  ),
                  TweenAnimationBuilder<Offset>(
                    duration: const Duration(milliseconds: 1600),
                    curve: Curves.linear,
                    tween: Tween<Offset>(
                        begin: Offset(43.w, 575.h), end: Offset(43.w, 515.h)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Let's",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Get Started!",
                          style: TextStyle(
                              color: CustomTheme.primaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    builder: (context, offset, child) {
                      return Transform.translate(offset: offset, child: child);
                    },
                  ),
                  TweenAnimationBuilder<Offset>(
                    duration: const Duration(milliseconds: 1600),
                    curve: Curves.linear,
                    tween: Tween<Offset>(
                        begin: Offset(20.w, 575.h), end: Offset(20.w, 550.h)),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: CustomButtonWidget(
                          isValid: true,
                          btnTitle: 'Sign Up',
                          onBtnPress: () {
                            context.go('/login');
                          }),
                    ),
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
