import 'dart:ui';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import '../Test/degiskenler.dart';

class MerhabaModel extends StatefulWidget {
  final String child;
  final String audio;
  final String image;
  MerhabaModel({required this.child, required this.audio, required this.image});

  @override
  State<MerhabaModel> createState() => _MerhabaModelState();
}

class _MerhabaModelState extends State<MerhabaModel> {
  final player = AudioCache();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: TextButton(
        onPressed: (){
          player.play(widget.audio);
        },
        child:Container(
          height: 150,
          width:800,
          decoration: BoxDecoration(
            color: bground2,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Row(crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Image(
                image: AssetImage(widget.image),
                alignment: Alignment.centerLeft,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(widget.child.toUpperCase(),
                textAlign: TextAlign.right,
                style: TextStyle(
                    color: bground1,
                    fontSize:30
                ),
              ),
            ),
          ],),
        ),
      ),
    );
  }
}
