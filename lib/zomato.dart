import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'menu.dart';

class zomato extends StatelessWidget {
  const zomato({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    menu m=Get.put(menu());


    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
       Obx(() =>    CheckboxListTile(title: Text("500"),onChanged: <bool>(value) {

         m.check(1, 500,value);

       },value: m.t.value),),


       Obx(() =>    CheckboxListTile(title: Text("250"),onChanged:<bool> (value) {
         m.check(2, 250, value);
       },value:m.t1.value,),),


        Obx(() =>   CheckboxListTile(title: Text("100"),onChanged:<bool> (value) {
          m.check(3, 100,value);
        },value: m.t2.value,),),
   Obx(() =>  Text("Total=${m.a}"),)
        ],
      ),
    );
  }
}
