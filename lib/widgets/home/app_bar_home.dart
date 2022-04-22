import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yes_japan/screens/extra/search.dart';

class AppBarHome extends StatelessWidget implements PreferredSizeWidget {
  const AppBarHome({Key? key}) : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.black),
      leading: Builder(
          builder: (context){
            return IconButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                icon: const Icon(
                  Icons.menu,
                  size: 40,
                )
            );
          }
      ),
      actions: [
        Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (ctx)=> const Search())),
                icon: const Icon(
                  Icons.search,
                  size: 40,
                )
            )
        )
      ],
    );
  }
}
