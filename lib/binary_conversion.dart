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

  var binaryButtonlar = ["0", "1", ".", "CE", "DEL", " "];
  String system ="";
  String sonuc = "";
  int ptr = 2;
  void convertBinaryFraction(String string, String system)
  {
    setState(() {

      if(int.tryParse(string) !=null) sonuc +=string;
      else if(string == "CE") sonuc = "";
      else if(string == "DEL") sonuc = sonuc.substring(0, sonuc.length - 1);
      else if(string == ".")
      {
        ptr = 1;
        sonuc += ".";
      }
      else if(string == " ")
      {
        if(sonuc.length > 0)
        {
          if(system == "decimal") BinarytoDecimal(sonuc, ptr);
          if(system == "octal") BinarytoOctal(sonuc, ptr);
          if(system == "hexa") BinarytoHexa(sonuc, ptr);
        }
        sonuc = "";
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
            width: 900.0,
            margin: EdgeInsets.all(8.0),
            padding: EdgeInsets.all(8.0),
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(), // Disable scrolling
              itemCount: binaryButtonlar.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 6, crossAxisSpacing: 100, mainAxisSpacing: 0),
              itemBuilder: (context, index) {
                return InkWell(
                  splashColor: Colors.black,
                  onTap: () {
                    setState(() {
                      convertBinaryFraction(binaryButtonlar[index], system);
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
                        if (index == 5) // Conditionally add icon for the first grid item
                          Icon(
                            Icons.swap_vert_circle, // Replace with the desired icon
                            size: 40.0,
                            color: Colors.white,
                          ),
                      ],
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
                  padding: EdgeInsets.all(15.0),
                  child: InkResponse(
                  onTap: () {
                      setState(() {
                             system = "decimal";
                        });
                       },
                 child: Text("Decimal",
                     style: TextStyle(
                   fontSize: 55.0,
                   fontFamily: 'Dhurjati',
                     ),
                 )),
                ),
                Container(
                  padding: EdgeInsets.all(15.0),
                  child: InkResponse(
                      onTap: () {
                        setState(() {
                          system = "hexa";
                        });
                      },
                      child: Text("Hexadecimal",
                        style: TextStyle(
                          fontSize: 55.0,
                          fontFamily: 'Dhurjati',
                        ),
                      )),
                ),
                Container(
                  padding: EdgeInsets.all(15.0),
                  child: InkResponse(
                      onTap: () {
                        setState(() {
                          system = "octal";
                        });
                      },
                      child: Text("Octal",
                        style: TextStyle(
                          fontSize: 55.0,
                          fontFamily: 'Dhurjati',
                        ),
                      )),
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
            margin: EdgeInsets.all(50.0),
            child:
            Align(
              alignment: Alignment.center,
              child: IconButton(
                iconSize: 50.0 ,
                onPressed: ()
                {
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