import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:text_recognition/app/modules/leitor_placa/leitor_placa_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:text_recognition/app/modules/leitor_placa/leitor_placa_page.dart';

class LeitorPlacaModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => LeitorPlacaController(
            FirebaseVision.instance.textRecognizer(),
          ),
        ),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => LeitorPlacaPage()),
      ];

  static Inject get to => Inject<LeitorPlacaModule>.of();
}
