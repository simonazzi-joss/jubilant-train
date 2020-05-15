import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Bimby extends StatefulWidget {
  Bimby({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _BimbyState createState() => _BimbyState();
}

class _BimbyState extends State<Bimby> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 32),
              child: OnSlideSimple(
                items: [
                  new ActionItemsSimple(
                      icon: new IconButton(
                        icon: new Icon(Icons.call),
                        onPressed: () {},
                        color: Colors.white,
                      ),
                      onPress: () {},
                      backgroudColor: Colors.green[500]),
                  new ActionItemsSimple(
                      icon: new IconButton(
                        icon: new Icon(Icons.email),
                        onPressed: () {},
                        color: Colors.white,
                      ),
                      onPress: () {},
                      backgroudColor: Colors.green[900])
                ],
                child: buildCard(),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildCard() => new Container(
        width: 300.0,
        height: 150.0,
        child: new Container(
          decoration: new BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.grey[200],
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[800],
                blurRadius: 5.0,
                // has the effect of softening the shadow
                spreadRadius: 2.0,
                // has the effect of extending the shadow
                offset: Offset(
                  2.0, // horizontal, move right 10
                  2.0, // vertical, move down 10
                ),
              )
            ],
            borderRadius: new BorderRadius.all(const Radius.circular(0.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              firstRow(),
              SizedBox(
                height: 10,
              ),
              Divider(
                height: 1,
                color: Colors.grey[500],
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  text("Ult.mod.", "TM5"),
                  Container(
                    width: 1,
                    height: 40,
                    color: Colors.grey[300],
                  ),
                  text("Ult.acquisto", "21.12.2020"),
                  Container(
                    width: 1,
                    height: 40,
                    color: Colors.grey[300],
                  ),
                  text("Tipo ult. cont.", "Demo")
                ],
              ),
              Expanded(
                child: Container(
                  color: Colors.grey[100],
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new Icon(
                        Icons.shopping_basket,
                        color: Colors.green[800],
                      ),
                      new Icon(
                        Icons.home,
                        color: Colors.grey[400],
                      ),
                      new Icon(
                        Icons.airport_shuttle,
                        color: Colors.green[800],
                      ),
                      new Icon(
                        Icons.airline_seat_flat,
                        color: Colors.green[800],
                      ),
                      new Icon(
                        Icons.perm_device_information,
                        color: Colors.grey[400],
                      ),
                      SizedBox(
                        width: 100,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Widget text(String up, String down) {
    return Column(
      children: <Widget>[
        Text(
          up,
          style: TextStyle(fontWeight: FontWeight.w200),
        ),
        Text(
          down,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  firstRow() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: new Row(
        children: <Widget>[
          new Icon(
            Icons.person_pin,
            color: Colors.green[800],
          ),
          SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Mario Rossi",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Text(
                "Via arcimabaldo 9000, 20137 Milano",
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
          Expanded(
            child: Container(),
          ),
          new Icon(
            Icons.content_paste,
            color: Colors.green[800],
          ),
        ],
      ),
    );
  }
}

typedef void SizeChangedCallBack(Size newSize);

class LayoutSizeChangeNotification extends LayoutChangedNotification {
  LayoutSizeChangeNotification(this.newSize) : super();
  Size newSize;
}

class LayoutSizeChangeNotifier extends SingleChildRenderObjectWidget {
  const LayoutSizeChangeNotifier({Key key, Widget child})
      : super(key: key, child: child);

  @override
  _SizeChangeRenderWithCallback createRenderObject(BuildContext context) {
    return new _SizeChangeRenderWithCallback(onLayoutChangedCallback: (size) {
      new LayoutSizeChangeNotification(size).dispatch(context);
    });
  }
}

class _SizeChangeRenderWithCallback extends RenderProxyBox {
  _SizeChangeRenderWithCallback(
      {RenderBox child, @required this.onLayoutChangedCallback})
      : assert(onLayoutChangedCallback != null),
        super(child);
  final SizeChangedCallBack onLayoutChangedCallback;

  Size _oldSize;

  @override
  void performLayout() {
    super.performLayout();
    if (size != _oldSize) onLayoutChangedCallback(size);
    _oldSize = size;
  }
}

const ITEMS_WIDTH = 60.0;

class ActionItemsSimple extends Object {
  ActionItemsSimple(
      {@required this.icon,
      @required this.onPress,
      this.backgroudColor: Colors.grey}) {
    assert(icon != null);
    assert(onPress != null);
  }

  final Widget icon;
  final VoidCallback onPress;
  final Color backgroudColor;
}

class OnSlideSimple extends StatefulWidget {
  OnSlideSimple(
      {Key key,
      @required this.items,
      @required this.child,
      this.backgroundColor: Colors.white})
      : super(key: key) {
    assert(items.length <= 6);
  }

  final List<ActionItemsSimple> items;
  final Widget child;
  final Color backgroundColor;

  @override
  State<StatefulWidget> createState() {
    return _OnSlideSimpleState();
  }
}

class _OnSlideSimpleState extends State<OnSlideSimple> {
  bool isOpen = false;

  Size childSize;

  @override
  Widget build(BuildContext context) {
    if (childSize == null) {
      return NotificationListener(
        child: LayoutSizeChangeNotifier(
          child: widget.child,
        ),
        onNotification: (LayoutSizeChangeNotification notification) {
          childSize = notification.newSize;
          print(notification.newSize);
          scheduleMicrotask(() {
            setState(() {});
          });
          return;
        },
      );
    }

    List<Widget> scrollWidgets = <Widget>[
      Container(
        width: childSize.width,
        child: widget.child,
      ),
    ];
    List<Widget> under = <Widget>[];

    for (ActionItemsSimple item in widget.items) {
      under.add(Expanded(
          child: Container(
        alignment: Alignment.center,
        color: item.backgroudColor,
        width: ITEMS_WIDTH,
        child: item.icon,
      )));

      scrollWidgets.add(InkWell(
          child: Container(
            color: Colors.transparent,
            alignment: Alignment.center,
            width: 30.0,
            height: childSize.height,
          ),
          onTap: () {
            item.onPress();
          }));
    }

    Widget scrollview = NotificationListener(
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: scrollWidgets,
      ),
    );

    return Stack(
      children: <Widget>[
        Container(
          width: childSize.width,
          height: childSize.height - 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: under,
          ),
        ),
        Positioned(
          child: scrollview,
          left: 0.0,
          bottom: 0.0,
          right: 0.0,
          top: 0.0,
        )
      ],
    );
  }
}
