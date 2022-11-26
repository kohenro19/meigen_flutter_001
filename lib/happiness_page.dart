import 'package:flutter/material.dart';
import 'package:meigen/note_card.dart';


class happiness_page extends StatelessWidget {
  happiness_page({Key? key}) : super(key: key);


Map meigens = {
     0: {'meigen': '大切なのは、人生を楽しむこと。そして幸せでいること。それがすべてよ', 'person': 'オードリー・ヘップバーン（女優）'},
     1: {'meigen': '他人の人生と比べずに、自分の人生を楽しみなさい。', 'person': 'ニコラ・ド・コンドルセ（フランスの数学者）'},
     2: {'meigen': '幸福は自分次第である。', 'person': 'アリストテレス（古代ギリシャの哲学者）'},
    //  3: {'meigen': 'ビジネスで成功する一番の方法は、人からいくら取れるかをいつも考えるのではなく、人にどれだけのことをしてあげられるかを考えることである。', 'person': 'デール・カーネギー（米国の実業家）'},
    //  4: {'meigen': '戦術とは、一点に全ての力をふるうことである。', 'person': 'ナポレオン・ボナパルト（フランスの皇帝）'},
    //  5: {'meigen': '私はイチゴクリームが大好物だが、魚はどういうわけかミミズが大好物だ。だから魚釣りをする場合、自分のことは考えず、魚の好物のことを考える。', 'person': 'デール・カーネギー（米国の実業家）'},
    //  6: {'meigen': 'たとえ平凡で小さなことでも、それを自分なりに深く噛みしめ味わえば大きな体験に匹敵します。', 'person': '松下幸之助（パナソニック創業者）'},
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
        title: const Text('幸福を引き寄せるマインドセット',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        )
      ),
 
      body: Center(
        child: ListView.builder(
          itemCount: meigens.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
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