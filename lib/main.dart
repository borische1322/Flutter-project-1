import 'package:flutter/material.dart';

import 'albums.dart';

import 'song.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var displayLyrics = 0;
  var _albumselect = 0;
  var _albumlists = [
    ['Taylor Swift', 'assets/images/TS1.jpg', 1],
    ['Fearless', 'assets/images/TS2.jpg', 2],
    ['Speak Now', 'assets/images/TS3.jpg', 3],
    ['RED', 'assets/images/TS4.jpg', 4],
    ['1989', 'assets/images/TS5.jpg', 5],
    ['reputation', 'assets/images/TS6.jpg', 6],
    ['Lover', 'assets/images/TS7.jpg', 7],
    ['Folklore', 'assets/images/TS8.jpg', 8],
    ['Evermore', 'assets/images/TS9.jpg', 9],
  ];

  void _selectAlbum(int index) {
    setState(() {
      if (displayLyrics != 0) {
        displayLyrics = 0;
      } else {
        _albumselect = index;
      }
    });

    print(index);
  }

  Color _colorChange(int index) {
    if (index == 1) {
      return Colors.green[600]!;
    } else if (index == 2) {
      return Colors.yellow[700]!;
    } else if (index == 3) {
      return Colors.purple[600]!;
    } else if (index == 4) {
      return Colors.redAccent[400]!;
    } else if (index == 5) {
      return Colors.blueAccent[700]!;
    } else if (index == 6) {
      return Colors.black;
    } else if (index == 7) {
      return Colors.pink[200]!;
    } else if (index == 8) {
      return Colors.grey[600]!;
    } else if (index == 9) {
      return Colors.lightGreen[900]!;
    } else {
      return Colors.teal[300]!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.jpg"),
                fit: BoxFit.fitHeight,
              ),
            ),
            child: Scaffold(
                backgroundColor: Colors.transparent,
                //appBar: AppBar(
                //backgroundColor: _colorChange(_albumselect),
                //title: Text('Taylor Swift Discography Lyrics'),
                //),
                body: CustomScrollView(slivers: <Widget>[
                  SliverAppBar(
                      flexibleSpace: Stack(
                        children: <Widget>[
                          Positioned.fill(
                            child: Image.asset(
                                "assets/images/silverappbarbg.jpg",
                                fit: BoxFit.cover),
                          ),
                          Container(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              _albumselect == 0
                                  ? 'Taylor Swift Discography Lyrics'
                                  : _albumlists[_albumselect - 1][0] as String,
                              style: TextStyle(
                                height: 3,
                                leadingDistribution:
                                    TextLeadingDistribution.even,
                                fontFamily: 'folklore',
                                color: Colors.white,
                                fontSize: 25.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      backgroundColor: _colorChange(_albumselect),
                      floating: true,
                      expandedHeight: 200,
                      leading: _albumselect == 0
                          ? null
                          : IconButton(
                              onPressed: () => _selectAlbum(0),
                              icon: Icon(Icons.arrow_back))),
                  SliverList(
                      delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Container(
                          child: _albumselect == 0
                              ? Albums(
                                  _colorChange(index + 1),
                                  _albumlists[index][0] as String,
                                  _albumlists[index][1] as String,
                                  () => _selectAlbum(
                                      _albumlists[index][2] as int))
                              : SongList(_albumselect, () => _selectAlbum(0),
                                  _colorChange(_albumselect)));
                    },
                    childCount: _albumselect == 0 ? 9 : 1,
                  ))
                  // _albumselect == 0
                  //     ? ListView(
                  //         children: [
                  //           ..._albumlists.map((albums) {
                  //             return Albums(_colorChange(albums[2] as int),albums[0] as String, albums[1] as String,
                  //                 () => _selectAlbum(albums[2] as int));
                  //           }).toList()
                  //         ],
                  //       )
                  //     :SongList(_albumselect, () => _selectAlbum(0),_colorChange(_albumselect)),
                ]))));
  }
}
