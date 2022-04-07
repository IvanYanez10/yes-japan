import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var widthScreen = MediaQuery.of(context).size.width * 0.8;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Busqueda'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              width: widthScreen,
              height: 300,
              child:Container(
                color: Colors.green,
                child: const Text('Elemento'),
              ),
            ),
            SizedBox(
              width: widthScreen,
              height: 200,
              child: Container(
                color: Colors.blue,
                child: const Text('Descripcion'),
              ),
            )
        ]),
      )
    );
  }
}
