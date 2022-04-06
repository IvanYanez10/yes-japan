import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);
  @override
  State<SliderScreen> createState() => _SliderState();
}

class _SliderState extends State<SliderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [ const Text(
          'Primera!',
          style: TextStyle(
              fontWeight: FontWeight.bold
          ),
        ),
        Container(
        child: Row(
          children: const [
            Icon(
              Icons.circle,
              color: Colors.black,
              size: 20.0,
            ),
            Icon(
              Icons.circle,
              color: Colors.black,
              size: 20.0,
            ),
            Icon(
              Icons.circle,
              color: Colors.black,
              size: 20.0,
            )
          ],
        ),)
      ]),
    );
  }
}
//    \' \n \t   " \" "