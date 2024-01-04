import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:grower/presentation/update_profile/user_profile_screen.dart';
import 'package:grower/responsive/orientation_util.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../heiper/navigator_function.dart';
import '../../../../theme/custom_theme.dart';
import '../../widgets/alert_dialog_widget.dart';

class CalculatorBottomModelSheet extends StatelessWidget {
  const CalculatorBottomModelSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
     //   height:  MediaQuery.of(context).size.height ,
       // height:  OrientationUtil.isLandscape(context) ? MediaQuery.of(context).size.height : null,
      //  height: 235.h ,
        //height:  234.h,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Container(
                  height: 7,
                  width: 103,
                  decoration: BoxDecoration(color: CustomTheme.bgColor),
                ),
              ),
              SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                child: Text("More Options",
                    style: TextStyle(
                        color: CustomTheme.primaryColor, fontSize: 16)),
              ),
              const SizedBox(height: 30),
              InkWell(
                onTap: () {
                  screenNavigator(context, UserProfileScreen());
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: const Text('View Profile',
                      style: TextStyle(color: Colors.black, fontSize: 14)),
                ),
              ),
              const SizedBox(height: 10),
              const Divider(color: Colors.grey),
              const SizedBox(height: 10),
              InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialogWidget(
                            content: 'You are going to Exit Calculator.',
                            leftBtnTitle: "Yes, Exit",
                            title: 'Are you sure?',
                            onTap: () {
                              SystemNavigator.pop();
                            }));
                  },
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: const Text('Exit calculator',
                          style:
                              TextStyle(color: Colors.black, fontSize: 14)))),
              const SizedBox(height: 10),
              const Divider(color: Colors.grey),
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialogWidget(
                            content: 'You are going to logout Calculator.',
                            leftBtnTitle: 'Yes, Logout',
                            title: 'Are you sure?',
                            onTap: () async {
                              final prefs =
                                  await SharedPreferences.getInstance();
                              prefs.remove('isLoggedIn');
                              context.go('/');
                            },
                          ));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: const Text('Log Out',
                      style: TextStyle(color: Colors.black, fontSize: 14)),
                ),
              ),
              const SizedBox(height: 10),
            ]),
      ),
    );
  }
}
