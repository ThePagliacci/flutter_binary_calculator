import 'package:flutter/material.dart';


class Ascii_Conversion extends StatefulWidget {
  const Ascii_Conversion({super.key});

  @override
  State<Ascii_Conversion> createState() => _Ascii_ConversionState();
}

class _Ascii_ConversionState extends State<Ascii_Conversion> {
  var binaryButtonlar = ["0", "1", "CE", "DEL", " "];

  var asciiButtonlar =  ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O",
                                    "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "CE", "DEL", " "];
  String system ="";
  String sonuc = "";
  int ptr = 2;
  /*void convertBinaryFraction(String string, String system)
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

   */
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
              height: 100.0,
              width: 900.0,
              margin: EdgeInsets.all(8.0),
              padding: EdgeInsets.all(8.0),
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(), // Disable scrolling
                itemCount: binaryButtonlar.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5, crossAxisSpacing: 20, mainAxisSpacing: 20,childAspectRatio: 3.0,),
                itemBuilder: (context, index) {
                  return InkWell(
                    splashColor: Colors.black,
                    onTap: () {
                      setState(() {
                        //convertBinaryFraction(binaryButtonlar[index], system);
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
                          if (index == 4) // Conditionally add icon for the first grid item
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
                        child: Text("ASCII",
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
                      /* child: Text(
                         output,
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontFamily: "Silkscreen",
                          fontSize: 45,
                          height: 2,
                        ),
                      ),
              */
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 400.0,
              width: 1000.0,
              margin: EdgeInsets.all(8.0),
              padding: EdgeInsets.all(8.0),
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(), // Disable scrolling
                itemCount: asciiButtonlar.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7, crossAxisSpacing: 20, mainAxisSpacing: 20,childAspectRatio: 3),
                itemBuilder: (context, index) {
                  return InkWell(
                    splashColor: Colors.black,
                    onTap: () {
                      setState(() {
                        //convertBinaryFraction(binaryButtonlar[index], system);
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
                              fontFamily: "Silkscreen",
                              color: Colors.white,
                            ),
                          ),
                          if (index == 28) // Conditionally add icon for the first grid item
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
              ),
            ) ,
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
