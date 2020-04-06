import 'package:restapi/models/picture-list.dart';

class PictureServices {
  List<PictureList> getPictureList() {
    return [
      PictureList(
          pictureId: '1',
          pictureDate: DateTime.now(),
          pictureImage: 'assets/images/AlNataliia.jpg',
          pictureTitle: 'Göteborg'),
      PictureList(
          pictureId: '2',
          pictureDate: DateTime.now(),
          pictureImage: 'assets/images/AlNataliia.jpg',
          pictureTitle: 'Stockholm'),
      PictureList(
          pictureId: '3',
          pictureDate: DateTime.now(),
          pictureImage: 'assets/images/AlNataliia.jpg',
          pictureTitle: 'Helsinborg'),
      PictureList(
          pictureId: '4',
          pictureDate: DateTime.now(),
          pictureImage: 'assets/images/AlNataliia.jpg',
          pictureTitle: 'Värnamo'),
      PictureList(
          pictureId: '5',
          pictureDate: DateTime.now(),
          pictureImage: 'assets/images/AlNataliia.jpg',
          pictureTitle: 'Barselona'),
      PictureList(
          pictureId: '6',
          pictureDate: DateTime.now(),
          pictureImage: 'assets/images/AlNataliia.jpg',
          pictureTitle: 'Gran Canaria')
    ];
  }
}
