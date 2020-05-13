import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

mixin AlertDialogMixin {
  Future<T> showAlertDialog<T>(
    BuildContext context, {
    String title,
    @required String content,
    Iterable<AlertDialogAction> actions,
  }) {
    return showDialog<T>(
      context: context,
      builder: (context) {
        return this._getAlertDialog(
            title: Text(title ?? 'Some Alert'),
            content: Text(content),
            actions: actions ??
                [
                  AlertDialogAction.defaultOkForContext(context)
                ] // default OK action?
            );
      },
    );
  }

  Widget _getAlertDialog(
      {@required Widget title,
      @required Widget content,
      @required Iterable<AlertDialogAction> actions}) {
    if (Platform.isIOS) {
      return CupertinoAlertDialog(
        title: title,
        content: content,
        actions: actions
            .map(
              (action) => FlatButton(
                onPressed: action.onTapped,
                child: Text(action.text),
              ),
            )
            .toList(),
      );
    } else {
      return AlertDialog(
        title: title,
        content: content,
        actions: actions
            .map(
              (action) => CupertinoDialogAction(
                onPressed: action.onTapped,
                child: Text(action.text),
              ),
            )
            .toList(),
      );
    }
  }
}

class AlertDialogAction {
  final String text;
  final Function onTapped;

  AlertDialogAction({
    @required this.text,
    @required this.onTapped,
  });

  factory AlertDialogAction.defaultOkForContext(BuildContext context,
          {Function onTap}) =>
      AlertDialogAction(
        text: 'OK',
        onTapped: onTap ??
            () {
              Navigator.of(context).pop();
            },
      );
}
