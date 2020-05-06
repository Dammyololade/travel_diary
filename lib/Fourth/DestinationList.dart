import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


  class DestinationList extends StatefulWidget {
    @override
    _DestinationListState createState() => _DestinationListState();
  }

  class _DestinationListState extends State<DestinationList> {
    bool cbool = false;


    var _comment = TextEditingController();
    bool _edit = false;

    @override
    Widget build(BuildContext context) {
      return Scaffold(
          body: SingleChildScrollView(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Container(
                  height: 300,
                  child:
                  new Stack(
                    children: [
                      Image.asset("images/bridge.png",
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,),
                      Positioned(
                          left: 20,
                          right: 20,
                          bottom: 40,
                          child:  Text('The Bridge Location', style: TextStyle
                            (color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),)),
                      Positioned(
                          right: 30,
                          bottom: 40,
                          child:  Text('July, 08', style: TextStyle
                            (color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),)),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 25, right: 15),
                  alignment: Alignment.topLeft,
                  child:
                  new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15, ),
                      Text('London Exposition', style: TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold
                      ),),
                      SizedBox(height: 15,),
                      new Container(
                          padding: EdgeInsets.only(bottom: 50),
                          child: new Column(
                            children: [
                              TextField(
                                controller: _comment,
                                decoration: InputDecoration(
                                    contentPadding:
                                    EdgeInsets.only(left: 5, top: 3, bottom: 5),
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(
                                        fontSize: 12, fontWeight: FontWeight.bold)),
                                maxLines: 5, enabled: _edit,
                              ),
                            ],
                          )
                      ),
                      SizedBox(height: 15,),
                      new Container(
                        alignment: Alignment.center,
                        child:
                        new RaisedButton(onPressed: (){
                          setState(() {
                            _edit = true;
                          });
                        }, color: Colors.orangeAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ), child: Text('Edit this Journal ', style: TextStyle( color: Colors.white),),
                        ),
                      ),
                      SizedBox(height: 15,),
                      Divider(),
                      new Column(
                        children: [
                          SizedBox(height: 25,),
                          Text('Rate your trip', style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),),
                          SizedBox(height: 5,),
                          new Container(
                            margin: EdgeInsets.only(left: 80, right: 20),
                            child:
                            new Row(
                              children: [
                                IconButton(icon: Icon(Icons.star), color: Colors.orange, onPressed: (){}),
                                IconButton(icon: Icon(Icons.star), color: Colors.orange, onPressed: (){}),
                                IconButton(icon: Icon(Icons.star), color: Colors.orange, onPressed: (){}),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(),
                SizedBox(height: 15,),
                new Container(
                  margin: EdgeInsets.only(left: 25, right: 15),
                  child:
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('last edited on......', style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.italic, color: Colors.grey),),
                      Icon(Icons.more_vert, size: 25,),
                    ],
                  ),
                ),
              ],
            ),
          )
      );
      
    }
  }



