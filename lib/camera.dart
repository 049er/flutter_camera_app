import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_camera_app/main.dart';

class Camera extends StatefulWidget {
  const Camera({Key? key}) : super(key: key);

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  late CameraController controller;

  @override
  void initState() {
    super.initState();
    controller = CameraController(cameras[0], ResolutionPreset.high);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            print('User denied camera access.');
            break;
          default:
            print('Handle other errors.');
            break;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
      floatingActionButton: _floatingActionButton(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Text(
        'Camera',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      centerTitle: true,
    );
  }

  Widget _body() {
    if (!controller.value.isInitialized) {
      return Container();
    }
    return MaterialApp(
      home: CameraPreview(controller),
    );
  }

  FloatingActionButton _floatingActionButton() {
    return FloatingActionButton(
      // Provide an onPressed callback.
      onPressed: () async {
        final image = await controller.takePicture();
        String path = '/storage/emulated/0/Download/';

        await image.saveTo(path + image.name);
      },
      child: const Icon(Icons.camera_alt),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
