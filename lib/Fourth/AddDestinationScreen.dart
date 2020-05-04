import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:traveldiary/AppConfig.dart';
import 'package:traveldiary/Fourth/DestinationModel.dart';
import 'package:traveldiary/ThirdScreen/Final.dart';

class AddDestinationScreen extends StatefulWidget {
  @override
  _DestinationState createState() => _DestinationState();
}

class _DestinationState extends State<AddDestinationScreen> {
  String _dsname;

  final _firestore = Firestore.instance;
  var _destinationNameController = TextEditingController();
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  DateTime _departureDate;
  DateTime _arrivateDate;

  DateTime _currentDate = new DateTime.now();

  void _selectDate(Function(DateTime date) onDateSelected) async {
    var date = await showDatePicker(
        context: context,
        initialDate: _currentDate,
        firstDate: DateTime(2019),
        lastDate: DateTime(2025));
    onDateSelected(date);
  }

  String formatDate(DateTime dateTime) =>
      dateTime == null ? "" : DateFormat.yMMMd().format(dateTime);

  void _showMessage(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(message)));
  }

  bool showLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Add Destination",
          style: TextStyle(color: Color(0xff2C3A49)),
        ),
        iconTheme: IconThemeData(color: Color(0xff2C3A49)),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Destination Name',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  controller: _destinationNameController,
                  decoration: InputDecoration(),
                ),
                SizedBox(
                  height: 54,
                ),
                Row(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text('When are you planing to Go',
                          style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                    ),
                    InkWell(
                      onTap: () {
                        _selectDate((DateTime date) {
                          setState(() {
                            _departureDate = date;
                          });
                        });
                      },
                      child: Icon(
                        Icons.calendar_today,
                        size: 24,
                      ),
                    ),
                  ],
                ),
                Text(
                  formatDate(_departureDate),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
                SizedBox(
                  height: 54,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text('When is your return date',
                          style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                    ),
                    InkWell(
                        child: Icon(
                          Icons.calendar_today,
                          size: 24,
                    ),
                        onTap: () {
                          _selectDate((date) {
                            setState(() {
                              _arrivateDate = date;
                            });
                          });
                        }),
                  ],
                ),
                new Container(
                  margin: EdgeInsets.only(right: 150),
                  child: Text(
                    formatDate(_arrivateDate),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                if(showLoading) Center(child: CircularProgressIndicator())
                else
                  RaisedButton(
                    onPressed: () {
                      _saveDetails();
                    },
                    elevation: 5,
                    color: Theme
                        .of(context)
                        .accentColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6))),
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      children: [
                        Expanded(
                          child: new Text(
                            'Add Destination',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 15),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  )
              ],
            ),
          )),
    );
  }

  void _saveDetails() async {
    if (validateInput()) {
      setState(() {
        showLoading = true;
      });
      DestinationModel model = DestinationModel(
          destinationName: _destinationNameController.text,
          departureDate: _departureDate.toString(),
          arrivalDate: _arrivateDate.toString(),
          status: "Pending"
      );
      await _firestore.collection(AppConfig.destinationCollection).add(
          model.toMap());
      Navigator.of(context).pop();
//      _scaffoldKey.currentState.showBottomSheet((context) => Column(
//
//      ));
    }
  }

  bool validateInput() {
    bool validated = false;
    if (_destinationNameController.text.isEmpty) {
      _showMessage("Please enter your destination name");
    } else if (_arrivateDate == null) {
      _showMessage("Please set your arrival date");
    } else if (_departureDate == null) {
      _showMessage("Please set your Departure date");
    } else {
      validated = true;
    }
    return validated;
  }
}
