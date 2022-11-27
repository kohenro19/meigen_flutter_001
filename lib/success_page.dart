import 'package:flutter/material.dart';

class success_page extends StatelessWidget {
  success_page({Key? key}) : super(key: key);


Map meigens = {
     0: {'meigen': '歩け、歩け。続ける事の大切さ', 'person': '伊能忠敬'},
     1: {'meigen': '何であれ素晴らしいものは突如として生じるものではない。ブドウの1房、イチジクの実1つとて同じである。君がイチジクの実が欲しいというなら、私は時間が必要だと答えよう。花が咲き、実がつき、それが熟すのを待たねばならない。', 'person': 'エピクトス（奴隷出身哲学者）'},
     2: {'meigen': '最も重要な決定とは、何をするかではなく、何をしないかを決めることだ。', 'person': 'スティーブ・ジョブズ（アップル創業者）'},
     3: {'meigen': 'ビジネスで成功する一番の方法は、人からいくら取れるかをいつも考えるのではなく、人にどれだけのことをしてあげられるかを考えることである。', 'person': 'デール・カーネギー（米国の実業家）'},
     4: {'meigen': '戦術とは、一点に全ての力をふるうことである。', 'person': 'ナポレオン・ボナパルト（フランスの皇帝）'},
     5: {'meigen': '私はイチゴクリームが大好物だが、魚はどういうわけかミミズが大好物だ。だから魚釣りをする場合、自分のことは考えず、魚の好物のことを考える。', 'person': 'デール・カーネギー（米国の実業家）'},
     6: {'meigen': 'たとえ平凡で小さなことでも、それを自分なりに深く噛みしめ味わえば大きな体験に匹敵します。', 'person': '松下幸之助（パナソニック創業者）'},};
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector( // leadingは、戻りの矢印
          onTap: () {Navigator.pop(context);}, // 前のページに戻るときはpopを使う
          child: Icon(Icons.arrow_back, color: Colors.white)
          
        ),
        title: const Text('成功を掴むルール',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        )
      ),
 
      body: Center(
        child: ListView.builder(
          itemCount: meigens.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.only(
                bottom: 20  // 行間を広げる
              ),
              child: ListTile(
              // selected: true,
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