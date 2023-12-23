import 'package:flutter/material.dart';
import 'ascii_conversion.dart';
import 'main.dart';
String AsciitoBinary(String string)
{
  //take string's decimal value
  List<int> decimalValues = List<int>.filled(string.length, 0);
  int kalan =0;
  String finalString = "";
  for(int i=0; i<string.length; i++)
    {
      decimalValues[i] = string[i].codeUnits[0];
    }
  //convert decimal to binary
  for(int j=0 ; j<decimalValues.length; j++)
    {
      int total = decimalValues[j];
      String octotal = ""; //binary integer part
      while(total >= 1)
      {
        kalan = total%2;
        total = (total~/2);
        octotal += kalan.toString();
        octotal =  octotal.replaceAll(RegExp(r'\.0$'), '');
      }
      octotal = octotal.split('').reversed.join();
      finalString +=octotal;
    }
  return finalString;
}
String BinarytoAscii(String string)
{
  //convert binary value to decimal
    int total = 0;
    int multiplier = 1;
    String finalString ="";
    List<String> resultList = [];
    int chunkSize = 7;
    if(string.length %chunkSize !=0)
      {
        print("not the right size");
      }
    else{
      for (int i = 0; i < string.length; i += chunkSize) {
        resultList.add(string.substring(i, i + chunkSize));
      }
      //seperate strings
      for (int j = 0; j < resultList.length; j++) {
        total = 0;
        multiplier = 1;
        for (int k = resultList[j].length - 1; k >= 0; k--) {
          if (resultList[j][k] == '1') total += multiplier;
          multiplier *= 2;
        }
        finalString += String.fromCharCode(total);
      }
    }
      //convert decimal to ascii
    return finalString;
}
void main()
{
  AsciitoBinary("he");
  //BinarytoAscii("11010001101000");
}