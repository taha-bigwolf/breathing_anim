import 'package:flare_flutter/flare.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controller.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Breathing',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Breathing Animation'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String animationName = 'breath_out';
  String animationLabel = '';

  void _playAnim() {
    setState(() {
      if (animationName == 'breath_out') {
        animationLabel = 'Breath in...';
        animationName = 'breath_in';
      } else {
        animationLabel = 'Breath out...';
        animationName = 'breath_out';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            animationLabel,
            style: TextStyle(fontSize: 24, color: Colors.yellow),
          ),
          GestureDetector(
            onLongPressStart: (x) {
              _playAnim();
            },
            onLongPressEnd: (y) {
              _playAnim();
            },
            child: Center(
                child: Container(
              height: 400,
              width: 400,
              child: FlareActor(
                'assets/Breathing.flr',
                color: Colors.yellow,
                animation: animationName,
                alignment: Alignment.center,
                fit: BoxFit.contain,
              ),
            )),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _playAnim,
        tooltip: 'Increment',
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
