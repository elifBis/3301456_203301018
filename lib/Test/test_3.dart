import 'package:flutter/material.dart';
import 'package:my_project/Test/question_list.dart';
import 'package:my_project/Test/test_model.dart';

class Test3 extends StatefulWidget {
  const Test3({Key? key}) : super(key: key);

  @override
  State<Test3> createState() => _Test3State();
}

class _Test3State extends State<Test3> {
  @override
  Widget build(BuildContext context) {
    return TestModel(question: questions3);
  }
}
