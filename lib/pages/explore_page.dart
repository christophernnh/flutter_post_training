import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
	  body: ListView(
    children: [
      Container(
        margin: const EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 15),
        child: const Text("What's New", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
      ),
      CarouselSlider(
        items: [
          Container(
            margin: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: AssetImage("assets/banner1.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: AssetImage("assets/banner2.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: AssetImage("assets/banner3.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ], 
        options: CarouselOptions(
            height: 175.0,
            // enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 36 / 6,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            viewportFraction: 0.9,
          ),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Trending", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset("assets/headline_image.png"),
                const SizedBox(height: 10),
                const Text("Tempati Booth Paling Besar, Toyota Hadir dengan 3 Brand Sekaligus di GIIAS 2022", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
                const Text("Membawa semangat Let’s Go Beyond, Toyota kembali memeriahkan perhelatan Gaikindo Indonesia International Auto Show (GIIAS).", style: TextStyle(fontSize: 12)),
                const SizedBox(height: 30),
                Image.asset("assets/headline_image2.png"),
                const SizedBox(height: 10),
                const Text("Highlights from Toyota Connected Day 2018", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
                const Text("Discover the meaning of 'Connected' at Toyota.", style: TextStyle(fontSize: 12)),
                const SizedBox(height: 30),
              ],
            ),
          ),
    ]),
    );
  }
}