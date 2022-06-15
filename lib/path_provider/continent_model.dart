import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../const.dart';

class ContModel extends StatefulWidget {
  final String continent;
  const ContModel({required this.continent, Key? key}) : super(key: key);

  @override
  State<ContModel> createState() => _ContModelState();
}

class _ContModelState extends State<ContModel> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(3),
      child: Container(
            height:150,
            width:150,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(25)
                ),

                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(widget.continent, textAlign: TextAlign.center,
                  style: TextStyle(fontSize:20, fontWeight: FontWeight.bold, color: g),),
                ),
              ),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/continents/${widget.continent}.png',
                ),
              ),
              shape: BoxShape.circle
            ),
          ),
    );
  }
}
