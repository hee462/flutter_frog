// ignore: file_names
import 'package:flutter/material.dart';
import 'package:hello/PageEgg2.dart';

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
      home: const PageEgg(),
    );
  }
}

class PageEgg extends StatefulWidget {
  const PageEgg({super.key});

  @override
  State<StatefulWidget> createState() => _PageEgg();
}

class _PageEgg extends State<PageEgg> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  
  }
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
          image: DecorationImage(image: AssetImage('images/page1.jpg'),fit: BoxFit.fill),
          
    
        ),
        
        child: Column(
          
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: [
              
              const Text(
                '개구리 알을\n선택해주세요 ',style: TextStyle(fontSize: 40,color: Colors.white),textAlign: TextAlign.center, 
              ),
              InkWell(
               
                onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PageEgg2(),),),
                
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 150, 0, 0),
                  child: Row(
                  
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            
                    children: [
                      Image.asset( "images/egg1.png",width: 100,height: 100,fit: BoxFit.fill,),
                       Image.asset( "images/egg2.png",width: 160,height: 160,fit: BoxFit.fill,),
                        Image.asset( "images/egg3.png",width: 100,height: 100,fit: BoxFit.fill,)
                      ],
                  
                  ),
                ),
              ),
               GestureDetector(
                onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PageEgg2(),),),
                
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                  child: Row(
                  
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            
                    children: [
                      Image.asset( "images/egg4.png",width: 150,height: 150,fit: BoxFit.fill,),
                       Image.asset( "images/egg5.png",width: 100,height: 100,fit: BoxFit.fill,),
                        Image.asset( "images/egg6.png",width: 100,height: 100,fit: BoxFit.fill,)
                      ],
                  
                  ),
                ),
              ),
            ],
          ),
          ),
        
     
      );
 
    
  }
}



