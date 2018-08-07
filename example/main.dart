import 'package:flutter/material.dart';
import 'package:amaze_alert/amaze_alert.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() {
    return new MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 2000));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Amaze Alert Demo'),
      ),
      body: new ListView(
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.all(8.0),
            child: new RaisedButton(
              child: new Text('Fade Alert'),
              onPressed: () {
                new AmazeAlert(
                    context: context,
                    title: 'Fade Animation',
                    text:
                        'This is an example of a fade animation. This is an example of a fade animation. This is an example of a fade animation. This is an example of a fade animation. This is an example of a fade animation. ',
                    animationController: animationController,
                    amazeAimation: AmazeAnimation.Fade,
                    curve: Curves.easeInOut);
              },
            ),
          ),
          new Padding(
            padding: const EdgeInsets.all(8.0),
            child: new RaisedButton(
              child: new Text('Rotate Alert'),
              onPressed: () {
                new AmazeAlert(
                    context: context,
                    title: 'Rotate Animation',
                    text:
                        'This is example of rotate animation. This is example of rotate animation. This is example of rotate animation. This is example of rotate animation. This is example of rotate animation.',
                    animationController: animationController,
                    amazeAimation: AmazeAnimation.Rotate,
                    curve: Curves.easeInOut);
              },
            ),
          ),
          new Padding(
            padding: const EdgeInsets.all(8.0),
            child: new RaisedButton(
              child: new Text('Scale Alert'),
              onPressed: () {
                new AmazeAlert(
                    context: context,
                    title: 'Scale Animation',
                    text:
                        'This is example of scale animation. This is example of scale animation. This is example of scale animation. This is example of scale animation. This is example of scale animation. This is example of scale animation. ',
                    animationController: animationController,
                    amazeAimation: AmazeAnimation.Scale,
                    curve: Curves.easeInOut);
              },
            ),
          ),
          new Padding(
            padding: const EdgeInsets.all(8.0),
            child: new RaisedButton(
              child: new Text('ScaleRotate Alert'),
              onPressed: () {
                new AmazeAlert(
                    context: context,
                    title: 'ScaleRotate Animation',
                    text:
                        'This is example of ScaleRotate animation. This is example of ScaleRotate animation. This is example of ScaleRotate animation. This is example of ScaleRotate animation. This is example of ScaleRotate animation.',
                    animationController: animationController,
                    amazeAimation: AmazeAnimation.ScaleRotate,
                    curve: Curves.easeInOut);
              },
            ),
          ),
        ],
      ),
    );
  }
}
