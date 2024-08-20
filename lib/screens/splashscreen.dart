import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:easybuyadmin/screens/loginpage.dart';


import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Splashpage extends StatelessWidget {
  const Splashpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedSplashScreen(
          splashIconSize: 1000,
          duration: 3000,
          splash: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.3),
                  child: Image.asset(
                    'assets/images/2.png',
                    height: 250,
                    width: 250,
                    fit: BoxFit.fill,
                  ),
                ),
                const Text(
                  "EsayBuy-Admin",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          pageTransitionType: PageTransitionType.fade,
          nextScreen: const Loginpage(),
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}