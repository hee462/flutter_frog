import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hello/PageTadpole.dart';

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
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 198, 83, 168)),
        useMaterial3: true,
      ),
      home: const PageEgg2(),
    );
  }
}

class PageEgg2 extends StatefulWidget {
  const PageEgg2({super.key});

  @override
  State<StatefulWidget> createState() => _PageEgg2();
}

class _PageEgg2 extends State<PageEgg2> {
  int _counter = 0;
  int eggCounter() {
    setState(() {
      _counter++;
    });
    return _counter;
  }

  String imagePath = "images/v2egg.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "$_counter 일 째",
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Container(
        width: 1000,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/egg-back.jpg'), fit: BoxFit.fill)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: Text(
                '개구리 알을\n깨워주세요 ',
                style: TextStyle(fontSize: 40, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 250, 0, 0),
                child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (_counter == 2) {
                          imagePath = "images/v2egg2.png";
                        } else if (_counter == 3) {
                          imagePath = "images/v2egg3.png";
                        } else if (_counter == 4) {
                          imagePath = "images/v2egg4.png";
                        } else if (_counter == 6) {
                          imagePath = "images/v3egg5.png";
                        }
                        var texts = [
                          "개구리알은 그늘진 웅덩이에서 발견되요",
                          "개구리알은 3월 초에서 5월초까지 발견되요"
                        ];
                        var index = Random().nextInt(2);
                        var text = texts[index];
                        eggCounter() == 10
                            ? Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const PageTadpole()))
                            : ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(
                                    duration: Duration.zero,
                                    content: Text(
                                      text,
                                      style: const TextStyle(fontSize: 15),
                                    )));
                      });
                    },
                    child: Image.asset(
                      imagePath,
                      width: 100,
                      height: 100,
                      fit: BoxFit.contain,
                    ))),
          ],
        ),
      ),
    );
  }
}
