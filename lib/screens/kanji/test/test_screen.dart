import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);
  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {

  late OverlayEntry overlayEntry;

  showOverlay(BuildContext context) {
    OverlayState? overlayState = Overlay.of(context);
    overlayEntry = OverlayEntry(
      builder: (context) => Scaffold(
        backgroundColor: Colors.white.withOpacity(0.8),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              overlayEntry.remove();
            },
            child: const Text("INICIAR")
          )
        )
      )
    );
    overlayState?.insert(overlayEntry);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool willLeave = false;
        // show the confirm dialog
        await showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('¿Quieres salir?'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  willLeave = true;
                  Navigator.of(context).pop();
                },
                child: const Text('Si')),
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('No'))
            ],
          ));
        return willLeave;
      },
      child: Scaffold(
        body: SafeArea(
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                alignment: Alignment.bottomCenter,
                image: AssetImage("assets/images/sea.png"),
                fit: BoxFit.contain
              )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //const Overlay(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    width: 350,
                    height: 15,
                    color: Colors.red,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  color: Colors.grey,
                  width: 250,
                  height: 250,
                  child: const Text('Letra'),
                ),
                SizedBox(
                  width: 250,
                  height: 250,
                  child: GridView.count(
                    crossAxisCount: 2,
                    children: List.generate(4, (i) {
                      return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: InkWell(
                          onTap: (){
                            showOverlay(context);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 10,
                            height: 50,
                            color: const Color(0xFFD4DFFF),
                            child: Text('$i'),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
