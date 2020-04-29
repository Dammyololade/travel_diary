import 'package:flutter/material.dart';
import 'package:traveldiary/Fourth/DestinationWishlistScreen.dart';
import 'package:traveldiary/ThirdScreen/Top.dart';
import 'package:traveldiary/dashboard/DashboardScreen.dart';
import 'package:traveldiary/SecondScreen/NewTripJournalScreen.dart';
import 'package:traveldiary/ThirdScreen/Top.dart';
import 'package:traveldiary/Fourth/AddDestinationScreen.dart';
import 'package:traveldiary/Fourth/DestinationList.dart';

///
/// project: travel_diary
/// @package:
/// @author dammyololade
/// created on 22/04/2020
class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  var _widgets = [
    DashboardScreen(),
    NewTripJournalScreen(),
    Top(),
    DestinationWishlistScreen(),
    DestinationList(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: _widgets,
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {
            setState(() {
              selectedIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: selectedIndex,
          selectedItemColor: Theme.of(context).accentColor,
          items: [
            _buildItem(Icons.home),
            _buildItem(Icons.create_new_folder),
            _buildItem(Icons.menu),
            _buildItem(Icons.location_city),
            _buildItem(Icons.account_circle),
          ]),
    );
  }

  BottomNavigationBarItem _buildItem(IconData icon) {
    return BottomNavigationBarItem(title: SizedBox(), icon: Icon(icon));
  }
}
