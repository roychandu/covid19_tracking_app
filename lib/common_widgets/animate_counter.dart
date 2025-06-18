import 'package:flutter/material.dart';

class AnimatedCounter extends StatelessWidget {
  final int value;
  final Duration duration;
  final TextStyle? style;

  const AnimatedCounter({
    Key? key,
    required this.value,
    this.duration = const Duration(seconds: 2),
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<int>(
      tween: IntTween(begin: 0, end: value),
      duration: duration,
      builder: (context, val, child) {
        return Text(
          val.toString(),
          style: style ?? TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        );
      },
    );
  }
}
