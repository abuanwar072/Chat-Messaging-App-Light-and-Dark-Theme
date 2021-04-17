import 'package:flutter/material.dart';

class CallBg extends StatelessWidget {
  const CallBg({
    Key? key,
    required this.image,
    required this.child,
  }) : super(key: key);

  final Widget image;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        image,
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF1D1D35),
                Colors.transparent,
                Colors.transparent,
                Color(0xFF1D1D35),
              ],
              stops: [0, 0.2, 0.5, 1],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        child,
      ],
    );
  }
}
