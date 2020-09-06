import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'result.dart';
import 'package:photo_view/photo_view.dart';
import 'package:cached_network_image/cached_network_image.dart';

class imageflexible extends StatefulWidget {
  final url;
  final title;

  imageflexible(this.url, this.title);

  @override
  _imageflexibleState createState() => _imageflexibleState();
}

class _imageflexibleState extends State<imageflexible> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.orange,
      ),
      body: Container(
          child: PhotoView(
        imageProvider: CachedNetworkImageProvider(widget.url),
      )),
    );
  }
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //       appBar: AppBar(
  //         title: Text('Skill Analysis'),
  //       ),
  //       body: Center(
  //           child: Flexible(
  //         child: new ZoomableImage(new NetworkImage(widget.url),
  //             placeholder: const Center(
  //               child: const CircularProgressIndicator(),
  //             ),
  //             backgroundColor: Colors.black),
  //       )));
  // }
}
