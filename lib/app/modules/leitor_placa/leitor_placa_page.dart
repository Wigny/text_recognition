import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:flutter_camera_ml_vision/flutter_camera_ml_vision.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'leitor_placa_controller.dart';

class LeitorPlacaPage extends StatefulWidget {
  final String title;
  const LeitorPlacaPage({Key key, this.title = "Leitor de Placa"})
      : super(key: key);

  @override
  _LeitorPlacaPageState createState() => _LeitorPlacaPageState();
}

class _LeitorPlacaPageState
    extends ModularState<LeitorPlacaPage, LeitorPlacaController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Observer(
        builder: (_) => CameraMlVision<VisionText>(
          detector: controller.textRecognizer.processImage,
          onResult: (VisionText visionText) {
            if (!mounted) {
              return;
            }
            controller.setText(visionText);
          },
        ),
      ),
    );
  }
}
