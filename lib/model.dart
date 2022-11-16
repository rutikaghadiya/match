import 'package:get/get.dart';

class model extends GetxController
{
    RxDouble v=2.0.obs;
    void change(double val)
    {
         v.value=val;
    }
}