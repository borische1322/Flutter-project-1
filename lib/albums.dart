import 'package:flutter/material.dart';
import 'image_banner.dart';

class Albums extends StatelessWidget {
  final String albumName;
  final String imagePath;
  final VoidCallback selectAlbum;
  Color colorAlbum;

  Albums(this.colorAlbum, this.albumName, this.imagePath, this.selectAlbum);
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      ImageBanner(imagePath),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: colorAlbum.withOpacity(0.4),
          onPrimary: Colors.white,
        ),
        child: Text(albumName,
        style: TextStyle(fontFamily: 'folklore', fontSize: 25),),
        onPressed: selectAlbum,
      )
    ]);
  }
}
