import 'package:flutter/material.dart';

class first extends StatefulWidget {
  const first({Key? key}) : super(key: key);

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  List imgList=[
    "images/image.png",
    "images/fruit.png",
    "images/mango.png",
    "images/grapes.png",
    "images/lemon.png",
    "images/durian.png",
    "images/image.png",
    "images/fruit.png",
    "images/mango.png",
    "images/grapes.png",
    "images/lemon.png",
    "images/durian.png",
  ];
  List visiblelist=List.filled(12, true);
  int t=1;
  String img1="",img2="";
  int pos1=0,pos2=0;


  @override
  void initState() {
    imgList.shuffle();
    Future.delayed(Duration(seconds: 3)).then((value) {
      setState(() {
        visiblelist=List.filled(12, false);
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text("Picture"),
    ),
      body: GridView.builder(itemCount: imgList.length,itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
              setState(() {
                if (t==1){
                  visiblelist[index]=true;
                  img1=imgList[index];
                  pos1=index;
                  t=2;
                }
                else if(t==2)
                  {
                    visiblelist[index]=true;
                    img2=imgList[index];
                    pos2=index;
                    if(img1==img2){
                      if(!visiblelist.contains(false)){
                            showDialog(builder: (context) {
                              return AlertDialog(
                                title: Text("you are win"),
                              );
                            },context: context, );
                      }
                    }
                    else{
                      Future.delayed(Duration(microseconds: 500)).then((value) {
                        setState(() {
                          visiblelist[pos1]=false;
                          visiblelist[pos2]=false;
                        });
                      });
                    }
                    t=1;
                  }
              });

          },
          child: Visibility(
            visible: visiblelist[index],
            child: Image.asset("${imgList[index]}",height: 100,width: 100,),
          replacement: Container(
            height: 100,
            width: 100,
            color: Colors.red,
          ),),
        );
      },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(childAspectRatio: 2,mainAxisSpacing: 10,crossAxisCount: 3,crossAxisSpacing: 10
        ), ),
    );
  }
}
