import 'package:coolapp/components/statusBar.dart';
import 'package:coolapp/screens/bimby.dart';
import 'package:flutter/material.dart';

class BimbyDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BimbyDetailState();
}

class _BimbyDetailState extends State<BimbyDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopStatusBar(),
      body: SafeArea(
        child: buildDetailPage(),
      ),
    );
  }

  Widget buildDetailPage() => Center(
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: OnSlideSimple(
                items: [
                  ActionItemsSimple(
                      icon: IconButton(
                        icon: Icon(Icons.call),
                        onPressed: () {},
                        color: Colors.white,
                      ),
                      onPress: () {},
                      backgroudColor: Colors.green[500]),
                  ActionItemsSimple(
                      icon: IconButton(
                        icon: Icon(Icons.email),
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
      );

  Widget buildCard() => Container(
        width: 250.0,
        height: 100.0,
        child: Container(
          decoration: BoxDecoration(
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
            borderRadius: BorderRadius.all(const Radius.circular(0.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              firstRow(),
              SizedBox(
                height: 6,
              ),
              Divider(
                height: 1,
                color: Colors.grey[500],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  text("Ult.mod.", "TM5"),
                  Container(
                    width: 1,
                    height: 30,
                    color: Colors.grey[300],
                  ),
                  text("Ult.acq", "21.12.2020"),
                  Container(
                    width: 1,
                    height: 30,
                    color: Colors.grey[300],
                  ),
                  text("Tipo ult. cont.", "Demo"),
                  Container(
                    width: 1,
                    height: 30,
                    color: Colors.grey[300],
                  ),
                  text("Ult. contratto", "Nessuno"),
                ],
              ),
              Expanded(
                child: Container(
                  color: Colors.grey[100],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Icon(
                        Icons.shopping_basket,
                        color: Colors.green[800],
                      ),
                      Icon(
                        Icons.home,
                        color: Colors.grey[400],
                      ),
                      Icon(
                        Icons.airport_shuttle,
                        color: Colors.green[800],
                      ),
                      Icon(
                        Icons.airline_seat_flat,
                        color: Colors.green[800],
                      ),
                      Icon(
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          up,
          style: TextStyle(
            fontWeight: FontWeight.w200,
            fontSize: 12,
          ),
        ),
        Text(
          down,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  firstRow() {
    return Padding(
      padding: EdgeInsets.all(4),
      child: Row(
        children: <Widget>[
          Icon(
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
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                "Via arcimabaldo 9000, 20137",
                style: TextStyle(fontSize: 12),
              )
            ],
          ),
          Expanded(
            child: Container(),
          ),
          Icon(
            Icons.content_paste,
            color: Colors.green[800],
          ),
        ],
      ),
    );
  }
}
