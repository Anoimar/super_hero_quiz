import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:super_hero_quiz/views/hero_row.dart';

void main() => runApp(new SuperHeroQuizApp());

class SuperHeroQuizApp extends StatefulWidget {
  _SuperHeroQuizState createState() => new _SuperHeroQuizState();
}

class _SuperHeroQuizState extends State<SuperHeroQuizApp> {
  String _title = 'SuperHero Quiz';

  var _isLoading = false;

  List heroes;

  _fetchData() async {
    final response =
        await http.get("https://thernat-fan.herokuapp.com/quiz/questions");
    if (response.statusCode == 200) {
      print("New list of heroes");
      this.heroes = jsonDecode(response.body);
      setState(() => _isLoading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "Super Hero Quiz",
        home: new Scaffold(
          appBar: new AppBar(
            title: new Text(_title),
            actions: <Widget>[
              new IconButton(
                  icon: new Icon(Icons.refresh),
                  onPressed: () {
                    print("Reloading");
                    setState(() => _isLoading = true);
                    _fetchData();
                  })
            ],
          ),
          body: new Center(
            child: _isLoading
                ? new CircularProgressIndicator()
                : new ListView.builder(
                    itemCount: this.heroes != null ? this.heroes.length : 0,
                    itemBuilder: (context, i) {
                      final hero = heroes[i];
                      return new FlatButton(onPressed: () {
                        Navigator.push(context,
                        new MaterialPageRoute(
                            builder: (context) => new HeroDetailPage()
                        )
                        );
                      },
                        child: new HeroRow(hero),
                      );
                    },
                  ),
          ),
        ));
  }
}

class HeroDetailPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Detail page")
      ),
      body: new Center(
        child: new Text("Detail"),
      ),
    );
  }

}

