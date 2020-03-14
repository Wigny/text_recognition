import 'dart:io';

import 'package:camera/camera.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:mobx/mobx.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  String textResult = 'Esperando';
  CameraController cameraController;
  Uuid _uuid;

  @observable
  bool pronto = false;
  @observable
  bool loading = false;

  _HomeControllerBase() {
    _uuid = Uuid();
    camera();
  }

  Future camera() async {
    List<CameraDescription> cameras = await availableCameras();
    cameraController = CameraController(
      cameras[0],
      ResolutionPreset.medium,
    );

    cameraController.initialize().then((_) => pronto = true);
  }

  teste() async {
    loading = true;

    String image = await take();
    textRecognition(image).then(getText);
    loading = false;
  }

  Future<String> take() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String filePath = appDocDir.path + "/" + _uuid.v4() + ".jpg";
    await cameraController.takePicture(filePath);
    return filePath;
  }

  Future<VisionText> textRecognition(filePath) async {
    final File imageFile = File(filePath);

    final FirebaseVisionImage visionImage = FirebaseVisionImage.fromFile(
      imageFile,
    );

    final TextRecognizer textRecognizer =
        FirebaseVision.instance.textRecognizer();

    final VisionText visionText = await textRecognizer.processImage(
      visionImage,
    );

    return visionText;
  }

  void getText(VisionText visionText) {
    textResult = '';
    for (TextBlock block in visionText.blocks) {
      for (TextLine line in block.lines) {
        textResult += " " + line.text;
      }
    }
  }
}
