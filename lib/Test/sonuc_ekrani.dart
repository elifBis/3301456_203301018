import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Sonuclar extends StatefulWidget {
  final int score;
  const Sonuclar(this.score, {Key? key}) : super(key: key);

  @override
  State<Sonuclar> createState() => _SonuclarState();
}

class _SonuclarState extends State<Sonuclar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 70),
            Text(
              'Sonuçların;',
              style: TextStyle(fontSize: 33, color: Colors.white),
            ),
            Text(
              '${widget.score}',
              style: TextStyle(fontSize: 33, color: Colors.white),
            ),
            Container(
              child: Image(image: AssetImage('assets/images/space2.png'),
              height: 300,
                width: 300,
            ),
            )
          ],
        ),
      ),
    );
  }
}
