import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Observer(
            builder: (BuildContext context) => Container(
              width: double.infinity,
              height: 600,
              child: controller.pronto
                  ? CameraPreview(controller.cameraController)
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Observer(
              builder: (_) => RaisedButton(
                onPressed: () => controller.pronto ? controller.teste() : null,
                child: Text("Capturar"),
              ),
            ),
          ),
          Observer(
            builder: (_) => Container(
              child: controller.loading
                  ? CircularProgressIndicator()
                  : Center(
                      child: Text(controller.textResult),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
