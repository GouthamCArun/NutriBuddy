import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:srm_app/widgets/fetchfood.dart';
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
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black54,
            ),
          ),
          centerTitle: true,
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
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _image == null
                          ? Container()
                          : Column(
                              children: [
                                const SizedBox(
                                  height: 40,
                                ),
                                Material(
                                  elevation: 20,
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    height:
                                        MediaQuery.of(context).size.width - 200,
                                    width:
                                        MediaQuery.of(context).size.width - 200,
                                    child: Image.file(
                                      _image!,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                      const SizedBox(
                        height: 20,
                      ),
                      _outputs != null
                          ? Column(
                              children: [
                                Text(
                                  "${_outputs![0]["label"]}".replaceAll(
                                    RegExp(
                                      r'[0-9]',
                                    ),
                                    '',
                                  ),
                                  style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: Material(
                                    elevation: 10,
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                      height: 100,
                                      width: MediaQuery.of(context).size.width -
                                          30,
                                      decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 252, 143, 110),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              'Diet Preferrable:',
                                              style: GoogleFonts.poppins(
                                                fontSize: 30,
                                                fontWeight: FontWeight.w700,
                                                color: const Color.fromARGB(
                                                    255, 0, 0, 0),
                                              ),
                                            ),
                                            Text(
                                              'NO',
                                              style: GoogleFonts.poppins(
                                                fontSize: 30,
                                                fontWeight: FontWeight.w700,
                                                color: const Color.fromARGB(
                                                    255, 0, 0, 0),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                FetchFood(
                                  Food: "${_outputs![0]["label"]}".replaceAll(
                                    RegExp(
                                      r'[0-9]',
                                    ),
                                    '',
                                  ),
                                )
                              ],
                            )
                          : Column(
                              children: [
                                Text(
                                  'Confused about your Packaged FOOD!',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    fontSize: 35,
                                    fontWeight: FontWeight.w700,
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                                Image.asset('assets/images/foodscan.jpg'),
                                Text(
                                  'Take a photo of your food image ',
                                  style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                              ],
                            ),
                    ],
                  ),
                ),
              ),
        floatingActionButton: SizedBox(
          height: 80,
          width: 80,
          child: FloatingActionButton(
            onPressed: pickImage,
            tooltip: 'Pickimage',
            child: const Icon(Icons.qr_code_scanner_sharp),
            backgroundColor: const Color.fromARGB(255, 185, 34, 255),
            elevation: 10,
          ),
        ),
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
    var image = await _imagePicker.pickImage(source: ImageSource.gallery);
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
