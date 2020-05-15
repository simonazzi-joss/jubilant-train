import 'package:flutter/material.dart';

class TestAnimations extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AnimationTestState();
}

class AnimationTestState extends State<TestAnimations> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation _anim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: Duration(seconds: 5), vsync: this);
    _anim = Tween(begin: 0.2, end: 0.8).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });
    return ;
  }

  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    _controller.forward();

    return Scaffold(
      body: AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, Widget child) {
          return Transform(
            transform: Matrix4.translationValues(_anim.value * width, _anim.value * height, 0),
            child: AnimatedContainer(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    pressed =! pressed;
                  });
                },
              ),
              width: pressed ? 100 : 300,
              height: pressed ? 100 : 300,
              color: Colors.blue[100], duration: Duration(seconds: 2),
            )
          );
        },
      ),
    );
  }
}
