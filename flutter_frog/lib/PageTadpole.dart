// ignore: file_names
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hello/PageTadpole2.dart';

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
      home: const PageTadpole(),
    );
  }
}

class PageTadpole extends StatefulWidget {
  const PageTadpole({super.key});

  @override
  State<StatefulWidget> createState() => _PageTadpole();
}

class _PageTadpole extends State<PageTadpole> {
   int _counter = 10;
  int eggCounter() {
    setState(() {
      _counter++;
    });
    return _counter;
  }

String imagePath = "images/tadpole2.png";
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
          image: DecorationImage(image: AssetImage('images/tadpole-back2.jpg'),fit: BoxFit.fill)
        ),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
           padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: Text(
                '올챙이가 \n아가미로 숨을 쉬어요! ',style: TextStyle(fontSize: 40,color: Colors.white),textAlign: TextAlign.center, 
              ),
            ),
          Padding(
          padding:  const EdgeInsets.fromLTRB(0, 250, 0, 0),
            
              child: GestureDetector(
                onTap:(){
                  setState(() {
                    if(imagePath =="images/tadpole2.png"){
                      imagePath ="images/tadpole1.png";
                    }else if(imagePath =="images/tadpole1.png"){
                      imagePath ="images/tadpole2.png";
                    }
                  });
                  var texts = ["올챙이는 바로 먹이활동을 하지 않아요","몸에 난황으로 영양분을 섭취해요",];
                  var index = Random().nextInt(2);
                  var text = texts[index];
                  eggCounter()== 20?
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const PageTadpole2()))
                  :ScaffoldMessenger.of(context).showSnackBar( SnackBar (
                     duration: Duration.zero,
                      content: Text(text,style:const TextStyle(fontSize: 15),)));
                },
                child: Image.asset( imagePath,width: 140,height: 90,fit: BoxFit.contain,))),
       
          ],

        ),
      ),
    
      ); 
    
  }
}
