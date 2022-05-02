import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yes_japan/widgets/home/app_bar_home.dart';
import 'package:yes_japan/widgets/home/did_you_know.dart';
import 'package:yes_japan/widgets/home/home_buttons.dart';
import 'package:yes_japan/widgets/home/home_drawer.dart';
import 'package:yes_japan/widgets/home/nihongo_words.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool change = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: const Drawer(
        child: HomeDrawer()
      ),
      appBar: const AppBarHome(),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.1),
                BlendMode.dstATop
              ),
              image: const AssetImage('assets/images/silueta-japon.png')
            ),
          ),
          child: Column(
            children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50), //20
              child: GestureDetector(
                onTap: () => setState(() {
                  change=!change;
                }),
                child: const CircleAvatar(
                  radius: 80.0,
                  backgroundImage:
                  AssetImage('assets/images/monte-fuji.png'),
                  backgroundColor: Colors.transparent,
                ),
              ),
            ),
            const HomeButtons(),
            !change
              ? const DidYouKnow()
              : const NihongoWords()
          ])
        )
      )
    );
  }
}


