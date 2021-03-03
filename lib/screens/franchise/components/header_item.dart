import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:remax_app/util/constants.dart';

class ItemHeaderFranchise extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          new Container(
            margin: EdgeInsets.only(
                top: 5.0, left: 15.0),
            child: new Align(
              alignment: Alignment.centerLeft,
              child: new Text(
                'Why Us',
                style: new TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          new Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.only(left: 15.0, top: 5.0, bottom: 20.0),
              width: 35,
              height: 2,
              color: Colors.white,
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width * 0.4,
                      color: Colors.black.withOpacity(0.4),
                      margin: EdgeInsets.all(2),
                      child: Column(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.all(5),
                            child: Text('Real Estate Leader', style: TextStyle(
                              color: Colors.white,
                            ),),
                          ),
                          Spacer(),
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.all(5),
                            child: Text('Read More', style: TextStyle(
                              color: kTxtReadMore,
                            ),),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width * 0.4,
                      color: Colors.black.withOpacity(0.4),
                      margin: EdgeInsets.all(2),
                      child: Column(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.all(5),
                            child: Text('Global Family', style: TextStyle(
                              color: Colors.white,
                            ),),
                          ),
                          Spacer(),
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.all(5),
                            child: Text('Read More', style: TextStyle(
                              color: kTxtReadMore,
                            ),),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width * 0.4,
                      color: Colors.black.withOpacity(0.4),
                      margin: EdgeInsets.all(2),
                      child: Column(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.all(5),
                            child: Text('Entrepreneurial Concept', style: TextStyle(
                              color: Colors.white,
                            ),),
                          ),
                          Spacer(),
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.all(5),
                            child: Text('Read More', style: TextStyle(
                              color: kTxtReadMore,
                            ),),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width * 0.4,
                      color: Colors.black.withOpacity(0.4),
                      margin: EdgeInsets.all(2),
                      child: Column(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.all(5),
                            child: Text('Technology Excellence', style: TextStyle(
                              color: Colors.white,
                            ),),
                          ),
                          Spacer(),
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.all(5),
                            child: Text('Read More', style: TextStyle(
                              color: kTxtReadMore,
                            ),),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      height: 110,
                      width: MediaQuery.of(context).size.width * 0.4,
                      color: Colors.black.withOpacity(0.4),
                      margin: EdgeInsets.all(2),
                      child: Column(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.all(5),
                            child: Text('Structured Education and Trainings', style: TextStyle(
                              color: Colors.white,
                            ),),
                          ),
                          Spacer(),
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.all(5),
                            child: Text('Read More', style: TextStyle(
                              color: kTxtReadMore,
                            ),),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 110,
                      width: MediaQuery.of(context).size.width * 0.4,
                      color: Colors.black.withOpacity(0.4),
                      margin: EdgeInsets.all(2),
                      child: Column(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.all(5),
                            child: Text('With RE/MAX, Achieve Maximum Results', style: TextStyle(
                              color: Colors.white,
                            ),),
                          ),
                          Spacer(),
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.all(5),
                            child: Text('Read More', style: TextStyle(
                              color: kTxtReadMore,
                            ),),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.all(20.0),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.white)),
                    onPressed: () {},
                    color: Colors.white,
                    textColor: kRedGradient,
                    child: Text("Miliki Kantor RE/MAX",
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            )
          )
        ],
      ),
    );
  }
}
