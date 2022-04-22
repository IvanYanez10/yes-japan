import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yes_japan/screens/kanji/test/test_screen.dart';

import '../lessons/lessons_screen.dart';

class KanjiHome extends StatefulWidget {
  const KanjiHome({Key? key}) : super(key: key);
  @override
  State<KanjiHome> createState() => _KanjiHomeState();
}

class _KanjiHomeState extends State<KanjiHome> {

  //TODO: move to individual component
  @override
  Widget build(BuildContext context) {
    double fontSizeByWidth=25;
    double paddingSpaceButtons=20;
    double paddingCircleIcon=50;

    var pixelAspectRatioScreen = MediaQuery.of(context).devicePixelRatio;
    var widthScreen = MediaQuery.of(context).size.width;
    var heightScreen = MediaQuery.of(context).size.height;

    var elementsWith = widthScreen * 0.75;
    var elementsHeight = heightScreen * 0.06;

    if(((widthScreen*pixelAspectRatioScreen)
        /(heightScreen*pixelAspectRatioScreen)) > 0.5 ){
      fontSizeByWidth=22.0;
      paddingSpaceButtons=10;
      paddingCircleIcon=20;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0.0,
        title: const Text(
          'Kanji',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.1),
                  BlendMode.dstATop
              ),
              image: const AssetImage('assets/images/silueta-japon.png')
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: paddingCircleIcon), //20
                child: const CircleAvatar(
                  radius: 80.0,
                  backgroundImage:
                  AssetImage('assets/images/monte-fuji.png'),
                  backgroundColor: Colors.transparent,
                ),
              ),
              ElevatedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (ctx)=> const Lessons('hiragana'))),
                child: Text(
                  'Estudio',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'MochiyPopOne',
                      fontSize: fontSizeByWidth)
                ),
                style: ElevatedButton.styleFrom(
                  elevation: 0.0,
                  fixedSize: Size(elementsWith, elementsHeight),
                  primary: const Color(0xFFFC707B),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                )
              ),
              Padding(
                    padding: EdgeInsets.only(top: paddingSpaceButtons),
                    child: ElevatedButton(
                        onPressed: () => Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (c, a1, a2) => const Test(),
                            transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                            transitionDuration: const Duration(milliseconds: 0),
                            reverseTransitionDuration: const Duration(milliseconds: 0),
                          ),
                        ),
                        child: Text(
                            'Test',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'MochiyPopOne',
                                fontSize: fontSizeByWidth)
                        ),
                        style: ElevatedButton.styleFrom(
                            elevation: 0.0,
                            fixedSize: Size(elementsWith, elementsHeight),
                            primary: const Color(0xFFFC707B),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            )
                        )
                    )
                ),
              const Align(
                alignment: FractionalOffset.bottomCenter,
              )
          ])
        )
      )
    );
  }
}
