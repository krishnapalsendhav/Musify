import 'package:flutter/material.dart';

class Box extends StatelessWidget {
  final child;
  final shadow;

  const Box({Key? key, required this.child, this.shadow = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey[300],
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade500,
              blurRadius: 15,
              offset: const Offset(5, 5),
            ),
            BoxShadow(
              color: shadow ? Colors.white : Colors.grey.shade500,
              blurRadius: 15,
              offset: const Offset(-5, -5),
            ),
          ]),
      child: Center(
        child: child,
      ),
    );
  }
}
