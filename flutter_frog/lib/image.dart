// import 'package:flutter/material.dart';

// class Pagebob extends StatefulWidget {
//   const Pagebob({super.key});

//   @override
//   State<Pagebob> createState() => _PagebobState();
// }

// class _PagebobState extends State<Pagebob> with SingleTickerProviderStateMixin {
//   late AnimationController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller =
//         AnimationController(vsync: this, duration: const Duration(seconds: 2));
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   final Animation<double> _animation = Tween<double>(
//     begin: 0.0, // 시작 위치
//     end: 300.0, // 떨어질 거리
//   ).animate(_controller);
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//         animation: _animation,
//         builder: (BuildContext context, Widget Child) {
//           return Transform.translate(
//             offset: Offset(0.0, _animation.value),
//             child: GestureDetector(
//               onTap: () {
//                 _controller.forward();
//               },
//               child: Image.asset('images/bob.png'),
//             ),
//           );
//         });
//   }
// }
