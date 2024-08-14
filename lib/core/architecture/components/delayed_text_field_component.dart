import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DelayedTextFieldComponent extends StatefulWidget {
  final TextEditingController controller;
  final InputDecoration inputDecoration;
  final TextInputType? inputType;
  final bool? onlyDigits;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String? value)? onFieldSubmitted;

  const DelayedTextFieldComponent(
      {required this.controller,
      this.inputType,
      this.onlyDigits,
      this.inputFormatters,
      this.onFieldSubmitted,
      required this.inputDecoration,
      super.key});

  @override
  State<DelayedTextFieldComponent> createState() =>
      _DelayedTextFieldComponentState();
}

class _DelayedTextFieldComponentState extends State<DelayedTextFieldComponent> {
  @override
  void initState() {
    //  --> tempo pra resetar o campo de busca e fazer a request novamente sem filtragem
    // Future.delayed(Duration(seconds: 3))
    //     .then((value) => widget.controller.addListener(() {
    //           if (widget.controller.text.isEmpty) {
    //             widget.callBack();
    //           }
    //         }));
    super.initState();
  }

  @override
  void dispose() {
    // widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: widget.onFieldSubmitted != null
          ? (v) => widget.onFieldSubmitted!(v)
          : null,
      keyboardType: widget.inputType,
      controller: widget.controller,
      decoration: widget.inputDecoration,
      inputFormatters: widget.inputFormatters,
    );
  }
}
