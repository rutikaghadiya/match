import 'dart:convert';

import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class currency extends StatefulWidget {
  const currency({Key? key}) : super(key: key);

  @override
  State<currency> createState() => _currencyState();
}

class _currencyState extends State<currency> {
  String contry1 = "INR";
  String contry2 = "USD";
  TextEditingController t1=TextEditingController();
  TextEditingController t2=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        body: SafeArea(

            child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 10,
                        spreadRadius: 10,
                        offset: Offset(0, 3))
                  ],
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 5,
                            child: Text(
                              "  $contry1",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.black),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: IconButton(
                                onPressed: () {
                                  showCurrencyPicker(
                                      context: context,
                                      onSelect: (Currency currency) {
                                        setState(() {
                                          contry1 = currency.code;
                                        });
                                      });
                                },
                                icon: Icon(Icons.arrow_circle_right_rounded)),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: t1,
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: 15, color: Colors.black),
                        decoration: InputDecoration(hintText: "0.0"),
                      ),
                    ),

                    // Expanded(
                    //   child: TextField(
                    //     keyboardType: TextInputType.number,
                    //     style: TextStyle(fontSize: 15, color: Colors.black),
                    //     decoration: InputDecoration(hintText: "0.0"),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            IconButton(onPressed: () async {
              var url = Uri.parse('https://rutikaflutter.000webhostapp.com/currency.php' );
              var response = await http.post(url, body: {'to': '$contry1', 'from': '$contry2', 'amount': "${t1.text}"});
              print('Responce.body : ${response.body}');
              print('Response.statusCode: ${response.statusCode}');
              Map m=jsonDecode(response.body);
              setState(() {
                t2.text=m['result'].toString();
              });
            }, icon: Icon(Icons.cached_rounded,color: Colors.white,size: 50,)),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 10,
                        spreadRadius: 10,
                        offset: Offset(0, 3))
                  ],
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 5,
                            child: Text(
                              "  $contry2",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.black),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: IconButton(
                                onPressed: () {
                                  showCurrencyPicker(
                                      context: context,
                                      onSelect: (Currency currency) {
                                        setState(() {
                                          contry2 = currency.code;
                                        });
                                      });
                                },
                                icon: Icon(Icons.arrow_circle_right_rounded)),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child:TextField(
                        controller: t2,

                      ),

                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 100,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10,
                      spreadRadius: 10,
                      offset: Offset(0, 3))
                ],
              ),
              // child: Column(
              //   children: [
              //     Expanded(
              //       flex: 1,
              //       child: Center(
              //         child: Text(
              //           "ANSWER",
              //           style: TextStyle(
              //               fontWeight: FontWeight.bold,
              //               fontSize: 30,
              //               color: Colors.white),
              //         ),
              //       ),
              //     ),
              //     Expanded(
              //       flex: 2,
              //       child: Center(
              //         child: Text(
              //           "0",
              //           style: TextStyle(
              //               fontWeight: FontWeight.bold,
              //               fontSize: 20,
              //               color: Colors.white),
              //         ),
              //       ),
              //     )
              //   ],
              // ),
            )
          ],
        )));
  }
}
