//import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'main.dart';
import 'converting_binary.dart';
void main() => runApp(MaterialApp(
  home:Binary_Conversion(),
  routes: {
    '/': (context) => MyApp(),
  },
),
);
class Binary_Conversion extends StatefulWidget {
  const Binary_Conversion({super.key});

  @override
  State<Binary_Conversion> createState() => _Binary_ConversionState();
}

class _Binary_ConversionState extends State<Binary_Conversion> {

  var binaryButtonlar = ["0", "1", ".", "CE", "DEL", "Convert"];

  var butonlar = ["0", "1", ".", "2", "3", "4", "5"
                            , "6", "7", "8", "9", "B", "A",
                              "C", "D","E", "F", "CE", "DEL", "Convert"];
  String system ="";
  String sonuc = "";
  int ptr = -1;
  void convertBinaryFraction(String string, String system)
  {
    setState(() {

      if(int.tryParse(string) !=null) sonuc +=string;
      else if(string == "CE") sonuc = "";
      else if(string == "DEL") sonuc = sonuc.substring(0, sonuc.length - 1);
      else if(string == ".")
      {
        string.contains('.')? ptr = 1: ptr = -1;
        sonuc += ".";
      }
      else if(string == "Convert")
      {
        if(sonuc.length > 0)
        {
          if(system == "decimal") BinarytoDecimal(sonuc, ptr);
          if(system == "octal") BinarytoOctal(sonuc, ptr);
          if(system == "hexa") BinarytoHexa(sonuc, ptr);
          sonuc = "";
        }
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Text(
                      sonuc,
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
            height: 200.0,
            width: 400.0,
            margin: EdgeInsets.all(8.0),
            padding: EdgeInsets.all(8.0),
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(), // Disable scrolling
              itemCount: binaryButtonlar.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 6, crossAxisSpacing: 15, mainAxisSpacing: 15),
              itemBuilder: (context, index) {
                return InkWell(
                  splashColor: Colors.black,
                  onTap: () {
                    setState(() {
                      convertBinaryFraction(binaryButtonlar[index], system);
                    });
                  },
                  child: Container(
                    color: Colors.black,
                    alignment: Alignment.center,
                    child: Text(
                      binaryButtonlar[index],
                      style: TextStyle(
                        fontSize: 19.0,
                        fontFamily: "Silkscreen",
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              },
            ) ,
          ),

          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(20.0),
                  child:ElevatedButton(onPressed: (){
                    setState(() {
                      system = "decimal";
                    });                  },
                 child: Text("Decimal")),
                ),
                Container(
                  margin: EdgeInsets.all(20.0),
                  child:ElevatedButton(onPressed: (){
                    setState(() {
                    system = "hexa";
                  });
                },
                   child: Text("Hexadecimal")),
                ),
                Container(
                  margin: EdgeInsets.all(20.0),
                  child:ElevatedButton(onPressed: (){
                    setState(() {
                      system = "octal";
                    });
                  },
                 child: Text("Octal")),
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
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Text(
                      output,
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
            height: 500.0,
            width: 800.0,
            margin: EdgeInsets.all(8.0),
            padding: EdgeInsets.all(8.0),
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(), // Disable scrolling
              itemCount: butonlar.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 10, crossAxisSpacing: 35, mainAxisSpacing: 35),
              itemBuilder: (context, index) {
                return InkWell(
                  splashColor: Colors.black,
                  onTap: () {
                    setState(() {
                      convertBinaryFraction(butonlar[index], system);
                    });
                  },
                  child: Container(
                    color: Colors.black,
                    alignment: Alignment.center,
                    child: Text(
                      butonlar[index],
                      style: TextStyle(
                        fontSize: 19.0,
                        fontFamily: "Silkscreen",
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              },
            ) ,
          ),

          Padding(
            padding: EdgeInsets.all(10.0),
            child:
            IconButton(
              onPressed: ()
              {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.home, size: 50.0,),

            ),
          ),
        ],
      ),
      ),
    );
  }
}