import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState(){
    super.initState();
    _navigateToHome();
  }
  _navigateToHome()async{
    await Future.delayed(const Duration(milliseconds: 1500));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx)=> const Home()));
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image(
            image: AssetImage(
                'assets/images/logo-splash.png'
            )
        )
      ),
    );
  }
}