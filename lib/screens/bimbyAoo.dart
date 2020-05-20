import 'package:flutter/material.dart';

class BimbyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BimbyAppState();
}

class BimbyFontIcons {
  static const double defaultSize = 25;

  static const String PostVendita = '';
  static const String Menu = '';
  static const String Acccount = '';
}

class _BimbyAppState extends State<BimbyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            StatusBar(),
            Container(height: 10),
            HomePage(),
          ],
        ),
      ),
    );
  }
}

class StatusBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ContainerBimby(
      margin: 0,
      child: Row(
        children: <Widget>[
          Container(
            height: 25,
            child: Image(
              image: AssetImage('images/bimby.png'),
              fit: BoxFit.fitHeight,
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
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ContainerBimby(
          child: Text('Ciao... %s'),
        ),
        ContainerBimby(
          child: Row(
            children: <Widget>[
              Flexible(
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Lista clienti',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      'Accedi alla lista clienti, consulta i dettagli e crea la lista di lavori',
                    ),
                  ],
                ),
              ),
              //
              Container(
                child: Text(
                  BimbyFontIcons.Acccount,
                  style: TextStyle(color: Colors.green, fontSize: 40),
                ),
              ),
              Container(
                color: Colors.green,
                child: Text(
                  BimbyFontIcons.Acccount,
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ContainerBimby extends StatelessWidget {
  final GlobalKey key;
  final Widget child;
  final double margin;

  ContainerBimby({this.key, @required this.child, this.margin = 10});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.all(this.margin),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 12,
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(15),
            child: this.child,
          ),
        ),
      ),
    );
  }
}
