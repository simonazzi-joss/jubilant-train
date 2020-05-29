import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ContainerBimby extends StatelessWidget {
  final GlobalKey key;
  final Widget child;
  final double margin;

  ContainerBimby({this.key, @required this.child, this.margin = 10});


  // TODO ho bisogno di poter aggiungere i bottoni direttamente da qui, oppure gestire il padding come il [this.margin]
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
