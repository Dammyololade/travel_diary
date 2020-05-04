import 'package:flutter/material.dart';
import 'package:traveldiary/dashboard/DashboardPageView.dart';

import 'TripListWidget.dart';

/// description:
/// project: travel_diary
/// @package: 
/// @author: dammyololade
/// created on: 14/04/2020
class DashboardScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _DashboardScreenState();
  }

}

class _DashboardScreenState extends State<DashboardScreen> {

  var _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: CustomScrollView(
            slivers: [

              SliverToBoxAdapter(
                child: Column(
                  children: [
                    _searchContainer(),

                    DashboardPageView(),

                    SizedBox(height: 27,),
                  ],
                ),
              ),

              TripListWidget(),
          ],
          )
      ),
    );
  }

  Widget _searchContainer() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Color(0xffF0F0F0)
      ),
      margin: EdgeInsets.only(left: 19, right: 21, top: 16, bottom: 28),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.search,
              size: 24, color: Colors.grey,
            ),
            hintText: "Search your Journals",
            border: InputBorder.none,
            hintStyle: TextStyle(
                fontSize: 13
            )
        ),
      ),
    );
  }
}