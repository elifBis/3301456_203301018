import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import '../Test/degiskenler.dart';
import 'merhaba_model.dart';


class Merhaba extends StatefulWidget {
  const Merhaba({Key? key}) : super(key: key);

  @override
  State<Merhaba> createState() => _MerhabaState();
}

class _MerhabaState extends State<Merhaba> {
  final player = AudioCache();
  final List _countries =[
    'russian',
    'chinese',
    'hawaii',
    'japanese',
    'korean',
    'french',
    'english',
    'italian'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bground1,
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _countries.length,
                itemBuilder: (context, index) {
                   return MerhabaModel(
                     child: _countries[index],
                     audio: 'merhabalar/'+_countries[index]+'.mp3',
                     image: 'assets/flags/'+_countries[index]+'.png'
                   );
                },
              ),
            ),
          ],
        ),
      );

  }
}
