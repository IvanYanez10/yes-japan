import 'dart:convert';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yes_japan/screens/extra/search.dart';

import 'lessons.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  //TODO: move to another file
  late List sabias_que_frases;
  String sabias_que = '';

  Future<String> loadJsonData() async {
    var jsonText = await rootBundle.loadString('assets/sabias_que.json');
    sabias_que_frases = json.decode(jsonText);
    var rnd = Random().nextInt(sabias_que_frases.length);
    setState(() {
      sabias_que = sabias_que_frases[rnd]['datos'];
    });
    return 'success';
  }

  @override
  void initState(){
    super.initState();
    loadJsonData();
  }

  //TODO: move to individual component
  @override
  Widget build(BuildContext context) {
    var widthScreen = MediaQuery.of(context).size.width * 0.8;
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {},
                child: const Text('Tamaño de letra'),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {},
                child: const Text('Idioma'),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {},
                child: const Text('Examen'),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {},
                child: const Text('Flash cards'),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {},
                child: const Text('Ayuda'),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0.0,
        leading: Builder(
          builder: (context){
            return IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: const Icon(
                Icons.menu,
                size: 40,
              )
            );
          }
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (ctx)=> const Search())),
              icon: const Icon(
                Icons.search,
                size: 40,
              )
            )
          )
        ],
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
              image: const NetworkImage(
                'https://previews.123rf.com/images/viktorijareut/viktorijareut1709/viktorijareut170900225/86537732-silhouette-of-japan-map.jpg'
              )
            ),
          ),
          child: Column(
            children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 15.0, horizontal: 10.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: GestureDetector(
                      onTap: () { },
                      child:  const CircleAvatar(
                        radius: 80.0,
                        backgroundImage:
                          NetworkImage(
                              'https://img.freepik.com/vector-gratis/monte-fuji-paisaje-ilustracion-santuario-sintoista-atracciones-turisticas_133188-35.jpg'
                          ),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Text('¿Que quieres aprender hoy?')
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (ctx)=> const Lessons())),
                    child: const Text(
                    'Hiragana',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'MochiyPopOne',
                        fontSize: 25)
                    ),
                    style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      fixedSize: Size(widthScreen, 50),
                      primary: const Color(0xFFFC707B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: ElevatedButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (ctx)=> const Lessons())),
                      child: const Text(
                      'Katakana',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'MochiyPopOne',
                        fontSize: 25)
                      ),
                      style: ElevatedButton.styleFrom(
                        elevation: 0.0,
                        fixedSize: Size(widthScreen, 50),
                        primary: const Color(0xFFFC707B),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        )
                      )
                    )
                  ),
                  ElevatedButton(
                    onPressed: (){},
                    child: const Text(
                    'Kanji',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'MochiyPopOne',
                      fontSize: 25
                      )
                    ),
                    style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      fixedSize: Size(widthScreen, 50),
                      primary: const Color(0xFFFC707B),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      )
                    )
                  )
              ])
            ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: SizedBox(
                    width: widthScreen,
                    height: 90,
                    child: Column(
                      children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          'Sabías que...',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF70479E),
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          sabias_que,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Color(0xFF70479E),
                          ),
                        ),
                      ),
                    ])
                  )
                )
              )
            )
          ])
        )
      )
    );
  }
}


