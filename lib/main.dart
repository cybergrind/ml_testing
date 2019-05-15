// Flutter code sample for widgets.SingleChildScrollView.2

// In this example, the column becomes either as big as viewport, or as big as
// the contents, whichever is biggest.

import 'package:flutter/material.dart';
import './words_widget.dart';
import './cam_widget.dart';
import 'package:camera/camera.dart';

/*
void umain() {
  //runApp(MyApp());
  final cameras = await availableCameras();
  final firstCamera = cameras.first;
  runApp(TakePictureScreen(camera: null))
}
*/

Future<void> main() async {
  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras
  final firstCamera = cameras.first;

  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      home: TakePictureScreen(
        // Pass the appropriate camera to the TakePictureScreen Widget
        camera: firstCamera,
      ),
    ),
  );
}


/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'test app',
        home: Scaffold(
          appBar: AppBar(title: Text('TITLE')),
          body: Center(
            child: Text(
              'lolll1',
              style: TextStyle(fontSize: 80, fontFamily: 'monospace'),
            ),
          ),
          bottomSheet: WordsList(),
        ));
  }
}
