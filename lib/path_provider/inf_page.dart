import 'package:flutter/material.dart';
import '../path_provider/pdfViewerPage.dart';
import 'continent_model.dart';

class InfPage extends StatefulWidget {
  const InfPage({Key? key}) : super(key: key);

  @override
  State<InfPage> createState() => _InfPageState();
}

class _InfPageState extends State<InfPage> {
  final List _continents = [
    'Asya',
    'Avrupa',
    'Afrika',
    'Antarktika',
    'Kuzey_Amerika',
    'Guney_Amerika',
    'Avustralya',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/bground.jpg"),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _continents.length,
                itemBuilder: (context, index) {
                  return ContModel(
                    continent: _continents[index],
                  );
                },
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PdfViewerPage(
                        pdfYol: 'https://www.mapsofworld.com/world-map.pdf'),
                  ),
                );
              },
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/images/map.png',
                    scale: 5,
                  )),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PdfViewerPage(
                            pdfYol:
                                'https://www.north-tmet.uk/wp-content/uploads/2020/03/WK1-Countries-and-capitals.pdf')));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(25)),
                  height: 100,
                  width: 100,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assets/images/hand.png'),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
