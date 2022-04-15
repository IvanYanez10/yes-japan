import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Lesson extends StatefulWidget {
  final int lesson;
  const Lesson({required this.lesson});
  @override
  State<Lesson> createState() => _LessonState();
}

class _LessonState extends State<Lesson> {
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
    var widthScreen = MediaQuery.of(context).size.width;
    var heightScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF9475B6),
        title: Text('Leccion ${widget.lesson}'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.bottomCenter,
            image: AssetImage("assets/images/sea.png"),
            fit: BoxFit.contain
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: heightScreen*.8,
              width: double.infinity,
              child: PageView.builder(
                controller: _controller,
                itemCount: 4,
                itemBuilder: (context, i){
                  return Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: heightScreen*.3,
                          width: double.infinity,
                          color: Colors.grey.withOpacity(0.2),
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
                          color: Colors.grey.withOpacity(0.2),
                          child: Text(
                              engKanji==''
                              ? 'Descripcion'
                              : engKanji
                          ),
                        ),
                      ],
                    ),
                  );
                }
              ),
            )
          ],
        ),
      ),
    );
  }
}
