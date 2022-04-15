import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'lesson.dart';

class Lessons extends StatefulWidget {
  final String topic;
  const Lessons(this.topic);

  @override
  State<Lessons> createState() => _LessonsState();
}

class _LessonsState extends State<Lessons> {
  late final data;
  late List data2;
  String listData = '';

  Future<void> loadJsonData() async {
    var jsonText = await rootBundle.loadString('assets/${widget.topic}_lessons.json');
    setState((){
      data = json.decode(jsonText);
    });
  }

  @override
  void initState() {
    loadJsonData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF9475B6),
        title: Text('Lecciones ${widget.topic}'),
      ),
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.2,
            child: const Image(
              image: AssetImage('assets/images/monte-fuji.png'),
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: data.isEmpty
            ? const Center(
              child: CircularProgressIndicator(
                  color: Colors.blue,
                  strokeWidth: 1.5,
                ),
            )
            : Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15.0),
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (ctx, i) =>
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: i%2==0
                        ? CrossAxisAlignment.start
                        : CrossAxisAlignment.end,
                      children: [
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (ctx) => Lesson(lesson: i+1))),
                          child: Container(
                            margin: const EdgeInsets.all(5),
                            child: Column(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: 'Lección ${i+1}  ',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                    children: [
                                      if(i==1)...[
                                        const WidgetSpan(
                                          child: Icon(
                                            Icons.add_task,
                                            color: Colors.green
                                          )
                                        )
                                      ]
                                    ],
                                  ),
                                ),
                                Container(
                                  //color: Colors.grey,
                                  child: SizedBox(
                                    width: widthScreen*0.43,
                                    child:
                                    SizedBox(
                                      width: 10,
                                      height: 10,
                                      child: CustomPaint(
                                        painter: OpenPainter(
                                            i%2==0
                                              ?'left'
                                              :'right',
                                            widthScreen*0.43,
                                            0xFFBEF8FF
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  data['l${i+1}'].values.toList().join().toString(),
                                  style: const TextStyle(
                                      letterSpacing: 10,
                                      fontSize: 14
                                  ),
                                ),
                              ]
                            ),
                          ),
                        ),                        //
                      ]),
                  )
              ),
            ),
          )
      ])
    );
  }
}

class OpenPainter extends CustomPainter {
  String side='';
  double screenWidth;
  int colorCircle;
  OpenPainter(this.side, this.screenWidth, this.colorCircle);
  @override
  void paint(Canvas canvas, Size size) {
    screenWidth;//+=5;
    var paint1 = Paint()
      ..color = const Color(0xFFBEF8FF)  //0xFFBEF8FF
      ..style = PaintingStyle.fill
      ..strokeWidth = 2
    ;
    var paint2 = Paint()
      ..color = Color(colorCircle)
      ..style = PaintingStyle.fill
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
        ;
    if(side=='left'){
      canvas.drawLine(const Offset(0, 5), Offset(screenWidth, 5), paint1);
      canvas.drawLine(Offset(screenWidth, 5), Offset(screenWidth, 80), paint1);
      canvas.drawCircle(Offset(screenWidth, 5), 10, paint2);
    }else{
      canvas.drawLine(const Offset(1, 5), Offset(screenWidth, 5), paint1);
      canvas.drawLine(const Offset(1, 5), const Offset(0, 80), paint1);
      canvas.drawCircle(const Offset(1, 5), 10, paint2);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

/*
const Divider(
color: Color(0xFFBEF8FF),
thickness: 2,
 */