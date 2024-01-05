import 'soru.dart';

class TestVeri{
  int _quesIndex=0;

  List<Soru> _questions=[
    Soru(soruMetni: "Titanic gelmiş geçmiş en büyük gemidir", yanit: false),
    Soru(soruMetni: "Dünyadaki tavuk sayısı insan sayısından fazladır", yanit: true),
    Soru(soruMetni: "Kelebeklerin ömrü bir gündür", yanit: false),
    Soru(soruMetni: "Dünya düzdür", yanit: false),
    Soru(soruMetni:  "Kaju fıstığı aslında bir meyvenin sapıdır", yanit: true),
    Soru(soruMetni:  "Fatih Sultan Mehmet hiç patates yememiştir", yanit: true),
    Soru(soruMetni:  "Fransızlar 80 demek için, 4 - 20 der", yanit: true),
  ];
  String getQuestion(){
    return _questions[_quesIndex].soruMetni;
  }
  bool getAnswer(){
    return _questions[_quesIndex].yanit;
  }

  void nextOues(){
    if (_quesIndex+1<_questions.length) {
      _quesIndex++;
    }
  }
  bool isLast(){
    return _quesIndex + 1 == _questions.length ;
  }

  void resetTest(){
    _quesIndex=0;
  }
}

