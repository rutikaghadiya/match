import 'package:flutter/material.dart';

class value extends StatefulWidget {
  const value({Key? key}) : super(key: key);

  @override
  State<value> createState() => _valueState();
}

class _valueState extends State<value> {
  TextEditingController t1=TextEditingController();
  TextEditingController t2=TextEditingController();
  ValueNotifier<int> sum=ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    ValueNotifier<int> b=ValueNotifier(0);
    return Scaffold(
      appBar:AppBar(),
      body: Column(
        children: [
          ValueListenableBuilder(builder: (context, value, child) {
            return Text("$value");
          },valueListenable: b, ),
          ElevatedButton(onPressed: () {
            b.value++;
          }, child: Text("increment")),
          TextField( controller: t1,),
          TextField(controller: t2,),
          ElevatedButton(onPressed: () {
             String a1=t1.text;
             String a2=t2.text;
             b.value=int.parse(a1)+int.parse(a2);
          }, child: Text("Sum")),
          ValueListenableBuilder(builder: (context, val, child) {
            return Text("Sum=${val}");
          },valueListenable: sum,)
        ],
      ),
    );
  }
}
