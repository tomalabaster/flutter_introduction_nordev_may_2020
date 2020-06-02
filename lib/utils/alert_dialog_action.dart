import 'package:flutter/material.dart';

class AlertDialogAction {
  final String text;
  final Function(BuildContext context) onTapped;

  AlertDialogAction(this.text, this.onTapped);
}
