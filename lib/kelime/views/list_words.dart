import "package:flutter/material.dart";
import 'package:my_project/const.dart';
import '../database/word.dart';
import '../services/db_utils.dart';
import '../sqflite.dart';

DbUtils utils = DbUtils();

class ListWords extends StatefulWidget {
  @override
  _ListWordsState createState() => _ListWordsState();
}

class _ListWordsState extends State<ListWords> {
  List<Word> wordList = [];
  void getData() async {
    await utils.words().then((result) => {
      setState(() {
        wordList = result;
      })
    });
    print(wordList);
  }

  void showAlert(String alertTitle, String alertContent) {
    AlertDialog alertDialog;
    alertDialog =
        AlertDialog(title: Text(alertTitle), content: Text(alertContent));
    showDialog(context: context, builder: (_) => alertDialog);
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: c,
          title: Text(wordList.length.toString() + " kelime listelendi.",
      )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: wordList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color:a,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 75,
                          width: 100,
                          child: Center(
                            child: Text(
                                wordList[index].word+
                                '  ->  ' +
                                wordList[index].correspond),
                          ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton(
                backgroundColor: d,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WordsPageInd()),
                    );
                  },
                child: Icon(Icons.reply,),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}