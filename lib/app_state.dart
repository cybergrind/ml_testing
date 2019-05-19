import 'package:mobx/mobx.dart';
import 'package:camera/camera.dart';


part 'app_state.g.dart';

class MainState = MainStateBase with _$MainState;

abstract class MainStateBase implements Store {
  @observable
  String imagePath;

  @observable
  CameraDescription firstCamera;

  @observable
  bool displayPicture = false;

  @action
  void setImagePath(String path) {
    imagePath = path;
  }

  @action
  void setCamera(CameraDescription cam) {
    firstCamera = cam;
  }

  @action
  void setDisplayPicture(bool value) {
    displayPicture = value;
  }
}