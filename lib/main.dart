import 'dart:math';

import 'package:flutter/material.dart';
import 'positivity_page.dart';
import 'motivation_page.dart';
import 'love_page.dart';
import 'note_card.dart';
import 'db_provider.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Hide the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Meigen',
      theme: ThemeData(
        primarySwatch: Colors.lime,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> meigen_category = [
    {"image": "images/positivity.jpg", "title": "前向きにになれる\n名言", "nextpage": positivity_page()},
    {"image": "images/challenge.png", "title": "モチベーションを\n上げる名言", "nextpage": motivation_page()}, 
    {"image": "images/love.jpg", "title": "恋愛・結婚の\n名言", "nextpage": love_page()}, 
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, // タイトルを中央揃えにする
        title: const Text('Word Power',
          style: TextStyle(color: Colors.white)
        ),
        elevation:2 // 境界線に影を付ける
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        // implement GridView.builder
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: meigen_category.length,
            itemBuilder: (BuildContext context, index) {
              return GestureDetector(
                onTap: () {
                   Navigator.push(context,MaterialPageRoute(builder: (context)=> meigen_category[index]['nextpage']));
                },
                  child: Container(
                    width: 200,
                    // marginは外側の余白を指定することができるプロパティ
                    // EdgeInsets.all(数値): 全方向の余白
                    // margin: EdgeInsets.all(10),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image(
                            image: AssetImage(meigen_category[index]['image']),
                              width: 400,
                              height: 400,
                              fit: BoxFit.fill,
                          ),
                        ),
                      Center(
                        child: Container(
                          child: Text(meigen_category[index]['title'],
                            textAlign:TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              
                            ),
                          ),
                        ),
                      )
                      ]
                    )
                  )
              );
            }),
      ),
    );
  }
}