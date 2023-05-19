import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  late bool _loading;
  File? _image;
  List? _outputs;
  final _imagePicker = ImagePicker();

  @override
  void initState() {
    _loading = true;

    loadModel().then((value) {
      setState(() {
        _loading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Food recognise'),
        ),
        backgroundColor: Colors.white,
        body: _loading
            ? Container(
                alignment: Alignment.center,
                child: const CircularProgressIndicator(),
              )
            : SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _image == null
                        ? Container()
                        : SizedBox(
                            height: 500,
                            width: MediaQuery.of(context).size.width - 200,
                            child: Image.file(_image!),
                          ),
                    const SizedBox(
                      height: 20,
                    ),
                    _outputs != null
                        ? Text(
                            "${_outputs![0]["label"]}"
                                .replaceAll(RegExp(r'[0-9]'), ''),
                          )
                        : const Text('Classification waiting'),
                  ],
                ),
              ),
        floatingActionButton: FloatingActionButton(
          onPressed: pickImage,
          tooltip: 'Pickimage',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  loadModel() async {
    Tflite.close();
    String? res = await Tflite.loadModel(
        model: "assets/model_unquant.tflite", labels: "assets/labels.txt");
    print('model loading status: $res');
  }

  pickImage() async {
    var image = await _imagePicker.pickImage(source: ImageSource.camera);
    if (image == null) return null;
    setState(() {
      _loading = true;
      _image = File(image.path);
    });
    classifyImages(_image!);
  }

  classifyImages(File image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _loading = false;
      _outputs = output!;
    });
  }
}
