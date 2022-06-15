
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:my_project/pages/home_page.dart';
import '../const.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _coffeeController;
  bool copAnimated = false;
  bool animateCafeText = false;

  @override
  void initState() {
    super.initState();
    _coffeeController = AnimationController(vsync: this);
    _coffeeController.addListener(() {
      if (_coffeeController.value > 0.7) {
        _coffeeController.stop();
        copAnimated = true;
        setState(() {});
        Future.delayed(const Duration(seconds: 1), () {
          animateCafeText = true;
          setState(() {});
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _coffeeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: a,
      body: Stack(
        children: [
          // White Container top half
          SingleChildScrollView(
            child: AnimatedContainer(
              duration: const Duration(seconds: 1),
              height: copAnimated ? screenHeight / 2 : screenHeight,
              decoration: BoxDecoration(
                color: d,
                borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(copAnimated ? 40.0 : 0.0)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Visibility(
                    visible: !copAnimated,
                    child: Lottie.network(
                      'https://assets9.lottiefiles.com/packages/lf20_z2sbj8cm.json',
                      controller: _coffeeController,
                      onLoaded: (composition) {
                        _coffeeController
                          ..duration = composition.duration
                          ..forward();
                      },
                    ),
                  ),
                  Visibility(
                    visible: copAnimated,
                    child: Image.asset(
                      'assets/images/world3.png',
                      height: 190.0,
                      width: 190.0,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: AnimatedOpacity(
                      opacity: animateCafeText ? 1 : 0,
                      duration: const Duration(seconds: 1),
                      child: Text(
                        'M E R H A B A !',
                        style: GoogleFonts.staatliches(
                          textStyle: TextStyle(color: Colors.white, fontSize: 65),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Text bottom part
          Visibility(visible: copAnimated, child: const _BottomPart()),
        ],
      ),
    );
  }
}

class _BottomPart extends StatelessWidget {
  const _BottomPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Ülkeleri Tanıma Uygulamasına Hoşgeldin !',
              textAlign: TextAlign.center,
              style: GoogleFonts.ptSansNarrow(
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: d,
                  fontSize: 31.0
                ),
              ),
            ),
            const SizedBox(height: 30.0),
            Text('Başlamak için sağa kaydır!',
              style: TextStyle(
                fontSize: 18.0,
                color: d,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 30.0),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onHorizontalDragStart: (DragStartDetails details){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: Container(
                  height: 75.0,
                  width: 200.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.white, width: 2.0),
                  ),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child:Icon(
                      Icons.chevron_right,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }
}