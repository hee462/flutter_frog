// ignore: file_names
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hello/PageFrog1.dart';

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
      home: const PageTadpole3(),
    );
  }
}

class PageTadpole3 extends StatefulWidget {
  const PageTadpole3({super.key});

  @override
  State<StatefulWidget> createState() => _PageTadpole3();
}

class _PageTadpole3 extends State<PageTadpole3> {
   int _counter = 30;
  int eggCounter() {
    setState(() {
      _counter++;
    });
    return _counter;
  }

  String imagePath = "images/v3tadpole1.png";

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
           padding: EdgeInsets.fromLTRB(0, 50, 0, 100),
              child: Text(
                '올챙이가 \n앞다리가 생겼어요! ',style: TextStyle(fontSize: 40,color: Colors.white),textAlign: TextAlign.center, 
              ),
            ),
          Padding(
          padding:  const EdgeInsets.fromLTRB(0, 50, 0, 0),
            
              child: GestureDetector(
                onTap:(){
                  setState(() {
                    if(imagePath =="images/v3tadpole1.png"){
                      imagePath ="images/v3tadpole2.png";
                    }else if(imagePath =="images/v3tadpole2.png"){
                      imagePath ="images/v3tadpole1.png";
                    }
                  });
                  
                 var texts =["올챙이는 뒷다리는 점점 자라난다","올챙이의 앞다리는 구멍을 통에서 쏘옥 나온다"," 색이 변하고,올챙이때 사용한 입이 떨어진다"];
                 var index = Random().nextInt(3);
                 var text = texts[index];
                  eggCounter() == 50?
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const PageFrog1()))
                 :ScaffoldMessenger.of(context).showSnackBar( SnackBar (
                   duration: Duration.zero,
                      content: Text(text,style:const TextStyle(fontSize: 15),)));
                },
                child: Image.asset( imagePath,width: 200,height: 120,fit: BoxFit.contain,))),
       
          ],

        ),
      ),
    
      ); 
    
  }
}
