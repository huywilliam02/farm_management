import 'package:flutter/material.dart';

class SplashStart extends StatefulWidget {
  const SplashStart({Key? key}) : super(key: key);

  @override
  _SplashStartState createState() => _SplashStartState();
}

class _SplashStartState extends State<SplashStart>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        // backgroundColor: ColorConstant.common_bg_dark,
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: CircularProgressIndicator(
            // value: 0.5,
            strokeWidth: 5,
            color: Colors.greenAccent,
            backgroundColor: Colors.grey,
          ),
        ),
      ],
    ));
  }
}
