import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yes_japan/screens/lessons/lessons_type/choose_screen.dart';

class Study extends StatefulWidget {
  const Study({Key? key}) : super(key: key);
  @override
  State<Study> createState() => _StudyState();
}

class _StudyState extends State<Study> {
  final _controller = PageController(viewportFraction: 0.8);
  double cur = 0.0;

  late List dataKanji;
  String nameKanji = "";
  String engKanji = "";

  Future<String> loadJsonData() async {
    var jsonText = await rootBundle.loadString('assets/kanjis.json');
    dataKanji = json.decode(jsonText);
    setState(() {
      nameKanji=dataKanji[0]['kan'];
      engKanji=dataKanji[0]['eng'];
    });
    return 'success';
  }

  @override
  void initState() {
    _controller.addListener(() {
      cur = _controller.page!;
    });
    loadJsonData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    //var widthScreen = MediaQuery.of(context).size.width;
    var heightScreen = MediaQuery.of(context).size.height;
    return SizedBox(
      height: heightScreen*.8,
      width: double.infinity,
      child: PageView.builder(
          controller: _controller,
          itemCount: 5,
          itemBuilder: (context, i){
            return i<4
              ? Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: heightScreen*.3,
                      width: double.infinity,
                      color: Colors.grey,
                      child: Text(
                          nameKanji==''
                              ? 'Letra'
                              : nameKanji
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: heightScreen*.3,
                      width: double.infinity,
                      color: Colors.grey,
                      child: Text(
                          engKanji==''
                              ? 'Descripcion'
                              : engKanji
                      ),
                    ),
                  ],
                ),
              )
              : const ToChoose();
          }
      ),
    );
  }
}


class ToChoose extends StatefulWidget {
  const ToChoose({Key? key}) : super(key: key);
  @override
  State<ToChoose> createState() => _ToChooseState();
}

class _ToChooseState extends State<ToChoose> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () => Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (c, a1, a2) => const Choose(),
            transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
            transitionDuration: const Duration(milliseconds: 100),
            reverseTransitionDuration: const Duration(milliseconds: 100),
          ),
        ),
        child: const Text('Prueba lo aprendido'),
      ),
    );
  }
}
