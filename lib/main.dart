import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:grower/heiper/islogged_in_checker.dart';
import 'package:grower/presentation/authentication/cubit/login/login_cubit.dart';
import 'package:grower/presentation/calculator/calculation_screen/cubit/reminder/reminder_cubit.dart';
import 'package:grower/presentation/widgets/restart_widget.dart';
import 'package:grower/presentation/update_profile/cubit/textfield_click/textfield_click_cubit.dart';
import 'package:grower/presentation/update_profile/cubit/user_details/user_details_cubit.dart';
import 'package:grower/presentation/update_profile/cubit/valid_number/valid_number_cubit.dart';
import 'heiper/router.dart';
import 'presentation/authentication/cubit/email_checker/email_checker_cubit.dart';
import 'presentation/authentication/cubit/isSignInValid/is_signin_valid_cubit.dart';
import 'presentation/authentication/cubit/is_focus/is_foces_cubit.dart';
import 'presentation/authentication/cubit/verify_otp/verify_otp_cubit.dart';
import 'presentation/calculator/calculation_screen/cubit/dropdownIndex/dropdown_index_cubit.dart';
import 'presentation/calculator/calculation_screen/cubit/dropdownIndex1/dropdown_index_cubit1.dart';
import 'presentation/calculator/calculation_screen/cubit/dropdownitem1Click/dropdownitem_click_cubit1.dart';
import 'presentation/calculator/calculation_screen/cubit/dropdownitemClick/dropdownitem_click_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'presentation/calculator/calculation_screen/cubit/dry_fertilizer/dry_fertilizer_cubit.dart';
import 'presentation/calculator/calculation_screen/cubit/liquid_fertilizer/liquid_fertilizer_cubit.dart';
import 'presentation/calculator/calculation_screen/cubit/other_nutrients/other_nutrients_cubit.dart';
import 'presentation/calculator/calculation_screen/cubit/reset_dropdown/reset_dropdown_cubit.dart';
import 'presentation/calculator/calculation_screen/cubit/text_field_clicked/text_field_clicked_cubit.dart';
import 'presentation/onboarding_screen/cubit/change_image/change_image_cubit.dart';
import 'presentation/update_profile/cubit/not_empty_string_validator/not_empty_str_validator_cubit.dart';
import 'presentation/update_profile/cubit/textfield_focus/textfield_focus_cubit.dart';
import 'presentation/update_profile/cubit/update_profile/update_profile_cubit.dart';
import 'theme/custom_theme.dart';

void main() async {
  runApp(RestartWidget(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: (context, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => ReminderCubit()),
              BlocProvider(create: (context) => DropdownIndexCubit()),
              BlocProvider(create: (context) => DropdownitemClickCubit()),
              BlocProvider(create: (context) => DropdownIndexCubit1()),
              BlocProvider(create: (context) => DropdownitemClickCubit1()),
              BlocProvider(create: (context) => LoginCubit()),
              BlocProvider(create: (context) => VerifyOtpCubit()),
              BlocProvider(create: (context) => UpdateProfileCubit()),
              BlocProvider(create: (context) => EmailCheckerCubit()),
              BlocProvider(create: (context) => IsSigninValidCubit()),
              BlocProvider(create: (context) => NotEtyStrValidatorCubit()),
              BlocProvider(create: (context) => ValidNumberCubit()),
              BlocProvider(create: (context) => TextfieldFocusCubit()),
              BlocProvider(create: (context) => UserDetailsCubit()),
              BlocProvider(create: (context) => LiquidFertilizerCubit()),
              BlocProvider(create: (context) => OtherNutrientsCubit()),
              BlocProvider(create: (context) => DryFertilizerCubit()),
              BlocProvider(create: (context) => IsFocesCubit()),
              BlocProvider(create: (context) => ChangeImageCubit()),
              BlocProvider(create: (context) => TextfieldClickCubit()),
              BlocProvider(create: (context) => ResetDropdownCubit()),
              BlocProvider(create: (context) => TextFieldClickedCubit())
            ],
            child: MaterialApp.router(
              debugShowCheckedModeBanner: false,
              routerConfig: router,
              title: 'Grower',
              theme: ThemeData(primaryColor: CustomTheme.primaryColor),
              // home: const SplashScreen(),
            ),
          );
        });
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                height: 180,
                width: 180,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/grower_logo.png"),
                ))),
            Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/loader.gif"))))
          ],
        ),
      ),
    );
  }

  void startTimer() {
    Timer(const Duration(seconds: 3), () async {
      if (await getBool('isLoggedIn')) {
        context.go('/welcomeback');
      } else {
        context.go('/welcome');
      }
      //It will redirect  after 3 seconds
    });
  }
}
