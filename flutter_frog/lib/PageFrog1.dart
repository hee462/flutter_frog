// ignore: file_names
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hello/PageFrog2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 198, 83, 168)),
        useMaterial3: true,
      ),
      home: const PageFrog1(),
    );
  }
}

class PageFrog1 extends StatefulWidget {
  const PageFrog1({super.key});

  @override
  State<StatefulWidget> createState() => _PageFrog1();
}

class _PageFrog1 extends State<PageFrog1> {
   int _counter = 50;
  int eggCounter() {
    setState(() {
      _counter++;
    });
    return _counter;
  }

  String imagepath = "images/forg1.png";

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title:  Text("$_counter 일 째",),centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
       
      ),
      body:  Container(
        width: 1000,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('images/frog-back1.jpg'),fit: BoxFit.fill)
        ),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
           padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: Text(
                '점점 개구리와 생김새가 비슷해요\n 밖에서도 숨을 쉴 수 있어요! ',style: TextStyle(fontSize: 25,color: Colors.white),textAlign: TextAlign.center, 
              ),
            ),
          Padding(
          padding:  const EdgeInsets.fromLTRB(0, 350, 0, 0),
            
              child: GestureDetector(
                onTap:(){
                   setState(() {
                    if(imagepath =="images/forg1.png"){
                      imagepath ="images/forg2.png";
                    }else if(imagepath =="images/forg2.png"){
                      imagepath ="images/forg1.png";
                    }
                  });
                  setState(() {
                    imagepath =["images/forg1.png","images/forg2.png"][Random().nextInt(2)];
                  });
                  var texts =["먹이활동을 하지않고,꼬리영양분을 흡수한다","피부로 숨을 쉬기 때문에 몸을 촉촉하게 해주어야 합니다"];
                  var index =Random().nextInt(2);
                  var text = texts[index];
                  eggCounter() == 60?
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const PageFrog2()))
                 :ScaffoldMessenger.of(context).showSnackBar( SnackBar (
                   duration: Duration.zero,
                      content: Text(text,style:const TextStyle(fontSize: 15),)));
                },
                child: Image.asset( imagepath,width: 150,height: 150,fit: BoxFit.fill,))),
       
          ],

        ),
      ),
    
      ); 
    
  }
}
