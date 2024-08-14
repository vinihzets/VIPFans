import 'package:flutter/material.dart';

class LayoutBuilderComponent extends StatefulWidget {
  final Widget webLayout;
  final Widget mobileLayout;
  const LayoutBuilderComponent(
      {required this.webLayout, required this.mobileLayout, super.key});

  @override
  State<LayoutBuilderComponent> createState() => _LayoutBuilderComponentState();
}

class _LayoutBuilderComponentState extends State<LayoutBuilderComponent> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 1077) {
          return widget.webLayout;
        } else {
          return widget.mobileLayout;
        }
      },
    );
  }
}
