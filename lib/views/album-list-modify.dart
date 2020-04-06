import 'package:flutter/material.dart';
import 'package:restapi/styleguide/colors.dart';

class AlbumListModify extends StatelessWidget {
  final String pictureId;
  bool get isEdit => pictureId != null;

  const AlbumListModify({Key key, this.pictureId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(isEdit ? 'Add to Album' : 'Create Album')),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: 'title',
              ),
            ),
            TextField(
              decoration: InputDecoration(hintText: 'subtile'),
            ),
            SizedBox(
              height: 16,
            ),
            SizedBox(
              width: double.infinity,
              child: RaisedButton(
                child: Text(
                  'Submit',
                  style: TextStyle(color: primaryColor),
                ),
                color: Theme.of(context).accentColor,
                onPressed: () {
                  // if (isEdit) {
                  //   // add picture to album (API)
                  // } else {
                  //   // create new Album (API)
                  // }
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
