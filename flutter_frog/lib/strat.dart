import 'package:flutter/material.dart';
import 'package:hello/PageEgg.dart';
import 'package:hello/PageEgg2.dart';
import 'package:hello/PageTadpole.dart';
import 'package:hello/PageTadpole2.dart';
import 'package:hello/PageTadpole3.dart';
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
      routes: {
        "/egg1": (context) => const PageEgg(),
        "/egg2": (context) => const PageEgg2(),
        "/tadpole": (context) => const PageTadpole(),
        "/tadpole2": (context) => const PageTadpole2(),
        "/tadpole3": (context) => const PageTadpole3(),
        "/end": (context) => const PageEnd(),
        "/view": (context) => PageList()
      },
      home: const PageStart(),
    );
  }
}

class PageStart extends StatefulWidget {
  const PageStart({super.key});

  @override
  State<StatefulWidget> createState() => _StartPage();
}

class _StartPage extends State<PageStart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 244, 86, 139),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => PageList()));
              },
              icon: const Icon(Icons.app_registration))
        ],
      ),
      body: Container(
        width: 1000,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/background.jpg'), fit: BoxFit.fill)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 200.0,
            ),
            const Text(
              '깨굴 깨굴\n개구리 ',
              style: TextStyle(
                fontSize: 60,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50.0),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const PageEgg()));
              },
              child: const Text("시작하기"),
            )
          ],
        ),
      ),
    );
  }
}
