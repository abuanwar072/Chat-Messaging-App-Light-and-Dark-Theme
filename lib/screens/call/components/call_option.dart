import 'package:flutter/material.dart';

class CallOption extends StatelessWidget {
  const CallOption({
    Key? key,
    required this.icon,
    required this.press,
    this.color = Colors.white10,
  }) : super(key: key);

  final Icon icon;
  final VoidCallback press;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        height: 56,
        width: 56,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
        child: icon,
      ),
    );
  }
}
