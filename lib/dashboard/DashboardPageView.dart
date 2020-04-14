import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// description:
/// project: travel_diary
/// @package: dashboard
/// @author: dammyololade
/// created on: 14/04/2020
class DashboardPageView extends StatelessWidget {

  List<PageViewModel> items;

  PageController controller = PageController(
    viewportFraction: .89
  );



  @override
  Widget build(BuildContext context) {
    populateItems();
    return Container(
      height: 180,
      child: PageView.builder(
        controller: controller,
        itemCount: items.length,
        itemBuilder: (BuildContext context, index) {
          var model = items[index];
          return Card(
            color: Colors.red,
            elevation: 3,
            margin: EdgeInsets.only(
              right: 5, left: 5, bottom: 10, top: 10
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(6))
            ),
            child: Stack(
              children: <Widget>[
                Image.asset(model.imagePath,
                  height: 180,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(model.name,
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(height: 4,),
                      Row(
                        children: <Widget>[
                          Expanded(child: Text(
                            model.address,
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                          )),

                          Text(model.date,
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                          )

                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        }
      ),
    );
  }

  void populateItems() {
    items = List<PageViewModel>.generate(5, (index) => PageViewModel(
      "images/landing_image.png", "London $index", "Address at $index",
      "July 02"
    ));
  }
}

class PageViewModel {

  String imagePath;
  String name, address;
  String date;

  PageViewModel(this.imagePath, this.name, this.address, this.date);
}