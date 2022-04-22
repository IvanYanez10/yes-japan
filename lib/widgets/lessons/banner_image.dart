import 'package:flutter/cupertino.dart';

class BannerImage extends StatelessWidget {
  const BannerImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //TODO: replace whit ScreenSize
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.2,
      child: const Image(
        image: AssetImage('assets/images/monte-fuji.png'),
        fit: BoxFit.cover,
      ),
    );
  }
}
