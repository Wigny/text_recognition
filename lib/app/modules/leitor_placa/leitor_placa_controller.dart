import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'leitor_placa_controller.g.dart';

class LeitorPlacaController = _LeitorPlacaControllerBase
    with _$LeitorPlacaController;

abstract class _LeitorPlacaControllerBase with Store {
  final TextRecognizer textRecognizer;

  @observable
  bool detected = false;

  _LeitorPlacaControllerBase(this.textRecognizer);

  @action
  void setText(VisionText visionText) {
    RegExp antigo = RegExp('[A-Z]{3}-[0-9]{4}');
    RegExp mercosul = RegExp('[A-Z]{3}[0-9][A-Z][0-9]{2}');

    for (TextBlock block in visionText.blocks) {
      for (TextLine line in block.lines) {
        if (antigo.hasMatch(line.text) || mercosul.hasMatch(line.text)) {
          detected = true;
          Modular.to.pop(line.text);
        }
      }
    }
  }
}
