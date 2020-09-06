import 'package:flutter/material.dart';
import 'package:restapi/imagedetail.dart';
import 'package:restapi/imageflexible.dart';
import './main.dart';

class resultPage extends StatefulWidget {
  final data;

  resultPage(this.data);

  @override
  _resultPageState createState() => _resultPageState();
}

class _resultPageState extends State<resultPage> {
  String infoReturn(String key) {
    dynamic value = widget.data[key];
    // print(value);
    if (value == null) {
      if (key == 'company') {
        value = 'GitHub';
      } else if (key == 'location') {
        value = 'No location';
      } else
        value = '';
    }
    return value.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(infoReturn('git_username')),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 50),
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(infoReturn('prof_pic')),
                    fit: BoxFit.fill),
              ),
            ),
            Card(
              shadowColor: Colors.black,
              margin: EdgeInsets.all(20),
              elevation: 30,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    InkWell(
                      child: Text(
                        infoReturn('git_username'),
                        style: TextStyle(fontSize: 30, color: Colors.blue),
                      ),
                    ),
                    Divider(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.work,
                          size: 20,
                        ),
                        Text(
                          infoReturn('company'),
                          style: TextStyle(
                              fontSize: 18, fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                    Divider(height: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_city,
                          size: 20,
                        ),
                        Text(
                          infoReturn('location'),
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    Divider(),
                    Text(
                      infoReturn('bio'),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    Divider(),
                    Row(
                      children: [
                        Text(
                          'Repositories: ' + infoReturn('repos'),
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    Divider(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          'GitHub Id: ' + infoReturn('git_id'),
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    Divider(
                      height: 5,
                    ),
                    // InteractiveViewer(
                    //   child: Image.network(infoReturn('analysis_pic')),
                    // ),
                    // Image.network(infoReturn('exp_pic')),
                    Material(
                        child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => imageflexible(
                                    infoReturn('analysis_pic'),
                                    'Repo\'s Analysis')));
                      },
                      child: Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.network(infoReturn('analysis_pic')),
                        ),
                      ),
                    )),
                    Material(
                        child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => imageflexible(
                                    infoReturn('exp_pic'),
                                    'Experience Analysis')));
                      },
                      child: Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.network(infoReturn('exp_pic')),
                        ),
                      ),
                    )),
                    // Row(
                    //   children: [
                    //     Text(
                    //       'Followers: ' + infoReturn('followers'),
                    //       style: TextStyle(fontSize: 20),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ),
            RaisedButton(
              color: Colors.green,
              splashColor: Colors.red,
              child: Text(
                'GET ANALYSIS',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            )
          ],
        ),
      ),
    );
  }
}
