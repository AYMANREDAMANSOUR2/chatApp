import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:animations/animations.dart';
import 'package:chat/UI/base%20Pages/login/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen3 extends StatefulWidget {
  static const String routeName = "splash" ;
  const SplashScreen3({Key? key}) : super(key: key);

  @override
  _SplashScreen3State createState() => _SplashScreen3State();
}

class _SplashScreen3State extends State<SplashScreen3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.cyan,
        centerTitle: true,
        title: Text("Chat app", style: TextStyle(color: Colors.white , fontSize: 30),),      ),
      backgroundColor: Colors.transparent,
      body: Center(
        child: Center(
          child: OpenContainer(
            closedBuilder: (_, openContainer) {
              return const SizedBox(
                height: 60,
                width: 220,
                child: Center(
                  child: Text(
                    'Welcome , Click to Continue ',
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            },
            openColor: Colors.white,
            closedElevation: 20,
            closedShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            transitionDuration: const Duration(milliseconds: 700),
            openBuilder: (_, closeContainer) {
              return const SplashScreen3Sub();
            },
          ),
        ),
      ),
    );
  }
}
class SplashScreen3Sub extends StatefulWidget {
  const SplashScreen3Sub({Key? key}) : super(key: key);

  @override
  _SplashScreen3SubState createState() => _SplashScreen3SubState();
}

class _SplashScreen3SubState extends State<SplashScreen3Sub> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 400), () {
      setState(() {
        _a = true;
      });
    });
    Timer(const Duration(milliseconds: 400), () {
      setState(() {
        _b = true;
      });
    });
    Timer(const Duration(milliseconds: 1300), () {
      setState(() {
        _c = true;
      });
    });
    Timer(const Duration(milliseconds: 1700), () {
      setState(() {
        _e = true;
      });
    });
    Timer(const Duration(milliseconds: 3400), () {
      setState(() {
        _d = true;
      });
    });
    Timer(const Duration(milliseconds: 3850), () {
      setState(() {
        Navigator.of(context).pushReplacement(
          ThisIsFadeRoute(
            route:  LoginScreen(),  /////////////////////////////////
            page:  LoginScreen(),
          ),
        );
      });
    });
  }
  bool _a = false;
  bool _b = false;
  bool _c = false;
  bool _d = false;
  bool _e = false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _h = MediaQuery.of(context).size.height;
    double _w = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
              children: [
          AnimatedContainer(
          duration: Duration(milliseconds: _d ? 900 : 2500),
          curve: _d ? Curves.fastLinearToSlowEaseIn : Curves.elasticOut,
          height: _d
              ? 0
              : _a
              ? _h / 2
              : 20,
          width: 20,
          // color: Colors.deepPurpleAccent,
        ),
        AnimatedContainer(
        duration: Duration(
        seconds: _d
        ? 1
            : _c
        ? 2
        : 0),
    curve: Curves.fastLinearToSlowEaseIn,
    height: _d
    ? _h
    : _c
    ? 80
    : 20,
          width: _d
              ? _w
              : _c
              ? 200
              : 20,
          decoration: BoxDecoration(
              color: _b ? Colors.white : Colors.transparent,
              // shape: _c? BoxShape.rectangle : BoxShape.circle,
              borderRadius:
              _d ? const BorderRadius.only() : BorderRadius.circular(30)),
          child: Center(
            child: _e
                ? AnimatedTextKit(
              totalRepeatCount: 1,
              animatedTexts: [
                FadeAnimatedText(
                  ' ayman reda ',
                  duration: const Duration(milliseconds: 1800),
                  textStyle: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),

              ],
            )
                : const SizedBox(),
          ),
        ),
              ],
          ),
        ),
    );
  }
}
class ThisIsFadeRoute extends PageRouteBuilder {
  final Widget page;
  final Widget route;

  ThisIsFadeRoute({required this.page, required this.route})
      : super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    page,
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        FadeTransition(
          opacity: animation,
          child: route,
        ),
  );
}

