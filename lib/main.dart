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

Future<void> pushDisplay(context) async {
  print('Before delay');
  // await Future.delayed(Duration(milliseconds: 1));
  Navigator.push(
    context,
    ImageTempRoute(
          (context) => DisplayPictureScreen(imagePath: mainState.imagePath),
    ),
  );
  print('Display picture: ${mainState.displayPicture}');

}

Widget CamController = Observer(

  builder: (context) {
    print('In builder. ImagePath: ${mainState.imagePath} Display: ${mainState.displayPicture}');
    if (mainState.imagePath != null && !mainState.displayPicture) {
      print('Push display');
      Future.delayed(Duration(milliseconds: 1), () => pushDisplay(context));
    } else {
      print('Why we re here');
    }

    if (mainState.firstCamera != null) {
      return TakePictureScreen(camera: mainState.firstCamera);
    } else {
      return Text("Loading...");
    }
  },
);


Future<void> getCameras() async {
  final cameras = await availableCameras();
  mainState.setCamera(cameras.first);
}

void main() {
  getCameras();
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
