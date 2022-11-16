import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class rotation extends StatefulWidget {
  const rotation({Key? key}) : super(key: key);

  @override
  State<rotation> createState() => _rotationState();
}

class _rotationState extends State<rotation> {

  @override
  void initState(){
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }
  @override
  dispose(){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override

  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      if(orientation==Orientation.landscape){
        return Scaffold(
          appBar: AppBar(
            title: Text("Rotation"),
          ),
          body: Container(height: 100,
            width: 100,
            color: Colors.black,),
        );
      }
      else{
        return Scaffold(
          appBar: AppBar(
            title: Text("Rotation"),
          ),
          body: Container(height: 100,
            width: 100,
            color: Colors.yellow,),
        );
      }
    },);
  }


}
