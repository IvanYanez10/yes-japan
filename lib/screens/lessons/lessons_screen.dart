import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yes_japan/widgets/lessons/banner_image.dart';
import 'package:yes_japan/widgets/lessons/lessons_list.dart';

class Lessons extends StatelessWidget {
  final String topic;
  const Lessons(this.topic);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor:  Theme.of(context).primaryColor,
        title: Text('Lecciones ${topic}',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: Column(
        children: [
          const BannerImage(),
          LessonsList(topic: topic)
      ])
    );
  }
}

