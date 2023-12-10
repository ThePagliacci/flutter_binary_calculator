//import 'dart:js_interop';
import 'package:flutter/material.dart';
import 'ascii_conversion.dart';
import 'binary_conversion.dart';
import 'binary_calculation.dart';

void main() => runApp(MaterialApp(
  home:MyApp(),
  routes: {
        '/binary_conversion': (context) => Binary_Conversion(),
        '/binary_calculation': (context) => Binary_Calculation(),
        '/ascii_conversion': (context) => Ascii_Conversion(),
  },
  initialRoute: '/',
),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Binary Craftor",
                  style: TextStyle(
                    fontSize: 30,
                    letterSpacing: 2.0,
                    fontFamily: 'Dhurjati',
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: (){
                  Navigator.pushNamed(context, '/ascii_conversion');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey.shade300,
                    textStyle: TextStyle(
                      fontFamily: 'Dhurjati',
                      fontSize: 40.0,
                    ),
                  ),
                  child:Container(
                    width: 200.0,
                    height: 300.0,
                    padding: EdgeInsets.all(20.0),
                    margin: EdgeInsets.all(10.0),
                    child: Center(
                      child: Text("ASCII Conversion"),
                    ),
                  ),
                ),

                ElevatedButton(onPressed: (){
                  Navigator.pushNamed(context,'/binary_calculation');
                },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade300,
                    textStyle: TextStyle(
                      fontFamily: 'Dhurjati',
                      fontSize: 40.0,
                    ),
                  ),
                  child: Container(
                    width: 200.0,
                    height: 300.0,
                    padding: EdgeInsets.all(20.0),
                    margin: EdgeInsets.all(10.0),
                    child: Center(
                        child: Text("Binary Calculation")),
                  ),
                ),
                ElevatedButton(onPressed: (){
                  Navigator.pushNamed(context, '/binary_conversion');
                },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo.shade300,
                    textStyle: TextStyle(
                      fontFamily: 'Dhurjati',
                      fontSize: 40.0,
                    ),
                  ),
                  child: Container(
                    width: 200.0,
                    height: 300.0,
                    padding: EdgeInsets.all(20.0),
                    margin: EdgeInsets.all(10.0),
                    child: Center(
                      child: Text("Binary Conversion"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}