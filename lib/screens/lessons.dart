import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Lessons extends StatefulWidget {
  const Lessons({Key? key}) : super(key: key);

  @override
  State<Lessons> createState() => _LessonsState();
}

class _LessonsState extends State<Lessons> {
  @override
  Widget build(BuildContext context) {
    var widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lecciones'),
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
          ),/*
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
            SizedBox(
              height: 25,
              child: VerticalDivider(
                color: Colors.red,
                thickness: 2,
                indent: 5,
                endIndent: 0,
                width: 5,
              ),
            ),
          ]),*/
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: SizedBox(
              height: MediaQuery.of(context).size.height*0.63,
              child:  ListView.builder(
                itemCount: 27,
                itemBuilder: (ctx, i) =>
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 25),
                    child: Column(
                      crossAxisAlignment: i%2==0 ? CrossAxisAlignment.start : CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Leccion ${i+1}',
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.height*0.27,
                          child: const Divider(
                            color: Color(0xFFBEF8FF),
                            thickness: 2,
                          ),
                        ),
                        const Text('いちいち'),
                    ]),
                  )
              ),
            )
          )
        ])
    );
  }
}
