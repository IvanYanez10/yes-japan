import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
            color: Colors.white,
            child: Column(
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Tamaño de letra',
                      textAlign: TextAlign.left,
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Idioma',
                      textAlign: TextAlign.left,
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Examen',
                      textAlign: TextAlign.left,),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Flash cards',
                      textAlign: TextAlign.left,),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Ayuda',
                      textAlign: TextAlign.left,),
                  )
                ]
            )
        )
    );
  }
}
