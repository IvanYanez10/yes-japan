import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
        leading: IconButton(
            onPressed: (){},
            icon: const Icon(
              Icons.menu,
              size: 40,
            )),
        actions: [
          IconButton(
              onPressed: (){},
              icon: const Icon(
                Icons.search,
                size: 40,
              ))
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
                          NetworkImage('https://img.freepik.com/vector-gratis/monte-fuji-paisaje-ilustracion-santuario-sintoista-atracciones-turisticas_133188-35.jpg'),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  ),
                  const Text('¿Que quieres aprender hoy?'),
                  ElevatedButton(
                    onPressed: (){},
                    child: const Text('Hiragana'),
                    style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      fixedSize: const Size(200, 50), primary: Colors.deepOrange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: ElevatedButton(
                      onPressed: (){},
                      child: const Text('Katakana'),
                      style: ElevatedButton.styleFrom(
                        elevation: 0.0,
                        fixedSize: const Size(200, 50), primary: Colors.deepOrange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        )
                      )
                    )
                  ),
                  ElevatedButton(
                    onPressed: (){},
                    child: const Text('Kanji'),
                    style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      fixedSize: const Size(200, 50), primary: Colors.deepOrange,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      )
                    )
                  )
              ])
            ),
            const Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text('Frases'),
                )
              )
            )
          ])
        )
      )
    );
  }
}


