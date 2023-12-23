import 'package:flutter/material.dart';
import 'converting_ascii.dart';
import 'main.dart';

class Ascii_Conversion extends StatefulWidget {
  const Ascii_Conversion({super.key});

  @override
  State<Ascii_Conversion> createState() => _Ascii_ConversionState();
}

class _Ascii_ConversionState extends State<Ascii_Conversion> {
  var binaryButtonlar = ["0", "1", "CE", "DEL", " "];

  var asciiButtonlar = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z",
    "a",
    "b",
    "c",
    "d",
    "e",
    "f",
    "g",
    "h",
    "i",
    "j",
    "k",
    "l",
    "m",
    "n",
    "o",
    "p",
    "q",
    "r",
    "s",
    "t",
    "u",
    "v",
    "w",
    "x",
    "y",
    "z",
    "CE",
    "DEL",
    "_"
  ];
  String sonuc = "";
  String sonuc1 = "";
  String gg1 = "";
  String gg0 = "";
  bool MassWidget = false;

  Widget mass(BuildContext context) {
    return Container(
      child: Text(
        "Please Enter 7-bits Binary digits",
        style: TextStyle(fontSize: 20.0,
            fontFamily: 'Dhurjati',
            color: Colors.red
        ),
      ),
    );
  }

  String ConvertBinary(String string)
  {
    String output = "";
    setState(() {
      if (int.tryParse(string) != null)
        sonuc += string;
      else if (string == "CE") {
        MassWidget = false;
        sonuc = "";
        sonuc1 = "";
        gg0 = "";
        gg1 = "";
      }
      else if (string == "DEL") sonuc = sonuc.substring(0, sonuc.length - 1);
      else if (string == " ") {
        if (sonuc.length > 0) {
            if (sonuc.length % 7 == 0) {
              output = BinarytoAscii(sonuc);
            }
            else if (sonuc.length % 7 != 0) {
              MassWidget = true;
            }
          }
         sonuc = "";
      }
    });
    return output;
  }

  String ConvertAscii(String string)
  {
    String output = "";
    setState(() {
      if (string.isNotEmpty && string != "CE" && string != "DEL" && string!= "_")
      {
        sonuc1 += string;
      }
      else if (string == "CE") {
        sonuc = "";
        gg0 = "";
        gg1 = "";
        sonuc1 = "";
      }
      else if (string == "DEL") sonuc1 = sonuc1.substring(0, sonuc1.length - 1);
      else if (string == "_") {
        if (sonuc1.length > 0) {
          output = AsciitoBinary(sonuc1);
        }
        print(sonuc1);
        sonuc1 = "";
      }
    });
    return output;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.indigo.shade200,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("binary",
                    style: TextStyle(
                      fontSize: 55.0,
                      fontFamily: 'Dhurjati',
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  ColoredBox(
                    color: Colors.grey.shade300,
                    child: SizedBox(
                      height: 100,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.9,
                      child: Text(
                        gg0 == ""? sonuc: gg0,
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontFamily: "Silkscreen",
                          fontSize: 45,
                          height: 2,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 100.0,
              width: 900.0,
              margin: EdgeInsets.all(8.0),
              padding: EdgeInsets.all(8.0),
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(), // Disable scrolling
                itemCount: binaryButtonlar.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 3.0,),
                itemBuilder: (context, index) {
                  return InkWell(
                    splashColor: Colors.black,
                    onTap: () {
                      setState(() {
                        gg1 = ConvertBinary(binaryButtonlar[index]);
                      });
                    },
                    child: Container(
                      color: Colors.grey.shade700,
                      alignment: Alignment.center,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Text(
                            binaryButtonlar[index],
                            style: TextStyle(
                              fontSize: 29.0,
                              fontFamily: "Silkscreen",
                              color: Colors.white,
                            ),
                          ),
                          if (index ==
                              4) // Conditionally add icon for the first grid item
                            Icon(
                              Icons.swap_vert_circle,
                              // Replace with the desired icon
                              size: 40.0,
                              color: Colors.white,
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              child: MassWidget
                  ? mass(context)
                  : SizedBox(), // Conditionally display the widget
            ),

            Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      padding: EdgeInsets.all(15.0),
                      child: Text("ASCII",
                        style: TextStyle(
                          fontSize: 55.0,
                          fontFamily: 'Dhurjati',
                        ),
                      )),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  ColoredBox(
                    color: Colors.grey.shade300,
                    child: SizedBox(
                      height: 100,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.9,
                      child: Text(
                        gg1== "" ? sonuc1: gg1,
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontFamily: "Dhurjati",
                          fontSize: 45,
                          height: 2,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 500.0,
              width: 1000.0,
              margin: EdgeInsets.all(8.0),
              padding: EdgeInsets.all(8.0),
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(), // Disable scrolling
                itemCount: asciiButtonlar.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 8,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 2),
                itemBuilder: (context, index) {
                  return InkWell(
                    splashColor: Colors.black,
                    onTap: () {
                      setState(() {
                        gg0 = ConvertAscii(asciiButtonlar[index]);
                      });
                    },
                    child: Container(
                      color: Colors.grey.shade700,
                      alignment: Alignment.center,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Text(
                            asciiButtonlar[index],
                            style: TextStyle(
                              fontSize: 29.0,
                              fontFamily: "Dhurjati",
                              color: Colors.white,
                            ),
                          ),
                          if (index ==
                              54) // Conditionally add icon for the first grid item
                            Icon(
                              Icons.swap_vert_circle,
                              // Replace with the desired icon
                              size: 40.0,
                              color: Colors.white,
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(50.0),
              child:
              Align(
                alignment: Alignment.center,
                child: IconButton(
                  iconSize: 50.0,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.home,
                    size: 50.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
