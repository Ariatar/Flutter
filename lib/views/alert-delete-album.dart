import 'package:flutter/material.dart';

class AlertDeleteAlbum extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Warning'),
      content: Text('Are you sure to delete this Album?'),
      actions: <Widget>[
        FlatButton(
            child: Text('Yes'),
            onPressed: () => Navigator.of(context).pop(true)),
        FlatButton(
            child: Text('No'),
            onPressed: () => Navigator.of(context).pop(false))
      ],
    );
  }
}
