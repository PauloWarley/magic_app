// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final statuses = [
      Permission.storage,
    ].request();

    SystemChrome.setEnabledSystemUIOverlays([]);
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    final pages = PageView(
      controller: _controller,
      children: [
        HomeWidget(),
        PhotosWidget(),
      ],
    );
    return pages;
  }
}

class HomeWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    final children = new Scaffold(
      body: Image.asset(
        "images/home1.jpg",
        fit: BoxFit.fill,
        height: double.infinity,
        width: double.infinity,
      ),
    );
    return new GestureDetector(
      onTapDown: _onTapDown,
      child: children,
    );
  }

  _onTapDown(TapDownDetails details) {
    var x = details.globalPosition.dx;
    var y = details.globalPosition.dy;
    print(details.localPosition);
    int dx = (x / 80).floor();
    int dy = ((y - 180) / 100).floor();
    int posicao = dy * 5 + dx;

    print("results: x =$x y=$y $dx $dx $posicao");

    _save(posicao);
  }

  _save(int posicao) async {
    var appDocDir = await getTemporaryDirectory();
    String savePath = appDocDir.path + "/efeito-$posicao.jpg";
    print(savePath);
    // await Dio().download(

    // )

    print("Saved!");
    // final result = await ImageGallerySaver.saveFile(savePath);
    // print(result);
  }
}

class PhotosWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    final children = new Scaffold(
      body: Image.asset(
        "images/home2.jpg",
        fit: BoxFit.fill,
        height: double.infinity,
        width: double.infinity,
      ),
    );
    return new GestureDetector(
      onTapDown: _onTapDown,
      child: children,
    );
  }

  _onTapDown(TapDownDetails details) {
    var x = details.globalPosition.dx;
    var y = details.globalPosition.dy;
    print(details.localPosition);
    int dx = (x / 80).floor();
    int dy = ((y - 180) / 100).floor();
  }
}


// Your name
// Koe no katachi
// Túmulo de vaga-lumes
// Crianças lobo 
// Whethering with you