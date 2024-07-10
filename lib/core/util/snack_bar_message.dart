import 'package:flutter/material.dart';


class SnackBarMessage{
  void showSuccesssnackBar({required String message ,required BuildContext context}){
ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                message,
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.green,
              ));
              
  }


void showErrorsnackBar({required String message ,required BuildContext context}){
ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                message,
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.red,
              ));
              
  }
}