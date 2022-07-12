import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_camera_app/camera.dart';
import 'package:flutter_camera_app/theme.dart';
import 'package:flutter_camera_app/widgets/custom_card.dart';
import 'package:permission_handler/permission_handler.dart';

late List<CameraDescription> cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Camera App',
      theme: themeData(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    _requestPermissions();
    super.initState();
  }

  void _requestPermissions() async {
    var status = await Permission.manageExternalStorage.status;

    if (status.isDenied) {
      Permission.manageExternalStorage.request();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Camera App',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CustomCard(
              'Camera',
              Camera(),
              Icons.camera,
              tileColor: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
