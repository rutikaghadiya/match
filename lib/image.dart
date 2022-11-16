import 'dart:io';
import 'dart:typed_data';

import 'package:external_path/external_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as imglib;
import 'package:permission_handler/permission_handler.dart';



class image extends StatefulWidget {
  const image({Key? key}) : super(key: key);

  @override
  State<image> createState() => _imageState();
}

class _imageState extends State<image> {

   int divide =3;
  List<Image> splitImage(List<int> input) {
    // convert image to image from image package
    imglib.Image? image = imglib.decodeImage(input);

    int x = 0,
        y = 0;
    int width = (image!.width / 3).round();
    int height = (image.height / 3).round();

    // split image to parts
    List<imglib.Image> parts = [];
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        parts.add(imglib.copyCrop(image, x, y, width, height));
        x += width;
      }
      x = 0;
      y += height;
    }

    // convert image from image package to Image Widget to display
    List<Image> output = [];
    for (var img in parts) {
      output.add(Image.memory(Uint8List.fromList(imglib.encodeJpg(img))));
    }

    return output;
  }

  Future<File> getImageFileFromAssets(String path) async {
    final byteData = await rootBundle.load('$path');

    var directory = await ExternalPath .getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_DOWNLOADS)+"/myfolder";
    Directory d=Directory(directory);
    if (!await d.exists()) {
      print("Already created");
      await d.create();
    }

    final file = File('${d.path}/img.jpg');

    await file.writeAsBytes(byteData.buffer.asInt8List(byteData.offsetInBytes, byteData.lengthInBytes));

    return file;
  }
  List<Image> imglist=[];
    createimage() async {
      // assets to file
      var status=await Permission.storage.status;
      if(status.isDenied)
        {
          await[Permission.storage].request();
        }
      File f=  await getImageFileFromAssets('images/im.jpg');

       //file to list<int>
      List<int> intimglist=  await f.readAsBytes();


      imglist = await splitImage(intimglist);
      imglist.shuffle();
      setState(() {

      });

    }


  @override
  void initState() {
    createimage();
    w=Container(
      width: 100,
      height: 100,
      color: Colors.yellow,
    );
  }
Widget ?w;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
    body: Column(
      children: [
        Container(
          height: 400,
          child: GridView.builder(itemCount: imglist.length,
            itemBuilder: (context, index) {
            return DragTarget(
              onAccept: ( int data) {
                setState((){
                  Image temp;
                  temp=imglist[data];
                  imglist[data]=imglist[index];
                  imglist[index]=temp;
                });

              },
              builder: (context, candidateData, rejectedData) {
              return Draggable(data: index,child: Container(
                child: imglist[index],
              ), feedback: Container(
                height: 110,
                width: 110,
                child: imglist[index],
              ));
            },);
          },gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: divide.toInt(),crossAxisSpacing: 10,mainAxisSpacing: 10),),
        )
      ],
    ),
    );
  }
}
