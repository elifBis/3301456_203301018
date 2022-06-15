import 'package:flutter/material.dart';
import 'package:my_project/Test/question_list.dart';
import 'package:my_project/Test/sonuc_ekrani.dart';

class Test2 extends StatefulWidget {
  const Test2({Key? key}) : super(key: key);

  @override
  State<Test2> createState() => _Test2State();
}

class _Test2State extends State<Test2> {
  PageController? _controller = PageController(initialPage: 0);
  bool isPressed = false;
  Color isTrue = Colors.green;
  Color isWrong = Colors.red;
  Color btnColor = Colors.brown.shade200;
  int score = 0 ;
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
              itemCount: questions2.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Text('Soru ${index + 1}/${questions2.length}',
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 33.0,
                          fontWeight: FontWeight.w500,
                        )),
                    Padding(padding: EdgeInsets.all(18.0)),
                    Image.asset(questions2[index].flag!,
                    scale:4,),
                    Padding(padding: EdgeInsets.all(10.0)),
                    const Divider(
                      color: Colors.brown,
                      thickness: 1.0,
                    ),
                    Padding(padding: EdgeInsets.all(10.0)),
                    for (int i = 0; i < questions2[index].answer!.length; i++)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MaterialButton(
                          shape: StadiumBorder(),
                          minWidth: 30,
                          height: 76,
                          color: isPressed? questions2[index].answer!.entries.toList()[i].value
                              ?isTrue
                              :isWrong
                              : btnColor,
                          splashColor: Colors.brown,
                          onPressed: () {
                            setState(() {
                              isPressed = true;
                            });
                            if (questions2[index].answer!.entries.toList()[i].value){
                              score+=20;
                            }
                          },
                          child: SizedBox(
                            width: 200,
                            child: Center(
                              child: Text(
                                questions2[index].answer!.keys.toList()[i],
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
                      index +1 == questions2.length
                          ? () {Navigator.push(context, MaterialPageRoute(builder:(context)=> Sonuclar(score)));}
                          : () {_controller!.nextPage(duration :Duration(milliseconds: 300),curve : Curves.linear);}
                          : null,
                      child: Text(
                        index + 1 == questions2.length
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
