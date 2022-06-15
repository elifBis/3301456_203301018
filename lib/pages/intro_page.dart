
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_project/const.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/map1.jpg"), fit: BoxFit.cover)
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      height: 100,
                      child: Center(
                        child: Text('Ülkeleri görmek için uzun bas, başkentleri görmek için çift tıkla',
                style: GoogleFonts.ptSansNarrow(
                    textStyle: TextStyle(color: d, fontSize: 30, fontWeight: FontWeight.bold),),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GridView.extent(
                      primary: false,
                      padding: const EdgeInsets.all(10),
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      maxCrossAxisExtent: 150,
                      children: <Widget>[
                        GestCard(country: 'Fransa', capital: 'Paris', continent: 'Avrupa'),
                        GestCard(country: 'Almanya', capital: 'Berlin',continent: 'Avrupa'),
                        GestCard(country: 'Türkiye', capital: 'Ankara', continent: 'Asya'),
                        GestCard(country: 'Çin', capital: 'Pekin', continent: 'Asya'),
                        GestCard(country: 'Güney Kore', capital: 'Seul', continent: 'Asya'),
                        GestCard(country: 'ABD', capital: 'NewYork', continent: 'Kuzey Amerika'),
                        GestCard(country: 'İngiltere', capital: 'Londra',continent: 'Avrupa'),
                        GestCard(country: 'İran', capital: 'Tahran', continent: 'Afrika'),
                        GestCard(country: 'İtalya', capital: 'Roma',continent: 'Avrupa'),
                        GestCard(country: 'Yunanistan', capital: 'Atina',continent: 'Avrupa'),
                        GestCard(country: 'Japonya', capital: 'Tokyo', continent: 'Asya'),
                        GestCard(country: 'Rusya', capital: 'Moskova', continent: 'Asya'),
                      ],
                    ),
                  ),
                ],
              )),
            )
          ),
        );
  }
}


class GestCard extends StatefulWidget {
  final String country ;
  final String capital ;
  final String continent;
  const GestCard({Key? key, required this.country, required this.capital,required this.continent}) : super(key: key);

  @override
  State<GestCard> createState() => _GestCardState();
}

class _GestCardState extends State<GestCard> {
  String text= '?';
  String space = '';
  Color color = Colors.amber;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> setState(()=> text = '?'),
      onDoubleTap: ()=> setState(()=> text = widget.capital),
      onLongPress: ()=> setState(()=> text = widget.country),
      onHorizontalDragStart: (DragStartDetails details) {
        setState(() {
          color = Colors.amber;
        });
      },
      onHorizontalDragEnd: (DragEndDetails details) {
        setState(() {
          text = widget.continent;
        });
      },
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            child: Center(child: Text(text, style: TextStyle(fontSize: 20),)),
            color: c,
            height: 120,
            width: 120,
          ),
        ],
      ),
    );
  }
}
