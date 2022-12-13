import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogoEvon extends StatelessWidget {
  const LogoEvon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: 90,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blue.shade300, Colors.blue.shade900]),
          shape: BoxShape.circle),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Positioned(
            right: 30,
            child: Icon(Icons.location_on, size: 60, color: Colors.white),
          ),
          Positioned(
            left: 30,
            child: Icon(Icons.location_on, size: 60, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class GradientBlueButton extends StatelessWidget {
  Function onPress;
  String text;

  GradientBlueButton({super.key, required this.onPress, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50.0,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.blue.shade400, Colors.blue.shade900])),
      child: ElevatedButton(
        onPressed: () {
          onPress();
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

