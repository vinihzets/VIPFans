import 'package:flutter/material.dart';

class FullSizeLayoutButton extends StatelessWidget {
  final Widget child;

  const FullSizeLayoutButton({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 50.0,
      child: child,
    );
  }
}
