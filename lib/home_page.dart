import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dialog AppBar"),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  _alertDialog(context);
                },
                child: Text("Android Alert Dialog"),
              ),
              ElevatedButton(
                onPressed: () {
                  _cupertinoAlertDialog(context);
                },
                child: Text("Cupertino Alert Dialog"),
              ),
              ElevatedButton(
                onPressed: () {
                  if (Platform.isAndroid) {
                    return _alertDialog(context);
                  } else {
                    return _cupertinoAlertDialog(context);
                  }
                },
                child: Text("Check Platform Class"),
              ),
              ElevatedButton(
                onPressed: () {
                  _bottomSheet(context);
                },
                child: Text("Bootom sheet"),
              ),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('This is a SnackBar!'),
                      action: SnackBarAction(
                        label: 'Undo',
                        onPressed: () {
                          // Code to execute.
                        },
                      ),
                    ),
                  );
                },
                child: Text("Snack Bar"),
              ),
              ElevatedButton(
                onPressed: () {
                  _customDialog(context);
                },
                child: Text("Custom Dialog"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _alertDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Alert Dialog title'),
          content: const Text("Alert Dialog description"),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  _cupertinoAlertDialog(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Alert Dialog Title'),
        content: const Text('Alert Dialog description'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
          CupertinoDialogAction(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  _bottomSheet(BuildContext context) {
    showModalBottomSheet(
        elevation: 10,
        backgroundColor: Colors.white70,
        context: context,
        builder: (context) => Container(
              width: 288,
              height: 240,
              color: Colors.white54,
              alignment: Alignment.center,
              child: const Text('This is a Bottom sheet', style: TextStyle(fontSize: 20)),
            )
    );
  }

  _customDialog(BuildContext context){
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0)),
          child: Container(
            height: 300,
            width: 400,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "This is a Custom Dialog",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("OK"))
                ],
              ),
            ),
          ),
        ));
  }
}
