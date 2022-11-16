import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:match/model.dart';

class slider extends StatelessWidget {
  const slider ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    model m=Get.put(model());
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
         Obx(() =>  Slider(onChanged: (value) {

           m.change(value);
         },
           min: 1,
           max: 10,
           value: m.v.value,),),
        Obx(() =>  Text("${m.v}")),
        ],
      ),
    );
  }
}
