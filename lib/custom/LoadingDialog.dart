import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// description:
/// project: travel_diary
/// @package: custom
/// @author: dammyololade
/// created on: 04/05/2020
class LoadingDialog {
  BuildContext context;
  String message;
  bool isBarrierDismissable;

  LoadingDialog(this.context, this.message,
      {this.isBarrierDismissable = false});

  show() {
    showDialog(
        barrierDismissible: this.isBarrierDismissable,
        context: context,
        builder: (context) => SimpleDialog(
              titlePadding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              children: [
                Column(
                  children: [
                    Container(
                        height: 70,
                        width: 70,
                        margin: EdgeInsets.symmetric(vertical: 20),
                        child: CircularProgressIndicator()),
                  ],
                ),
                Center(child: Text("$message"))
              ],
            ));
  }
}
