import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'globals.dart';

class Viewpage extends StatefulWidget {
  const Viewpage({Key? key}) : super(key: key);

  @override
  State<Viewpage> createState() => _ViewpageState();
}

class _ViewpageState extends State<Viewpage> {
  @override
  Widget build(BuildContext context) {
    int data = ModalRoute.of(context)!.settings.arguments as int;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              flex: 7,
              child: CarouselSlider(
                items: Globals.Imageview.map((e) {
                  int index = Globals.Imageview.indexOf(e);
                  index > 3 ? index = 0 : index;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Container(
                      height: size.height * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: NetworkImage(
                                "${Globals.Imageview[data]['image'][index]}"),
                            fit: BoxFit.cover),
                      ),
                    ),
                  );
                }).toList(),
                options: CarouselOptions(
                  autoPlay: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${Globals.Imageview[data]['name']}",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
