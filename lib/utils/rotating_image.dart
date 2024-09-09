import 'package:flutter/material.dart';
import 'dart:math' as math;

class RotatingImage extends StatefulWidget {
  const RotatingImage(
      {super.key,
      required this.imagePath,
      required this.height,
      required this.width});
  final String imagePath;
  final double height;
  final double width;

  @override
  State<RotatingImage> createState() => _RotatingImageState();
}

class _RotatingImageState extends State<RotatingImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1))
          ..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.rotate(
          angle: math.pi * _controller.value,
          child: child,
        );
      },
      child: Image.asset(
        widget.imagePath,
        width: widget.width,
        height: widget.height,
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
