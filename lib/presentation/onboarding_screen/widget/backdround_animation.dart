import 'package:flutter/material.dart';

class BackGroundAnimationWidget extends StatefulWidget {
  const BackGroundAnimationWidget({super.key, required this.image});
  final Widget image;
  @override
  State<BackGroundAnimationWidget> createState() =>
      _BackGroundAnimationWidgetState();
}

class _BackGroundAnimationWidgetState extends State<BackGroundAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeInFadeOut;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _fadeInFadeOut = Tween<double>(begin: 0.0, end: 1).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeInToLinear));
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(opacity: _fadeInFadeOut, child: widget.image);
  }
}
