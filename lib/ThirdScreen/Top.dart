import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:traveldiary/SecondScreen/NewTripModel.dart';


class Top extends StatefulWidget {
  @override
  _TopState createState() => _TopState();
}

class _TopState extends State<Top> {

  final _firestore = Firestore.instance;


  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'My Journals',
          style: TextStyle(color: Color(0xff2C3A49), fontSize: 25),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: StreamBuilder(
                stream: _firestore.collection("Journals").snapshots(),
                // ignore: missing_return
                builder: (context, AsyncSnapshot<QuerySnapshot> querysnapshot) {
                  switch (querysnapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    case ConnectionState.active:
                    case ConnectionState.done:
                      var documents = querysnapshot.data.documents;
                       return ListView.builder(
                          itemCount: documents.length,
                          itemBuilder: (cont, index){
                            JournalModel model = JournalModel.fromSnapshot(documents[index]);
                             return Container(
                                  margin: EdgeInsets.only(left: 10, top: 10, bottom: 50),
                                    child:
                                    new Column(
                                      children: [
                                        SizedBox(height: 15,),
                                        new Column(
                                          children: [
                                            new  Container(
                                              margin: EdgeInsets.only(right: 5),
                                              height: 200,
                                              child:
                                              new Card(
                                                color: Color(0xffE5E5E5),
                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                                                child: new Stack(
                                                  children: [
                                                    Image.network(model.imageUrl,
                                                      fit: BoxFit.fill,),
                                                    Positioned(
                                                        right: 20,
                                                        bottom: 20,
                                                        left: 20,
                                                        child:
                                                        Text("${model.country}", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 12),))
                                                               ],
                                                ),
                                              ),
                                            ),
                                            new Container(
                                              margin: EdgeInsets.only( right:20, left: 20),
                                              child:
                                              new Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  SizedBox(height: 20,),
                                                  Text('${model.moment}', style:
                                                  TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                                  Text('Still goes on', style:
                                                  TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                                  SizedBox(height: 10,),
                                                  new Container(
                                                    margin: EdgeInsets.only(left: 5,right: 5),
                                                    child: new Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                      children: [
                                                        Text('Lorem ipsum dolor sit amet, consectetur', style: TextStyle(fontSize: 12),),
                                                        Text('adipiscing elit, sed do eiusmod tempor incididi....', style: TextStyle(fontSize: 12),),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height: 20,),
                                                  new Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      new Container(
                                                        margin: EdgeInsets.only(right: 10, left: 10),
                                                        child:
                                                        new Text("${model.country}", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                                                      ),
                                                      new Container(
                                                        child: Icon((Icons.more_vert), size: 20,),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),


                                          ],
                                        ),

                                        SizedBox(height: 40,),
                                 Container(
                                   margin: EdgeInsets.only(left: 25, right: 25),
                                   child: new Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     crossAxisAlignment: CrossAxisAlignment.end,
                                     children: [

                                       new Column(
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         children: [
                                           Text('I came, I saw, I got', style: TextStyle(fontSize: 15, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold),),
                                           Text('Burnt, I leant to how', style: TextStyle(fontSize: 15, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold),),
                                           Text('a lot', style: TextStyle(fontSize: 15, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold),),
                                           SizedBox(height: 10,),
                                           Text('Lorem ipsum dolor sit amet', style: TextStyle(fontSize: 12, fontStyle: FontStyle.normal, fontWeight: FontWeight.normal),),
                                           Text('consectetur adipiscing elit, sed', style: TextStyle(fontSize: 12, fontStyle: FontStyle.normal, fontWeight: FontWeight.normal),),
                                           Text('do eiusmod tempor incididi...', style: TextStyle(fontSize: 12, fontStyle: FontStyle.normal, fontWeight: FontWeight.normal),),
                                         ],

                                       ),
                                       Expanded(
                                         child: new Container(
                                           height: 100,
                                           margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                                           child: new Card(
                                             color: Color(0xffE5E5E5),
                                             shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8)),),
                                             child: new Stack(
                                               children: [
                                                 SizedBox(width: 100,),
                                                 Image.network(model.imageUrl,
                                                   fit: BoxFit.fill ,),
                                               ],
                                             ),
                                           ),
                                         ),
                                       ),

                                     ],
                                   ),


                                 ),
                                        Container(
                                          margin: EdgeInsets.only(left: 25, right: 25),
                                          child:
                                          new Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height: 15,),
                                              new Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text("${model.date}", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                                                  Icon(Icons.more_vert, size: 20,),
                                                ],
                                              ),
                                            ],
                                          ),

                                        ),
                                        SizedBox(height: 25,),
                                        new Container(
                                           height: 150,
                                           margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                                            child: new Card(
                                            color: Color(0xffE5E5E5),
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8)),),
                                             child: new Stack(
                                             children: [
                                              SizedBox(width: 200,),
                                              Image.network(
                                                  model.imageUrl,
                                                 fit: BoxFit.cover,
                                                 ),
                                                   ],
                                               ),
                                           ),
                                         ),
                                      ],
                                    )

                            );
                          }
                          );
                  }
                }
            ),
           );

  }
}
