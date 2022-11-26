import 'package:flutter/material.dart';


class love_page extends StatelessWidget {
  love_page({Key? key}) : super(key: key);


Map meigens = {
    0: {'meigen': '人類は太古の昔から、帰りが遅いと心配してくれる人を必要としている。', 'person': 'マーガレット・ミード(米国の文化人類学者)'},
  };
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector( // leadingは、戻りの矢印
          onTap: () {Navigator.pop(context);}, // 前のページに戻るときはpopを使う
          child: Icon(Icons.arrow_back, color: Colors.white)
          
        ),
        title: const Text('夫婦円満の秘訣',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        )
      ),
      body: Center(
        child: ListView.builder(
          itemCount: meigens.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: ListTile(
              title: Text(meigens[index]['meigen']), // 名言
              subtitle: Text(meigens[index]["person"]), // 人物
          ),
        );
      },
        ),
      )
      
    );
  }
}