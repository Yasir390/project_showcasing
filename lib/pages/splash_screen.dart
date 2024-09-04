import 'dart:async';
import 'dart:math';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../const/const.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _animationController =
  AnimationController(vsync: this, duration: const Duration(seconds: 5))
    ..repeat();
  gotoNextScreen(){
    Timer(const Duration(seconds: 7), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  const HomePage(),));
    });
  }

  @override
  void initState() {
    gotoNextScreen();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _animationController.value*2*pi,
                  child: const SizedBox(
                    height: 250,
                    width: 250,
                    child: Image(image: AssetImage('assets/images/welcome.png')),
                  ),
                );
              },
            ),
            const SizedBox(height: 100,),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedTextKit(
                    repeatForever: true,
                    isRepeatingAnimation: true,
                    animatedTexts: [
                      ColorizeAnimatedText(
                        'My Json Task',
                        textStyle: colorizeTextStyle,
                        colors: colorizeColors,
                      ),
                    ],

                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
