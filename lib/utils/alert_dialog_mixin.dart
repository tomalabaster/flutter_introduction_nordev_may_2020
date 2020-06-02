import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nordev_may_2020_live/utils/alert_dialog_action.dart';

mixin AlertDialogMixin {
  Future<T> showAlertDialog<T>(
    BuildContext context, {
    @required String title,
    @required String content,
    @required List<AlertDialogAction> actions,
  }) {
    if (Platform.isIOS) {
      return this._showCupertinoDialog(
        context,
        title: title,
        content: content,
        actions: actions,
      );
    } else {
      return this._showMaterialDialog(
        context,
        title: title,
        content: content,
        actions: actions,
      );
    }
  }

  Future<T> _showCupertinoDialog<T>(
    BuildContext context, {
    @required String title,
    @required String content,
    @required List<AlertDialogAction> actions,
  }) {
    return showCupertinoDialog<T>(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(title),
          content: Text(content),
          actions: actions.map((action) {
            return CupertinoDialogAction(
              child: Text(action.text),
              onPressed: () => action.onTapped(context),
            );
          }).toList(),
        );
      },
    );
  }

  Future<T> _showMaterialDialog<T>(
    BuildContext context, {
    @required String title,
    @required String content,
    @required List<AlertDialogAction> actions,
  }) {
    return showDialog<T>(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: actions.map((action) {
            return FlatButton(
              child: Text(action.text),
              onPressed: () => action.onTapped(context),
            );
          }).toList(),
        );
      },
    );
  }
}
