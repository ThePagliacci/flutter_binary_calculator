//import 'dart:js_interop';
import 'package:flutter/material.dart';
import 'main.dart';
import 'converting_binary.dart';
import 'binary_addition_multiplication.dart';
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

  var binaryButtonlar = ["0", "1", ".", "CE", "DEL", " ", "*", "+", "AND", "OR" , "="];
  String system ="";
  String sonuc = "";
  String sonuc1 = "";
  String gg  = "";
  String g = "";
  String operator = "";
  int ptr = 2;
  bool Binary_Logic = false;

  Widget BiLogic(BuildContext context)
  {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Result",
            style: TextStyle(
              fontSize: 55.0,
              fontFamily: 'Dhurjati',
            ),
          ),
          SizedBox(width: 36.0),
          Text(
            g,
            style: TextStyle(
              fontSize: 45.0,
              fontFamily: 'Silkscreen',
            ),
          ),
        ],
      ),
    );
  }


  String convertBinaryFraction(String string, String system)
  {
    String output = "";
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
        output ="";
        if(sonuc.length > 0)
        {
          if(system == "decimal")
          {
            output = BinarytoDecimal(sonuc, ptr);
          }
          else if(system == "octal")
          {
            output = BinarytoOctal(sonuc, ptr);
          }
          else if(system == "hexa")
          {
            output = BinarytoHexa(sonuc, ptr);
          }
        }
        sonuc = "";
      }
      if(string == "OR")
        sonuc+=" OR ";
      if(string == "AND")
        sonuc+=" AND ";
      if(string == "+")
        sonuc+=" + ";
      if(string == "*")
        sonuc+=" * ";
    });
    return output;
  }

  String BinaryLogic(String string)
  {
    String output = "";
    String b1= "";
    String b2 = "";
    setState(() {
      if (int.tryParse(string) != null) {
        sonuc1 += string;
      }
      else if (string == "CE") { //delete all entered numbers
        sonuc1 = "";
        Binary_Logic = false;
        operator = "";
      }
      else if (string == "DEL") { //delete last entered number
        if (sonuc1.length > 0) { // if the last entered was an operator
          if (sonuc1[sonuc1.length - 1] == "+" ||
              sonuc1[sonuc1.length - 1] == "*" ){
            operator = "";
          }
          sonuc1 = sonuc1.substring( 0, sonuc1.length - 1); //if the last entered was a number
        }
      }
      else if (string == "=") { // handling the result
        if (sonuc1.length > 0 && operator.length != 0) {
          var sayilar = sonuc1.split(operator);
          if (sayilar.length == 2) {
            int sayi1 = int.parse(sayilar[0]);
            int sayi2 = int.parse(sayilar[1]);
            b1 = sayi1.toString();
            b2 = sayi2.toString();
            if (operator == "+") {
              print(sonuc1);
              sonuc1 = binaryAdd(b1,b2);
            } else if (operator == "*") {
              sonuc1 = binaryMultiply(b1, b2);
            } else if (operator == "AND") {
              if(sayi1 ==1 && sayi2 == 1) sonuc1 = "1";
              else sonuc1 = "0";
            } else if (operator == "OR") {
              if (sayi1 == 1 || sayi2 == 1)
                sonuc1 = "1";
              else
                sonuc1 = "0";
            }
            operator = ""; //reset
          }
        }
        output = sonuc1;
        Binary_Logic = true;
      }
      else {
        if (operator == "") { //updating the operator value
          operator = string;
          sonuc1 += string;
        }
      }
    });

    return output;
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
                  crossAxisCount: 6, crossAxisSpacing: 20, mainAxisSpacing: 20,childAspectRatio: 2.0,),
                itemBuilder: (context, index) {
                  return InkWell(
                    splashColor: Colors.black,
                    onTap: () {
                      setState(() {
                        gg = convertBinaryFraction(binaryButtonlar[index], system);
                        g = BinaryLogic(binaryButtonlar[index]);
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

            Container(
              child: Binary_Logic ?
              BiLogic(context)
                  : SizedBox(), // Conditionally display the widget
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
                        gg,
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