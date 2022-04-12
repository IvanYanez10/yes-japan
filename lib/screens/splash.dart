import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState(){
    super.initState();
    _navigatetohome();
  }

  _navigatetohome()async{
    await Future.delayed(const Duration(milliseconds: 2000), (){});
    // preferences save first init
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


/*
AspectRatio(
  aspectRatio: 16/9,
  child:
  Image(
    image: AssetImage('assets/argon-216-1.png'),
  )
)
 */