import 'package:flutter/material.dart';
import 'main.dart';
import 'converting_decimal.dart';
class Binary_Calculation extends StatefulWidget {
  const Binary_Calculation({super.key});

  @override
  State<Binary_Calculation> createState() => _Binary_CalculationState();
}

class _Binary_CalculationState extends State<Binary_Calculation> {
  var binaryButtonlar = ["1", "2", "3","4",".", "*","5", "6", "7","8", "+",
                                   "-", "9",  "0", "CE","DEL", "/" , "=", " "];
  String operator ="";
  String sonuc = "";
  String system ="";
  String gg = "";
  int ptr = 2;

  String calculator(String string, String system) {
    String output = "";
    setState(() {
      if (int.tryParse(string) != null) {
        sonuc += string;
      }
      else if (string == "CE") { //delete all entered numbers
        sonuc = "";
        operator = "";
      } else if (string == ".") {
        sonuc += string;
        ptr = 1;
      }
      else if (string == "DEL") { //delete last entered number
        if (sonuc.length > 0) { // if the last entered was an operator
          if (sonuc[sonuc.length - 1] == "+" ||
              sonuc[sonuc.length - 1] == "-" ||
              sonuc[sonuc.length - 1] == "*" ||
              sonuc[sonuc.length - 1] == "/") {
            operator = "";
          }
          sonuc = sonuc.substring( 0, sonuc.length - 1); //if the last entered was a number
        }
      } else if (string == "=") { // handling the result
        if (sonuc.length > 0 && operator.length != 0) {
          var sayilar = sonuc.split(operator);
          if (sayilar.length == 2) {
            double sayi1 = double.parse(sayilar[0]);
            double sayi2 = double.parse(sayilar[1]);
            if (operator == "+") {
              sonuc = (sayi1 + sayi2).toString();
            } else if (operator == "-") {
              sonuc = (sayi1 - sayi2).toString();
            } else if (operator == "*") {
              sonuc = (sayi1 * sayi2).toString();
            } else if (operator == "/") {
              sonuc = (sayi1 ~/ sayi2).toString();
            }
            operator = ""; //reset
          }
        }
        if(!string.contains("."))
        {
          sonuc = sonuc.substring(0, sonuc.length - 2);
        }
         print(sonuc);
      }
      else if (string == " ")
      {
        if(sonuc.length > 0) {
          if (system == "binary") output = DecimaltoBinary(sonuc, ptr);
          if (system == "octal") output = DecimaltoOctal(sonuc, ptr);
          if (system == "hexa") output = DecimaltoHexa(sonuc, ptr);
        }
      }

      else {
        if (operator == "") { //updating the operator value
          operator = string;
          sonuc += string;
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
                  Text("Decimal",
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
              height: 300.0,
              width: 900.0,
              margin: EdgeInsets.all(8.0),
              padding: EdgeInsets.all(8.0),
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(), // Disable scrolling
                itemCount: binaryButtonlar.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 6, crossAxisSpacing: 10, mainAxisSpacing: 10,childAspectRatio: 3.0,),
                itemBuilder: (context, index) {
                  return InkWell(
                    splashColor: Colors.black,
                    onTap: () {
                      setState(() {
                        gg = calculator(binaryButtonlar[index], system);
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
                          if (index == 18) // Conditionally add icon for the first grid item
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
                    system = "binary";
                  });
                },
                    child:Text("Binary",
                          style: TextStyle(
                            fontSize: 55.0,
                            fontFamily: 'Dhurjati',
                          ),
                        ),
                  ),
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
                        ),
                  ),
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
                        ),
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
