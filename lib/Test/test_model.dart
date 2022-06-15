
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_project/Test/question_model.dart';
import 'package:my_project/Test/sonuc_ekrani.dart';

import 'degiskenler.dart';

class TestModel extends StatefulWidget {
List<QuestionModel> question;
TestModel({required this.question});
  @override
  State<TestModel> createState() => _TestModelState();
}

class _TestModelState extends State<TestModel> {
  PageController? _controller = PageController(initialPage: 0);
  bool isPressed = false;
  Color isTrue = Colors.green;
  Color isWrong = Colors.red;
  Color btnColor = Colors.brown.shade200;
  int score = 0 ;

  void showSnackBar( BuildContext context, Color color, String bilgi){
    final snackBar = SnackBar(content :
     Text(bilgi),
    backgroundColor: color,
        duration: const Duration(seconds: 1));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.teal.shade100,
          body: Padding(
            padding: EdgeInsets.all(18.0),
            child: PageView.builder(
              physics: NeverScrollableScrollPhysics(),
              controller:_controller!,
              onPageChanged:(page){
                setState(() {
                  isPressed = false;
                });
              } ,
              itemCount: widget.question.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Text('Soru ${index + 1}/${widget.question.length}',
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 33.0,
                          fontWeight: FontWeight.w500,
                        )),
                    Padding(padding: EdgeInsets.all(18.0)),
                    Text(widget.question[index].question!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.blueGrey.shade400,
                        fontSize: 35.0,
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(10.0)),
                    const Divider(
                      color: Colors.brown,
                      thickness: 1.0,
                    ),
                    Padding(padding: EdgeInsets.all(10.0)),
                    for (int i = 0; i < widget.question[index].answer!.length; i++)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MaterialButton(
                          shape: StadiumBorder(),
                          minWidth: 30,
                          height: 76,
                          color: isPressed? widget.question[index].answer!.entries.toList()[i].value
                              ?isTrue
                              :isWrong
                              : btnColor,
                          splashColor: Colors.brown,
                          onPressed: () {
                            setState(() {
                              isPressed = true;
                            });
                            if (widget.question[index].answer!.entries.toList()[i].value){
                              score+=20;
                              showSnackBar(context, bground9, 'Doğru!');
                            }
                            else {showSnackBar(context, bground10, 'Yanlış!');}
                          },
                          child: SizedBox(
                            width: 200,
                            child: Center(
                              child: Text(
                                widget.question[index].answer!.keys.toList()[i],
                                style: TextStyle(
                                    fontSize: 22, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    TextButton(
                      onPressed:
                      isPressed ?
                      index +1 == widget.question.length
                          ? () {Navigator.push(context, MaterialPageRoute(builder:(context)=> Sonuclar(score)));}
                          : () {_controller!.nextPage(duration :Duration(milliseconds: 300),curve : Curves.linear);}
                                : null,
                      child: Text(
                        index + 1 == widget.question.length
                        ? 'Sonuçlar'
                        : 'Sonraki Soru',
                        style: TextStyle(fontSize: 15, color: Colors.blueGrey),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
