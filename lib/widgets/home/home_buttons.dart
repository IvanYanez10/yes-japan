import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yes_japan/screens/kanji/kanji_screen.dart';
import 'package:yes_japan/screens/lessons/lessons_screen.dart';
import 'package:yes_japan/services/screen_size.dart';

class HomeButtons extends StatefulWidget {
  const HomeButtons({Key? key}) : super(key: key);

  @override
  State<HomeButtons> createState() => _HomeButtonsState();
}

class _HomeButtonsState extends State<HomeButtons> {
  @override
  Widget build(BuildContext context) {
    //TODO: get and set width and height screen
    double fontSizeByWidth=25;
    double paddingSpaceButtons=20;
    double paddingCircleIcon=50;

    var pixelAspectRatioScreen = ScreenSize.pixelRatio(context);
    var widthScreen = ScreenSize.width(context);
    var heightScreen = ScreenSize.height(context);

    var elementsWith = widthScreen * 0.75;
    var elementsHeight = heightScreen * 0.06;

    if(((widthScreen*pixelAspectRatioScreen)
        /(heightScreen*pixelAspectRatioScreen)) > 0.5 ){
      fontSizeByWidth=22.0;
      paddingSpaceButtons=10;
      paddingCircleIcon=20;
    }
    return Column(
      children: [

        ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (c, a1, a2) => const Lessons('hiragana'),
                transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                transitionDuration: const Duration(milliseconds: 100),
                reverseTransitionDuration: const Duration(milliseconds: 100),
              ),
            ),
            child: Text(
                'Hiragana',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'MochiyPopOne',
                    fontSize: fontSizeByWidth)
            ),
            style: ElevatedButton.styleFrom(
              elevation: 0.0,
              fixedSize: Size(elementsWith, elementsHeight),
              primary: Theme.of(context).secondaryHeaderColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
              ),
            )
        ),
        Padding(
            padding: EdgeInsets.symmetric(vertical: paddingSpaceButtons),
            child: ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (c, a1, a2) => const Lessons('katakana'),
                    transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                    transitionDuration: const Duration(milliseconds: 100),
                    reverseTransitionDuration: const Duration(milliseconds: 100),
                  ),
                ),
                child: Text(
                    'Katakana',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'MochiyPopOne',
                        fontSize: fontSizeByWidth)
                ),
                style: ElevatedButton.styleFrom(
                    elevation: 0.0,
                    fixedSize: Size(elementsWith, elementsHeight),
                    primary: Theme.of(context).secondaryHeaderColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    )
                )
            )
        ),
        ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (c, a1, a2) => const KanjiHome(),
                transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                transitionDuration: const Duration(milliseconds: 100),
                reverseTransitionDuration: const Duration(milliseconds: 100),
              ),
            ),
            child: Text(
                'Kanji',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'MochiyPopOne',
                    fontSize: fontSizeByWidth)
            ),
            style: ElevatedButton.styleFrom(
                elevation: 0.0,
                fixedSize: Size(elementsWith, elementsHeight),
                primary: Theme.of(context).secondaryHeaderColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                )
            )
        ),
      ],
    );
  }
}
