import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class FoodScan extends StatefulWidget {
  const FoodScan({super.key});

  @override
  State<FoodScan> createState() => _FoodScanState();
}

class _FoodScanState extends State<FoodScan> {
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
          backgroundColor: Colors.greenAccent[100],
          title: Text(
            'Food recognise',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
          ),
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
                        : const Column(
                            children: [
                              Icon(Icons.image_not_supported),
                              Text('Take a photo of your image ')
                            ],
                          ),
                  ],
                ),
              ),
        floatingActionButton: FloatingActionButton(
          onPressed: pickImage,
          tooltip: 'Pickimage',
          child: const Icon(Icons.qr_code_scanner_sharp),
          backgroundColor: const Color.fromARGB(255, 185, 34, 255),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }

  loadModel() async {
    Tflite.close();
    String? res1 = await Tflite.loadModel(
        model: "assets/model1.tflite", labels: "assets/label1.txt");
    print('model loading status: $res1');
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
