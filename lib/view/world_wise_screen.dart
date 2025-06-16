import 'dart:async';

import 'package:flutter/material.dart';

class WorldWiseScreen extends StatefulWidget {
  const WorldWiseScreen({super.key});

  @override
  State<WorldWiseScreen> createState() => _WorldWiseScreenState();
}

class _WorldWiseScreenState extends State<WorldWiseScreen>
    with TickerProviderStateMixin {
  // AnimationController _controller;
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 3),
  )..repeat();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Timer() for duration of animation
    Timer(const Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WorldWiseScreen()),
      );
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold());
  }
}
