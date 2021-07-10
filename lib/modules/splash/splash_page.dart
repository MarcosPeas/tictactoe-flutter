import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _gotoMainPage();
  }

  Future _gotoMainPage() async {
    await Future.delayed(Duration(milliseconds: 3000));
    Modular.to.pushReplacementNamed('/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Tic Tac Toe',
                style: TextStyle(fontSize: 36, color: Colors.white, fontWeight: FontWeight.w600),
              ),
              Text(
                'Flutter',
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
