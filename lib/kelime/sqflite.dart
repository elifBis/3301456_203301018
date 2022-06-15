import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:my_project/const.dart';
import 'package:my_project/kelime/services/db_utils.dart';
import 'package:my_project/kelime/views/list_words.dart';
import 'package:my_project/pages/home_page.dart';
import 'package:sqflite/sqflite.dart';
import 'database/word.dart';

DbUtils utils = DbUtils();

class WordsPage extends StatelessWidget {
  const WordsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WordsPageInd(),
    );
  }
}

class WordsPageInd extends StatefulWidget {
  const WordsPageInd({Key? key}) : super(key: key);

  @override
  _WordsPageIndState createState() => _WordsPageIndState();
}

class _WordsPageIndState extends State<WordsPageInd> {
  TextEditingController wordIdController = TextEditingController();
  TextEditingController wordWordController = TextEditingController();
  TextEditingController wordCorrespondController = TextEditingController();
  TextEditingController wordCountryController = TextEditingController();

  late Future<Database> database;

  List<Word> wordList = [];

  _onPressedUpdate() async {
    final kelime = Word(
      id: int.parse(wordIdController.text),
      word: wordWordController.text,
      correspond: wordCorrespondController.text,
      country: wordCorrespondController.text,
    );
    utils.updateWord(kelime);
    wordList = await utils.words();
    //print(dogList);
    getData();
  }

  _onPressedAdd() async {
    final kelime = Word(
      id: int.parse(wordIdController.text),
      word: wordWordController.text,
      correspond: wordCorrespondController.text,
      country: wordCorrespondController.text,
    );
    utils.insertWord(kelime);
    wordList = await utils.words();
    //print(dogList);
    getData();
  }

  _onPressedDelete() async {
    utils.deleteWord(int.parse(wordIdController.text));
    wordList = await utils.words();
  }

  _deleteWordTable() {
    utils.deleteTable();
    wordList = [];
    getData();
  }

  void getData() async {
    await utils.words().then((result) => {
          setState(() {
            wordList = result;
          })
        });
    print(wordList);
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  void didChangeAppLifecycleState(AppLifecycleState state) {
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: c,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            title: Center(child: const Text("Kelime Defteri"))),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25), color: a),
                      height: 500,
                      width: 400,
                      margin: EdgeInsets.all(10),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25), color: b),
                      height: 300,
                      width: 400,
                      margin: EdgeInsets.all(20),
                    ),
                    Positioned(
                      top: 40,
                      left: 60,
                      child: Image.asset(
                        'assets/images/girl.png',
                        scale: 1,
                      ),
                    ),
                    Positioned(
                      top: 40,
                      right: 40,
                      child: SizedBox(
                        child: TextFormField(
                          textAlign: TextAlign.end,
                          controller: wordIdController,
                          decoration: InputDecoration(
                              fillColor: Colors.amber,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              labelText: 'ID'),
                        ),
                        width: 100,
                      ),
                    ),
                    Positioned(
                      top: 110,
                      right: 40,
                      child: SizedBox(
                        child: TextFormField(
                          textAlign: TextAlign.end,
                          controller: wordWordController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              labelText: 'Kelime'),
                        ),
                        width: 150,
                      ),
                    ),
                    Positioned(
                      top: 180,
                      right: 40,
                      child: SizedBox(
                        child: TextFormField(
                          textAlign: TextAlign.end,
                          controller: wordCorrespondController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              labelText: 'Türkçe karşılığı'),
                        ),
                        width: 150,
                      ),
                    ),
                    Positioned(
                      top: 250,
                      right: 40,
                      child: SizedBox(
                        child: TextFormField(
                          textAlign: TextAlign.end,
                          controller: wordCountryController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              labelText: 'Dil'),
                        ),
                        width: 100,
                      ),
                    ),
                    Positioned(
                      top: 270,
                      right: 150,
                      child: FloatingActionButton.large(
                          backgroundColor: d,
                          onPressed: _onPressedAdd,
                          child: Icon(Icons.add)),
                    ),
                    Positioned(
                      right: 30,
                      bottom: 140,
                      child: ElevatedButton(
                        onPressed: _onPressedUpdate,
                        child: Text("Değiştir"),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(d),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 30,
                      bottom: 90,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(d),
                          ),
                          onPressed: _deleteWordTable,
                          child: const Text("Tabloyu sil")),
                    ),
                    Positioned(
                      right: 30,
                      bottom: 40,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(d),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ListWords()),
                            );
                          },
                          child: Text("Listeyi gör")),
                    ),
                  ],
                ),
              ),
              Text(wordList.length.toString() + " kelime listelendi."),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: wordList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(wordList[index].word),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
