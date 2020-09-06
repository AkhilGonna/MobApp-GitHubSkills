import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;

class zoomPage extends StatefulWidget {
  final url;

  zoomPage(this.url);

  @override
  _zoomPageState createState() => _zoomPageState();
}

class _zoomPageState extends State<zoomPage> {
  double _scale = 1.0;
  double _previousScale = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Experience Analysis'),
      ),
      body: RotatedBox(
        quarterTurns: 1,
        child: Center(
          child: GestureDetector(
            onScaleStart: (ScaleStartDetails details) {
              _previousScale = _scale;
              setState(() {});
            },
            onScaleUpdate: (ScaleUpdateDetails details) {
              _scale = _previousScale * details.scale;
              setState(() {});
            },
            onScaleEnd: (ScaleEndDetails details) {
              _previousScale = 1.0;
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Transform(
                  transform: Matrix4.diagonal3(Vector3(_scale, _scale, _scale)),
                  child: Image.network(widget.url)),
            ),
          ),
        ),
      ),
    );
  }
}
