library amaze_alert;

import 'package:flutter/material.dart';

// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
}
enum AmazeAnimation { Rotate, Scale, ScaleRotate, Fade }

class AmazeAlert {
  double _padding = 15.0;

  Widget _body(
      {@required BuildContext context,
      @required String title,
      @required String text}) {
    return new Dialog(
      child: new Container(
        decoration: new BoxDecoration(
          color: Theme.of(context).primaryColor,
        ),
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Padding(
              padding: new EdgeInsets.all(_padding),
              child: Align(
                alignment: Alignment.centerLeft,
                child: new Text(
                  title,
                  style: new TextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            new Padding(
              padding: new EdgeInsets.all(_padding),
              child: new Text(text),
            ),
            Padding(
              padding: new EdgeInsets.all(_padding),
              child: new Align(
                alignment: Alignment.centerRight,
                child: new Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    new RaisedButton(
                      onPressed: () {},
                      child: new Text(
                        'Button 1',
                        style: new TextStyle(color: Colors.grey),
                      ),
                      color: Colors.black,
                    )
                  ],
                ),
              ),
            ),
            new Container(
              height: 5.0,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }

  AmazeAlert(
      {@required BuildContext context,
      @required String title,
      @required String text,
      @required AnimationController animationController,
      AmazeAnimation amazeAimation: AmazeAnimation.Rotate,
      Curve curve: Curves.easeInOut}) {
    animationController.reset();
    animationController.forward();
    showDialog(
        context: context,
        builder: (context) {
          switch (amazeAimation) {
            case AmazeAnimation.Rotate:
              return new RotationTransition(
                turns: new Tween(begin: 0.5, end: 1.0).animate(
                    CurvedAnimation(curve: curve, parent: animationController)),
                child: _body(context: context, text: text, title: title),
              );
              break;

            case AmazeAnimation.Scale:
              return new ScaleTransition(
                scale:
                    CurvedAnimation(curve: curve, parent: animationController),
                child: _body(context: context, text: text, title: title),
              );
              break;

            case AmazeAnimation.Fade:
              return new FadeTransition(
                opacity:
                    CurvedAnimation(curve: curve, parent: animationController),
                child: _body(context: context, text: text, title: title),
              );
              break;

            case AmazeAnimation.ScaleRotate:
              return new ScaleTransition(
                scale:
                    CurvedAnimation(curve: curve, parent: animationController),
                child: new RotationTransition(
                  turns: new Tween(begin: 0.5, end: 1.0).animate(
                      CurvedAnimation(
                          curve: curve, parent: animationController)),
                  child: _body(context: context, text: text, title: title),
                ),
              );
              break;

            default:
              return new RotationTransition(
                turns:
                    CurvedAnimation(curve: curve, parent: animationController),
                child: _body(context: context, text: text, title: title),
              );
              break;
          }
        });
  }
}
