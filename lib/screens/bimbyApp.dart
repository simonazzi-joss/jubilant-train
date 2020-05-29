import 'package:coolapp/components/bottomStatusbar.dart';
import 'package:coolapp/components/containerBimby.dart';
import 'package:coolapp/components/statusBar.dart';
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
      appBar: new TopStatusBar(),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            // StatusBar(),
            Container(height: 10),
            Container(
              child: HomePage(),
            ),
            // HomePage(),
          ],
        ),
      ),
      bottomNavigationBar: BottomStatusBar(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ContainerBimby(
          child: Text('Ciao utente!'),
        ),
        ContainerBimby(
          child: 
            // Stack(
            // children: <Widget>[
            //   Positioned(
            //     right: 0,
            //     top: 0,
            //     bottom: 0,
            //     child: Container(
            //       width: 40,
            //       padding: EdgeInsets.all(10), // temporaneo
            //       decoration: BoxDecoration(
            //         color: Colors.green,
            //       ),
            //       child: GestureDetector(
            //         onTap: () => Navigator.pushNamed(context, '/bimbyPage2'),
            //         child: Icon(
            //           Icons.arrow_forward,
            //           color: Colors.white,
            //         ),
            //       ),
            //     ),
            //   ),
              Row(
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
                        Container(
                          child: Text(
                            'Accedi alla lista clienti, consulta i dettagli e crea la lista di lavori',
                          ),
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
                  width: 40,
                  padding: EdgeInsets.all(10), // temporaneo
                  decoration: BoxDecoration(
                    color: Colors.green,
                  ),
                  child: GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/bimbyPage2'),
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ),
                ),
                  // Container(
                  //   width: 40,
                  // )
                ],
              ),
            // ],
          // ),
        ),
      ],
    );
  }
}
