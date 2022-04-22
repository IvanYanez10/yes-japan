import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class Overlay extends StatelessWidget {
  const Overlay({Key? key}) : super(key: key);
  showOverlay(BuildContext context) async {
    //OverlayState overlayState = Overlay.of(context);
    OverlayEntry overlayEntry = OverlayEntry(
        builder: (context) => Scaffold(
          backgroundColor: Colors.white.withOpacity(0.2),
          body: Center(
            child: ElevatedButton(
                onPressed: () {  },
                child: const Text("INICIAR")
            ),
          ),
        )
    );
    //overlayState?.insert(overlayEntry);
    await Future.delayed(const Duration(seconds: 2));
    overlayEntry.remove();
  }
  @override
  Widget build(BuildContext context) {
    showOverlay(context);
    return Container(
      width: 0,
      height: 0,
    );
  }
}