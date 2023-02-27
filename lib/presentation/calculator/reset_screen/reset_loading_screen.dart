import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../theme/custom_theme.dart';
import '../../update_profile/cubit/user_details/user_details_cubit.dart';
import '../../widgets/restart_widget.dart';
import '../../widgets/custom_appbar_widget.dart';
import '../calculation_screen/cubit/dry_fertilizer/dry_fertilizer_cubit.dart';

class ResetLoadingScreen extends StatefulWidget {
  const ResetLoadingScreen({super.key});

  @override
  State<ResetLoadingScreen> createState() => _ResetLoadingScreenState();
}

class _ResetLoadingScreenState extends State<ResetLoadingScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 1), () {
      RestartWidget.restartApp(context);
      context.goNamed('calculator', params: {
        'profile_setup': context
            .read<UserDetailsCubit>()
            .state
            .userDetails
            .data
            .profileSetup
            .toString()
      });
      context.read<DryFertilizerCubit>().getDryFertilizer();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppbarWidget(
          appbarTitle: 'Calculator',
          isresult: false,
          ontapbackarrow: () {},
        ),
        body: Container(
            height: MediaQuery.of(context).size.height * .9,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage("assets/bgImage.png")),
                color: CustomTheme.bgColor),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                  child: CircularProgressIndicator(
                    color: CustomTheme.primaryColor,
                  ),
                )
              ],
            )),
      ),
    );
  }
}
