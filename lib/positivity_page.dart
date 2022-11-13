import 'package:flutter/material.dart';
import 'package:meigen/note_card.dart';


class positivity_page extends StatelessWidget {
  positivity_page({Key? key}) : super(key: key);


Map meigens = {
    0: {'meigen': '人生は、大いなる戦場である。', 'person': '島崎藤村'},
    1: {'meigen': '歩け、歩け。続ける事の大切さ', 'person': '伊能忠敬'},
  };
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('人生の名言'),
      ),
 
      body: Center(
        // child: FutureBuilder<List>(
        //   future: dBProvider.getMeigens(),
        //   initialData: [],
        //   builder: (BuildContext context, snapshot) {
        //     var data = snapshot.data;
        //     var datalength = data!.length;

        //     return datalength == 0
        //       ? const Center(
        //         child: Text('no data found'),
        //       )
        //       : ListView.builder(
        //         itemCount: datalength,
        //         itemBuilder: (context, i) { 
        //           var id = data[i].id;
        //           return NoteCard(
        //             id: data[i].id,
        //             title: data[i].meigen, 
        //             author:data[i].author
        //           );
        //         }
        //       );
        //   }),
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