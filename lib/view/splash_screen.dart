import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 3),
  )..repeat();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Timer(const Duration(seconds: 3), ()=> Navigator.pushReplacement((context), MaterialPageRoute(builder: builder)) );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _controller,
              child: Center(
                child: Container(
                  width: 200,
                  height: 200,
                  child: Image.asset('assets/virus.png', fit: BoxFit.cover),
                ),
              ),
              builder: (context, child) {
                return Transform.rotate(
                  angle: _controller.value * 2.0 * 3.14,
                  child: child,
                );
              },
            ),
            SizedBox(height: 20),
            const Text(
              textAlign: TextAlign.center,
              'COVID-19 \n Tracking App',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
