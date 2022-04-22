import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yes_japan/screens/lessons/lesson_screen.dart';
import 'package:yes_japan/services/screen_size.dart';

class LessonsList extends StatefulWidget {
  final String topic;
  const LessonsList({Key? key, required this.topic}) : super(key: key);
  @override
  State<LessonsList> createState() => _LessonsListState();
}

class _LessonsListState extends State<LessonsList> {
  Map<String, dynamic> data = {};
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
    //TODO: replace with ScreenSize
    var heightScreen = ScreenSize.height(context);
    var heightItem = heightScreen*0.09;
    var widthScreen = ScreenSize.width(context);
    //var widthPadding = widthScreen*0.1;
    var widthItem = widthScreen*(0.5); //-0.1
    return Expanded(
      child: data.isEmpty
        ? const Center(
          child: CircularProgressIndicator(
            color: Colors.blue,
            strokeWidth: 1.5,
          ),
        )
        : Padding(
          padding: const EdgeInsets.only(top: 3),//, left: widthPadding, right: widthPadding
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (ctx, i) => //general item
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Column(
                crossAxisAlignment: i%2==0
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.end,
                children: [ //item composition
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (ctx) => Lesson(lesson: i+1))),
                    child: SizedBox(
                      height: heightItem,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                                if(i==10)...[
                                  const WidgetSpan(
                                      child: Icon(
                                        Icons.add_task,
                                        color: Colors.green,
                                        size: 16,
                                      )
                                  )
                                ]
                              ],
                            ),
                          ),
                          SizedBox(
                            width: widthItem, //0.438
                            child:
                            SizedBox(
                              height: 10,
                              child: CustomPaint(
                                painter: OpenPainter(
                                  i%2==0 ? 'left' : 'right',
                                  i==data.length-1 ? true : false,
                                  widthItem,
                                  heightItem+15
                                ),
                              ),
                            ),
                          ),
                          Text(
                            data['l${i+1}'].values.toList().join().toString(),
                            style: const TextStyle(
                                letterSpacing: 11,
                                fontSize: 14
                            ),
                          ),
                        ]
                      ),
                    ),
                  ),                        //
                ]
              ),
            )
        ),
      ),
    );
  }
}

class OpenPainter extends CustomPainter {
  String side='';
  bool last;
  double screenWidth;
  double itemHeight;
  OpenPainter(this.side, this.last, this.screenWidth, this.itemHeight);
  @override
  void paint(Canvas canvas, Size size) {
    screenWidth;//+=5;
    var paint1 = Paint()
      ..color = const Color(0xFF70479E)  //0xFFBEF8FF
      ..style = PaintingStyle.fill
      ..strokeWidth = 1
    ;
    var paint2 = Paint()
      ..color =  const Color(0xFFFC707B)
      ..style = PaintingStyle.fill
      //..style = PaintingStyle.stroke
      //..strokeWidth = 2
    ;
    if(side=='left'){
      canvas.drawLine(const Offset(0, 5), Offset(screenWidth, 5), paint1); //central
      if(!last) {
        canvas.drawLine(Offset(screenWidth, 5), Offset(screenWidth, itemHeight), paint1);
      } //side
      canvas.drawCircle(Offset(screenWidth, 5), 8, paint2);
    }else{
      canvas.drawLine(const Offset(0, 5), Offset(screenWidth, 5), paint1);
      if(!last) {
        canvas.drawLine(const Offset(0, 5), Offset(0, itemHeight), paint1);
      }
      canvas.drawCircle(const Offset(0, 5), 8, paint2);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}