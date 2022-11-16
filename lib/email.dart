import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class email extends StatefulWidget {
  const email({Key? key}) : super(key: key);

  @override
  State<email> createState() => _emailState();
}

class _emailState extends State<email> {
  TextEditingController t1=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Column(
        children: [
          TextField(
            controller: t1,
          ),
          IconButton(onPressed: () async {

            var url = Uri.parse('https://nidhiflutter.000webhostapp.com/email.php');
            var response = await http.post(url, body: {'email':t1.text});
            print('Response status: ${response.statusCode}');
            print('Response body: ${response.body}');
          }, icon: Icon(Icons.refresh))
        ],
      ),
    );
  }
}
