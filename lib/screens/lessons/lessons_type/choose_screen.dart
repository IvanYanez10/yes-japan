import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Choose extends StatefulWidget {
  const Choose();
  @override
  State<Choose> createState() => _ChooseState();
}

class _ChooseState extends State<Choose> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF70479E),
        title: const Text('Demuestra lo que sabes'),
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
          children: const [
            ItemChoose() //has to rerender
          ],
        ),
      ),
    );
  }
}

class ItemChoose extends StatefulWidget {
  const ItemChoose({Key? key}) : super(key: key);

  @override
  State<ItemChoose> createState() => _ItemChooseState();
}

class _ItemChooseState extends State<ItemChoose> {
  @override
  Widget build(BuildContext context) {
    var heightScreen = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: heightScreen*.3,
            width: double.infinity,
            child: const Text(
              'あ', //TODO: get from parameters
              style: TextStyle(
                fontSize: 150,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 250,
            height: 250,
            child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(4, (i) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    alignment: Alignment.center,
                    width: 10,
                    height: 50,
                    color: const Color(0xFFD4DFFF),
                    child: Text('$i'), //TODO: get this value from random list at start
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

//TODO: when press a button return answer and render another question