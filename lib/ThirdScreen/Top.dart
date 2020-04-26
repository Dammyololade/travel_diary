import 'package:flutter/material.dart';
import 'package:traveldiary/ThirdScreen/Next.dart';
import 'package:traveldiary/ThirdScreen/Final.dart';
import 'package:traveldiary/ThirdScreen/Bottom.dart';

class Top extends StatefulWidget {
  @override
  _TopState createState() => _TopState();
}

class _TopState extends State<Top> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: SingleChildScrollView(
         child: new Container(
           margin: EdgeInsets.only(left: 10, top: 10, bottom: 50),
           child:
           new Column(
             children: [
               SizedBox(height: 40,),
               Text('My Journals', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
               SizedBox(height: 15,),
               new Container(
                 margin: EdgeInsets.only(right: 5),
                 height: 200,
                 child:
                 new Card(
                   color: Color(0xffE5E5E5),
                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                   child: new Stack(
                     children: [
                       Positioned(
                           right: 20,
                           bottom: 20,
                           left: 20,
                           child:
                           Text('Lagos, Nigeria', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 12),))
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
                     Text('My lagos story: Move or be Moved', style:
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
                           new Text('24 July 2019 @09:12AM', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                         ),
                         new Container(
                           child: Icon((Icons.more_vert), size: 20,),
                         )
                       ],
                     )
                   ],
                 ),
               ),
               SizedBox(height: 40,),
               Next(),
               Final(),
               SizedBox(height: 25,),
               Bottom(),
             ],
           ),
         ),
       ),
    );
  }
}
