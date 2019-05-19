// Flutter code sample for widgets.SingleChildScrollView.2

// In this example, the column becomes either as big as viewport, or as big as
// the contents, whichever is biggest.

import 'package:flutter/material.dart';
import './words_widget.dart';
import './cam_widget.dart';
import './app_state.dart';
import 'package:camera/camera.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

/*
void umain() {
  //runApp(MyApp());
  final cameras = await availableCameras();
  final firstCamera = cameras.first;
  runApp(TakePictureScreen(camera: null))
}
*/

final mainState = MainState();

class ImageTempRoute<T> extends MaterialPageRoute<T> {
  ImageTempRoute(builder): super(builder: builder);

  @override
  bool didPop(T result) {
    // TODO: implement didPop
    mainState.setImagePath(null);
    mainState.setDisplayPicture(false);
    return super.didPop(result);
  }

}

Future<void> pushDisplay(context, image) async {
  print('Before delay');
  await Future.delayed(Duration(milliseconds: 1));

  print('Display picture: ${mainState.displayPicture}');
  mainState.setDisplayPicture(true);
  Navigator.push(
    context,
    ImageTempRoute(
      (context) => DisplayPictureScreen(imagePath: mainState.imagePath),
    ),
  );
}

Widget CamController = Observer(

  builder: (context) {
    print('In builder. ImagePath: ${mainState.imagePath} Display: ${mainState.displayPicture}');
    if (mainState.imagePath != null && !mainState.displayPicture) {
      // return DisplayPictureScreen(imagePath: mainState.imagePath);
      pushDisplay(context, mainState.imagePath);
      // return Text('Has picture: ${mainState.imagePath}');
    }

    if (mainState.firstCamera != null) {
      return TakePictureScreen(camera: mainState.firstCamera);
    } else {
      return Text("Loading...");
    }
  },
);

Future<void> main() async {
  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();
  // Get a specific camera from the list of available cameras
  /*final firstCamera = cameras.first;*/
  mainState.setCamera(cameras.first);

  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      home: CamController,
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
