import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controller extends GetxController
{

  //2. var,method,controller
   RxInt ans=0.obs;
   TextEditingController t1=TextEditingController();
   TextEditingController t2=TextEditingController();

    void sum(String a,String b)
    {
       ans.value=int.parse(a)+int.parse(b);
    }
}