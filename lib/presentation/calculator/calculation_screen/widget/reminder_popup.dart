import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grower/heiper/storing_calculation_data.dart';
import 'package:grower/presentation/widgets/custom_small_btn_widget.dart';
import '../../../../heiper/navigator_function.dart';
import '../../../../theme/custom_theme.dart';
import '../../../update_profile/cubit/user_details/user_details_cubit.dart';
import '../../../update_profile/user_profile_screen.dart';

class ReminderPopUp extends StatefulWidget {
  ReminderPopUp({super.key});

  @override
  State<ReminderPopUp> createState() => _ReminderPopUpState();
}

class _ReminderPopUpState extends State<ReminderPopUp> {
  String? barreirDismiss;
  getbarreirData() async {
    barreirDismiss = await getString('barreirDismiss');
  }

  @override
  Widget build(BuildContext context) {
    var hitremain = context
            .watch<UserDetailsCubit>()
            .state
            .userDetails
            .data
            .hitRemaining
            .contains('-') ||
        context
            .watch<UserDetailsCubit>()
            .state
            .userDetails
            .data
            .hitRemaining
            .contains('0');
    hitremain ? saveString('barrierDismiss', 'true') : null;
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
      child: AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            hitremain
                ? Image.asset('assets/sad_avatar1.png')
                : Image.asset('assets/avatar1.png'),
            const SizedBox(height: 30),
            hitremain
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: Text('You’ve used up your hits!',
                        style: TextStyle(fontSize: 24)))
                : context.watch<UserDetailsCubit>().state.status ==
                        UserProfileStatus.loaded
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                            '${context.watch<UserDetailsCubit>().state.userDetails.data.hitRemaining} Hits Left!',
                            style: TextStyle(fontSize: 24)))
                    : SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                            strokeWidth: 2, color: CustomTheme.primaryColor)),
            const SizedBox(height: 15),
            const Text('Update your profile for unlimited use.',
                style: TextStyle(fontSize: 14, color: Colors.grey)),
            const SizedBox(height: 15),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {
                        hitremain
                            ? SystemNavigator.pop()
                            : Navigator.pop(context);
                      },
                      child: SmallBtnWidget.whiteBtn(
                          hitremain ? "Exit" : 'Skip', Colors.white)),
                  SizedBox(width: 20.w),
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        screenNavigator(context, UserProfileScreen());
                      },
                      child: SmallBtnWidget.filledColorBtn('Update', true)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
