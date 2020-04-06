import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:restapi/models/picture-list.dart';
import 'package:restapi/services/picture-service.dart';
import 'package:restapi/styleguide/colors.dart';
import 'package:restapi/styleguide/text_style.dart';
import 'package:restapi/views/album-list-modify.dart';
import 'package:restapi/views/alert-delete-album.dart';

class AlbumList extends StatefulWidget {
  @override
  _AlbumListState createState() => _AlbumListState();
}

class _AlbumListState extends State<AlbumList> {
  PictureServices get service => GetIt.I<PictureServices>();

  List<PictureList> pictures = [];

  String formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  @override
  void initState() {
    pictures = service.getPictureList().cast<PictureList>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Picture List'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push<Object>(
            MaterialPageRoute<dynamic>(
              builder: (_) => AlbumListModify(),
            ),
          );
        },
        child: Icon(Icons.favorite_border),
        backgroundColor: Colors.amberAccent,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [const Color(0xffd50000), const Color(0xff0d47a1)],
          ),
        ),
        child: ListView.separated(
          separatorBuilder: (_, __) => Divider(
            height: 5,
            color: primaryColor,
          ),
          itemBuilder: (_, int index) {
            return Dismissible(
              key: ValueKey<String>(
                pictures[index].pictureId,
              ),
              onDismissed: (DismissDirection direction) {},
              confirmDismiss: (DismissDirection direction) async {
                final dynamic result = await showDialog<dynamic>(
                  context: context,
                  builder: (_) => AlertDeleteAlbum(),
                );
                print(result);
                return result;
              },
              direction: DismissDirection.startToEnd,
              background: Container(
                color: Colors.red,
                padding: const EdgeInsets.only(left: 10),
                child: Align(
                  child: Icon(Icons.delete, color: Colors.white),
                  alignment: Alignment.centerLeft,
                ),
              ),
              child: ListTile(
                leading: ClipOval(
                  child: Image.asset(
                    pictures[index].pictureImage,
                    width: 50,
                    height: 50,
                  ),
                ),
                title: Text(
                  pictures[index].pictureTitle,
                  style: whiteNameTextStyle.copyWith(color: Colors.amber),
                ),
                onTap: () {
                  Navigator.of(context).push<Object>(
                    MaterialPageRoute<dynamic>(
                      builder: (_) => AlbumListModify(
                        pictureId: pictures[index].pictureId,
                      ),
                    ),
                  );
                },
                subtitle: Text(
                  'Last changing is ${formatDateTime(pictures[index].pictureDate)}',
                  style: whiteSubHeadingTextStyle,
                ),
              ),
            );
          },
          itemCount: pictures.length,
        ),
      ),
    );
  }
}
