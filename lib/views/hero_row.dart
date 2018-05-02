import 'package:flutter/material.dart';

class HeroRow extends StatelessWidget {
  final hero;
  HeroRow(this.hero);

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Container(
          padding: new EdgeInsets.all(12.0),
          child: new Row(
            children: <Widget>[
              new Image.network(
                  hero["imageUrl"]
              ),
              new Text(
                hero["name"],
                style:
                new TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        new Divider(
          color: Colors.cyan,
        )
      ],
    );
  }
}
