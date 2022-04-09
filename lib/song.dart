import 'package:flutter/material.dart';
import 'songlist.dart';

class SongList extends StatefulWidget {
  final int albumIndex;
  final VoidCallback backToAlbumMenu;
  Color colorAlbum;

  SongList(this.albumIndex, this.backToAlbumMenu, this.colorAlbum);

  @override
  _SongListState createState() => _SongListState();
}

class _SongListState extends State<SongList> {
  int songindex = 0;
  String lyrics = '';
  String songName = '';
  void getLyrics(String fullLyrics, String nameSong) {
    setState(() {
      songindex = 1;
      lyrics = fullLyrics;
      songName = nameSong;
    });
    print('lyrics copied');
  }

  void songMenu() {
    setState(() {
      songindex = 0;
      lyrics = '';
    });
    print('back to song menu');
  }

  @override
  Widget build(BuildContext context) {
    return songindex == 0
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ...(discography[widget.albumIndex] as List).map((songName) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: widget.colorAlbum.withOpacity(0.4),
                    onPrimary: Colors.white,
                  ),
                  child: Text(songName['name'], style: TextStyle(fontFamily: 'folklore', fontSize: 20),),
                  onPressed: () => getLyrics(songName['lyrics'], songName['name']),
                );
              }).toList(),
              /* ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueGrey.withOpacity(0.4),
                  onPrimary: Colors.white,
                ),
                child: Text('Album Menu',
                style: TextStyle(fontFamily: 'folklore', fontSize: 25),),
                onPressed: widget.backToAlbumMenu,
              ), */
            ],
          )
        : Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(songName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontFamily: 'Taylor',
                )),
              Text(""),
              Text(
                lyrics,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Taylor',
                  fontSize: 20,
                  ),
              ),
              Text(""),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueGrey.withOpacity(0.4),
                  onPrimary: Colors.white,
                ),
                child: Text('Song Menu',
                style: TextStyle(fontFamily: 'folklore', fontSize: 25),),
                onPressed: songMenu,
              ),
            ],
          );
  }
}
