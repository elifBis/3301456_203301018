import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_project/kelime/sqflite.dart';
import 'package:my_project/pages/users_list_page.dart';
import 'package:my_project/path_provider/inf_page.dart';
import 'package:my_project/weather/weather.dart';
import '../Test/testsecimekrani.dart';
import '../const.dart';
import '../merhabalar/merhaba.dart';
import 'intro_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int index = 2;
  final screens = [
    Merhaba(),
    TestSecimEkrani(),
    InfPage(),
    IntroPage(),
    Weather(),
  ];
  final items=<Widget>[
    Icon(Icons.record_voice_over, size:30),
    Icon(Icons.done, size:30),
    Icon(Icons.home, size:30),
    Icon(Icons.touch_app, size:30),
    Icon(Icons.cloud, size:30),
  ];
  final user = FirebaseAuth.instance.currentUser!;
  // document IDs
  List<String> docIDs = [];

  // get docIDs
  Future getDocID() async {
    await FirebaseFirestore.instance.collection('users').get().then(
          (snapshot) => snapshot.docs.forEach((document) {
            print(document.reference);
            docIDs.add(document.reference.id);
          }),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        appBar: AppBar(
          backgroundColor: c,
          title: Center(
            child: Text(
              user.email!,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15),
            ),
          ),
        ),
        drawer: Container(
          width: 230,
          child: Drawer(
            child: Container(
              color: c,
              child: ListView(
                children: [
                  DrawerHeader(
                    child: Column(
                      children: [
                        Icon(
                          Icons.person,
                          size: 60,
                        ),
                        SizedBox(height: 10),
                        Text('H o ş g e l d i n !',
                            style: TextStyle(fontSize: 20)),
                        SizedBox(height: 5),
                        Text(user.email!)
                      ],
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.people_outline),
                    title: Text('Kullanıcılar', style: TextStyle(fontSize: 17)),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => UsersListPage()));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.event_note),
                    title:
                        Text('Kelime Defteri', style: TextStyle(fontSize: 17)),
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => WordsPage()));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.logout),
                    title: Text('Çıkış Yap', style: TextStyle(fontSize: 17)),
                    onTap: () {
                      FirebaseAuth.instance.signOut();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        body: screens[index],
        bottomNavigationBar: CurvedNavigationBar(
        key: navigationKey,
        buttonBackgroundColor: a,
        backgroundColor: Colors.transparent,
        items: items,
        height: 60,
        index : index,
        onTap: (index) => setState(()=> this.index = index),
      ) ,
    );
  }
}
