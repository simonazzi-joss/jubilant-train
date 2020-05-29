import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BottomStatusBar extends StatefulWidget {
  static const double bottomBarCloseHeight = 40;
  static const double bottomBarOpenedHeight = 80;

  BottomStatusBar({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BottomStatusBarState();
}

class _BottomStatusBarState extends State<BottomStatusBar>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation _anim;
  double bottomBarHeigts = BottomStatusBar.bottomBarCloseHeight;

  bool get isOpen => bottomBarHeigts != BottomStatusBar.bottomBarCloseHeight;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(seconds: 5), vsync: this);
    _anim = Tween(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      height: bottomBarHeigts,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: AnimatedBuilder(
          animation: _anim, // controller
          builder: (BuildContext context, Widget child) {
            double targethH = bottomBarHeigts;
            // isOpen ? BottomStatusBar.bottomBarCloseHeight : BottomStatusBar.bottomBarOpenedHeight;

            return Transform(
              transform:
                  Matrix4.translationValues(0, _anim.value * targethH, 0),
              child: AnimatedContainer(
                duration: Duration(seconds: 2),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      bottomBarHeigts = isOpen
                          ? BottomStatusBar.bottomBarCloseHeight
                          : BottomStatusBar.bottomBarOpenedHeight;
                    });
                  },
                  child: ListView(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text('Joss'),
                          Expanded(
                            child: Container(),
                          ),
                          Text('Apri Footer'),
                          Icon(
                            bottomBarHeigts !=
                                    BottomStatusBar.bottomBarCloseHeight
                                ? Icons.keyboard_arrow_down
                                : Icons.keyboard_arrow_up,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
