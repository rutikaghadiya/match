import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class media extends StatefulWidget {
  const media({Key? key}) : super(key: key);

  @override
  State<media> createState() => _mediaState();
}

class _mediaState extends State<media> {
  // @override
  // void initState() {
  //  super.initState();
  //  SystemChrome.setPreferredOrientations([
  //    DeviceOrientation.portraitUp,
  //    DeviceOrientation.portraitDown,
  //  ]);
  // }

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    double apperheight=kToolbarHeight;
    double statusbarheight=MediaQuery.of(context).padding.top;
    double bottombarheight=MediaQuery.of(context).padding.bottom;
    double bodyheight=height-apperheight-statusbarheight-bottombarheight;

    print("w=$width");
    print("h=$height");

    return Scaffold(
      appBar: AppBar(),
      body: Row(
        children: [
          Container(
        //    margin: EdgeInsets.all(10),
            height:100,
            width: width*0.5,
            color: Colors.black,
          ),
          Container(
           // margin: EdgeInsets.all(10),
            height:100,
            width: width*0.5,
            color: Colors.yellow,
          )
        ],
      ),
    );
  }


}
