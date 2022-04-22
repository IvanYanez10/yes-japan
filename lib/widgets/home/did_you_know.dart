import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DidYouKnow extends StatefulWidget {
  const DidYouKnow({Key? key}) : super(key: key);
  @override
  State<DidYouKnow> createState() => _DidYouKnowState();
}

class _DidYouKnowState extends State<DidYouKnow> {
  late List facts;
  String fact = '';

  Future<String> loadJsonData() async {
    var jsonText = await rootBundle.loadString('assets/sabias_que.json');
    facts = json.decode(jsonText);
    var rnd = Random().nextInt(facts.length);
    setState(() {
      fact = facts[rnd]['datos'];
    });
    return 'success';
  }

  @override
  void initState() {
    loadJsonData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Align(
            alignment: FractionalOffset.bottomCenter,
            child: Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: SizedBox(
                    width: MediaQuery.of(context).size.width*.8,
                    height: 90,
                    child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Text(
                              'Sabías que...',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          Text(
                            fact,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: Theme.of(context).textTheme.bodyText1?.fontSize,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ])
                )
            )
        )
    );
  }
}
