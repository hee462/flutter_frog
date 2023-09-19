import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hello/PageTadpole3.dart';

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
      home: const PageTadpole2(),
    );
  }
}

class PageTadpole2 extends StatefulWidget {
  const PageTadpole2({super.key});

  @override
  State<StatefulWidget> createState() => _PageTadpole2();
}

class _PageTadpole2 extends State<PageTadpole2> {
   int _counter = 20;
  int eggCounter() {
    setState(() {
      _counter++;
    });
    return _counter;
  }
  
  String imagePath = "images/v2tadpole2.png";

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
           padding: EdgeInsets.fromLTRB(0, 50, 0, 50),
              child: Text(
                '올챙이가 \n뒷다리가 생겼어요! ',style: TextStyle(fontSize: 40,color: Colors.white),textAlign: TextAlign.center, 
              ),
            ),
          Padding(
          padding:  const EdgeInsets.fromLTRB(0, 20, 0, 0),
            
              child: GestureDetector(
                
                onTap:(){
                  setState(() {
                    if(imagePath =="images/v2tadpole2.png"){
                      imagePath ="images/v2tadpole1.png";
                    }else if(imagePath =="images/v2tadpole1.png"){
                      imagePath ="images/v2tadpole2.png";
                    }
                  });
                  
                  var texts =["포켓몬 발챙이 배에 있는 회오리는 진짜 올챙이에도 있다","올챙이는 움직이면 먹고, 먹이가 아니면 뱉어요"];
                  var index = Random().nextInt(2);
                  var text = texts[index];
                  eggCounter() == 30?
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const PageTadpole3()))
                  :ScaffoldMessenger.of(context).showSnackBar( SnackBar (
                    duration: Duration.zero,
                      content: Text(text,style:const TextStyle(fontSize: 15),)));
                      
                },
                child: Image.asset( imagePath,width: 200,height: 200,fit: BoxFit.contain,)
                
                ),
                ),
       
          ],

        ),
      ),
    
      ); 
    
  }
}
