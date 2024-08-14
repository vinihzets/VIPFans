import 'package:flutter/material.dart';

class IconHelper {
  static Icon fetchIconByStatus(String status) {
    Color? iconColor;
    IconData? icon;
    switch (status) {
      case "Pendente":
        iconColor = Colors.amber;
        icon = Icons.pending;
        break;
      case "Aberto":
        iconColor = Colors.blue;
        icon = Icons.indeterminate_check_box;
        break;
      case "Reaberto":
        iconColor = Colors.red;
        icon = Icons.indeterminate_check_box;
        break;
      case "Finalizado":
        iconColor = Colors.green;
        icon = Icons.check_box;
        break;
      default:
        iconColor = Colors.grey;
        icon = Icons.check_box;
    }
    return Icon(
      icon,
      color: iconColor,
    );
  }
}
