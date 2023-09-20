// ignore: file_names
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hello/PageView.dart';
import 'package:hello/end.dart';

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
      home: const PageFrog2(),
    );
  }
}

class PageFrog2 extends StatefulWidget {
  const PageFrog2({super.key});

  @override
  State<StatefulWidget> createState() => _PageFrog2();
}

class _PageFrog2 extends State<PageFrog2> {
  int _counter = 60;
  int eggCounter() {
    setState(() {
      _counter++;
    });
    return _counter;
  }

  String imagePath = "images/Afrog1.png";
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
                image: AssetImage('images/pond-flower2.jpg'),
                fit: BoxFit.fill)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: Text(
                '꼬리가 없어지고 \n어른개구리가 되었어요! ',
                style: TextStyle(fontSize: 40, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 150, 0, 0),
              child: GestureDetector(
                  onTap: () {
                    setState(() {
                      if (imagePath == "images/Afrog1.png") {
                        imagePath = "images/Afrog2.png";
                      } else if (imagePath == "images/Afrog2.png") {
                        imagePath = "images/Afrog3.png";
                      } else if (imagePath == "images/Afrog3.png") {
                        imagePath = "images/Afrog1.png";
                      }
                    });

                    var texts = [
                      "물속에는 가끔 들어가요",
                      "살아있는 먹이만 먹어요",
                      "개구리는 평균 10년에서 15년 정도 살아요"
                    ];
                    var index = Random().nextInt(3);
                    var text = texts[index];
                    // eggCounter();
                    setState(() {
                      _counter++;
                    });

                    if (_counter == 66) {
                      // debugPrint("count $_counter");
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: const Text('개구리 획득'),
                                content: const Text('개구리 도감에서 확인할수 있습니다 '),
                                actions: [
                                  ElevatedButton(
                                      onPressed: () async {
                                        const frogList = [
                                          // '금개구리',
                                          '산개구리',
                                          // '참개구리',
                                          // '청개구리'
                                        ];
                                        var index = Random().nextInt(4);
                                        var forg = frogList[index];

                                        await Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    PageList(forg: forg)));

                                        debugPrint(
                                            "--------------------------------$forg");
                                      },
                                      child: const Text('도감보러가기')),
                                  ElevatedButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
                                      child: const Text('계속하기'))
                                ],
                              ));
                    } else if (_counter >= 70) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const PageEnd()));
                    }
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        duration: Duration.zero,
                        content: Text(
                          text,
                          style: const TextStyle(fontSize: 15),
                        )));
                  },
                  child: Image.asset(
                    imagePath,
                    width: 200,
                    height: 200,
                    fit: BoxFit.fill,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}


//  Widget alertDialog(BlildContext context){
//       return showDialog(context =context,
//        builder = (BuildContext , context)) => AlertDialog(
//         title: const Text('개구리 획득'),
//         content: const Text('개구리 도감에서 확인할수 있습니다 '),
//         actions: [
//           ElevatedButton(onPressed: (){}, child: const Text('도감보러가기')),
//         ElevatedButton(onPressed: (){}, child: const Text('나중에보기'))
//         ],
//        );