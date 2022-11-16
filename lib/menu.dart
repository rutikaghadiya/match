import 'package:get/get.dart';
import 'package:match/value.dart';

class menu extends GetxController
{
        RxBool t=false.obs;
       RxBool t1=false.obs;
       RxBool t2=false.obs;
       RxInt a=0.obs;
       void check(int i,int price,bool value)
       {
         switch(i)
         {

           case 1:
             t.value=value!;
           if(t==true)
                  {
                         a=a+price;
                  }
           else{
                  a=a-price;
           }
            break;
            case 2:
              t1.value=value! ;
           if(t1==true)
           {
             a=a+price;
           }
           else{
             a=a-price;
           }
         break;
           case 3:
             t2.value=value! ;
             if(t2==true)
             {
               a=a+price;
             }
             else{
               a=a-price;
             }
             break;
         }

       }

}