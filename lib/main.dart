import 'package:flutter/material.dart';
import 'constants.dart';
import 'test_veri.dart';
import 'alert_dialog.dart';
void main() {
  runApp(BilgiTesti());
}
class BilgiTesti extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo[700],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: SoruSayfasi(),
          ),
        ),
      ),
    );
  }
}

class SoruSayfasi extends StatefulWidget {
  @override
  State<SoruSayfasi> createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  List <Widget> options=[];
  TestVeri test=TestVeri();
  Alert alert=Alert();
  int trueCount=0;
  int falseCount=0;

  void pressButton(bool durum){
    bool trueAnswer=test.getAnswer();
    setState(() {

      if (trueAnswer==durum) {
        options.add(trueIcon);
        trueCount++;
      }
      else{
        options.add(falseIcon);
        falseCount++;
      }
      if (test.isLast()) {

        alert.alertDialogEx(context,trueCount,falseCount);
        test.resetTest();
        options=[];
      }

      test.nextOues();

    });
  }
  @override  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                test.getQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 5,
          runSpacing: 10,
          children: options,
        ),
        Expanded(
            flex: 1,
            child:Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.0),

              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6),
                      child: ElevatedButton(
                        onPressed: () {
                          pressButton(false);
                        },
                         style: ElevatedButton.styleFrom(
                          primary: Colors.red[400],
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.thumb_down,
                                size: 30.0,
                                color: Colors.white,
                              ),
                              SizedBox(width: 8),
                              Text(
                                "False",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6),
                      child: ElevatedButton(
                        onPressed: () {
                        pressButton(true);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green[400],
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.thumb_up,
                                size: 30.0,
                                color: Colors.white,
                              ),
                              SizedBox(width: 8),
                              Text(
                                "True",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],

              ),

            )
        ),

      ],
    );
  }
}

