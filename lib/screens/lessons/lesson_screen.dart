import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yes_japan/screens/lessons/lessons_type/study_screen.dart';

class Lesson extends StatefulWidget {
  final int lesson;
  const Lesson({required this.lesson});
  @override
  State<Lesson> createState() => _LessonState();
}

class _LessonState extends State<Lesson> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF9475B6),
        title: Text('Lección ${widget.lesson}'),
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
            Study() //has to change to choose or multiple choice
          ],
        ),
      ),
    );
  }
}
