import 'package:coolapp/screens/bimbyApp.dart';
import 'package:flutter/widgets.dart';

import 'containerBimby.dart';

class TopStatusBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return ContainerBimby(
      margin: 0,
      child: Row(
        children: <Widget>[
          Container(
            height: 25,
            child: GestureDetector(
              onTap: () => Navigator.maybePop(context),
              child: Image(
                image: AssetImage('images/bimby.png'),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                "HOME",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ),
          Container(
            child: Text(
              BimbyFontIcons.Acccount,
              style: TextStyle(fontSize: BimbyFontIcons.defaultSize),
            ),
          ),
          Container(
            child: Text(
              BimbyFontIcons.Menu,
              style: TextStyle(fontSize: BimbyFontIcons.defaultSize),
            ),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
