import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:traveldiary/SecondScreen/NewTripModel.dart';

///
/// project: travel_diary
/// @package: SecondScreen
/// @author dammyololade
/// created on 07/05/2020
class JournalDetailsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _JournalDetailsScreenState();
  }
}

class _JournalDetailsScreenState extends State<JournalDetailsScreen> {
  JournalModel model;

  @override
  Widget build(BuildContext context) {
    model = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            expandedHeight: 360,
            //snap: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: false,
              background: Stack(
                children: [
                  Image.network(
                    model.imageUrl,
                    height: 360,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      color: Colors.black38,
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 22),
                      child: Row(
                        children: [
                          Expanded(
                              child: Text(
                            "${model.country}",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                          Text(
                            "${model.date ?? "N/A"}",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(22),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      "${model.tripTitle}",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff2C3A49)),
                    ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      "${model.moment}",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff2C3A49)),
                    ))
                  ],
                ),
              ),
              SizedBox(
                height: 22,
              ),
              FlatButton(
                onPressed: () {},
                child: Text(
                  "Add comment",
                  style: TextStyle(
                      fontSize: 13, color: Theme.of(context).accentColor),
                ),
                color: Color.fromARGB(
                    Color.getAlphaFromOpacity(0.19), 237, 136, 43),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                padding: EdgeInsets.symmetric(vertical: 9, horizontal: 30),
              ),
              SizedBox(
                height: 32,
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  "Journal Ratings",
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
              ),
              RatingBar(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Color(0xffF9B32F),
                ),
                itemSize: 26,
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              Divider(),
              SizedBox(
                height: 32,
              ),
            ],
          ))
        ],
      ),
    );
  }
}
