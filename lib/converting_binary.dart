import 'package:flutter/material.dart';
import 'main.dart';
import 'binary_conversion.dart';

String BinarytoDecimal(String sonuc, int ptr)
{
  String decimalString = "";
  String fractionalString = "";
  double total = 0;
  double fractionTotal = 0;
  double multiplier = 1;
  double fmultiplier = 0.5;
  String decimalOutput ="";

  if(ptr == 1 ) {
    int dotIndex = sonuc.indexOf(".");
    if (dotIndex != -1) {
      decimalString = sonuc.substring(0, sonuc.indexOf("."));
      fractionalString = sonuc.substring(sonuc.indexOf(".") + 1, sonuc.length);
      for (int j = decimalString.length - 1; j >= 0; j--) {
        if (decimalString[j] == '1') total += multiplier;
        multiplier *= 2;
      }
      for (int j = 0; j <= fractionalString.length - 1; j++) {
        if (fractionalString[j] == '1') fractionTotal += fmultiplier;
        fmultiplier *= 0.5;
      }
      decimalOutput = (total + fractionTotal).toString();
    }
  }
  else
  {
    for(int i = sonuc.length-1 ; i>=0; i--)
    {
      if(sonuc[i] == '1') total += multiplier;
      multiplier *=2;
    }
    decimalOutput = total.toString();
  }
  return decimalOutput;
  //print(decimalOutput);

}
String BinarytoOctal(String sonuc,int ptr)
{
  double multi = 8;
  double kal = 0;
  String octalOutput ="";
  double fmultiplier = 0.5;
  double kalan = 0;
  int length =6;
  int kalanf = 0;
  String Dstring = "";
  double foctotal =0;//fraction decimal part
  String Fstring = "" ;
  String ctotal = ""; //binary fraction part
  String fractionalString = "";
  double multiplier = 1;
  double total = 0;
  String octotal ="";
  if(ptr == 1) //fractional number
      {
    Dstring = sonuc.substring(0, sonuc.indexOf(".")); //integer part of the binary
    Fstring = "0" + sonuc.substring(sonuc.indexOf("."),sonuc.length); //fraction part of the binary

    for(int i = Dstring.length-1 ; i>=0; i--)
    {
      if(Dstring[i] == '1') total += multiplier;
      multiplier *=2;
    }
    while(total >= 1)
    {
      kalan = total%8;
      total = (total~/8).toDouble();
      octotal += kalan.toString();
      octotal =  octotal.replaceAll(RegExp(r'\.0$'), '');
    }
    octotal = octotal.split('').reversed.join();

    fractionalString = sonuc.substring(sonuc.indexOf(".")+1, sonuc.length);
    for(int j= 0; j<=fractionalString.length-1; j++)
    {
      if(fractionalString[j] == '1') foctotal +=fmultiplier;
      fmultiplier *=0.5;
    }
    //fraction to binary
    while(foctotal != 1.00 && length > 1) //work on the condition
        {
      String getfraction = "0" + foctotal.toString().
      substring(foctotal.toString().indexOf("."),
          foctotal.toString().length);
      kalanf = foctotal.truncate();
      ctotal += kalanf.toString();
      foctotal = double.parse(getfraction);
      foctotal *= multi;
      ctotal = ctotal.replaceFirst(RegExp('^0+'), '');

      length --;
    }
    octalOutput = octotal + "." + ctotal;

  }
  else //integer number
   {
    for(int i = sonuc.length-1 ; i>=0; i--)
    {
      if(sonuc[i] == '1') total += multiplier;
      multiplier *=2;
    }
    while(total >= 1)
    {
      kalan = total%8;
      total = (total~/8).toDouble();
      octotal += kalan.toString();
      octotal =  octotal.replaceAll(RegExp(r'\.0$'), '');
    }
    octotal = octotal.split('').reversed.join();
    octalOutput = octotal;
  }
  return octalOutput;
  //print(octalOutput);
  }
String BinarytoHexa(sonuc, ptr)
{
  String ctotal = ""; //binary fraction part
  String octotal = ""; //binary integer part
  String hexaOutput = "";
  int length =6;
  double multi = 16;
  double kal = 0;
  double total = 0;
  double fmultiplier = 0.5;
  double kalan = 0;
  double foctotal =0;//fraction decimal part
  double multiplier = 1;
  int kalanf = 0;
  String Dstring = "";
  String Fstring = "" ;
  String fractionalString ="";
  if(ptr == 1) //fractional number
      {
    Dstring = sonuc.substring(0, sonuc.indexOf(".")); //integer part of the binary
    Fstring = "0" + sonuc.substring(sonuc.indexOf("."),sonuc.length); //fraction part of the binary

    for(int i = Dstring.length-1 ; i>=0; i--)
    {
      if(Dstring[i] == '1') total += multiplier;
      multiplier *=2;
    }
    while(total >= 1)
    {
      kalan = total%16;
      total = (total~/16).toDouble();
      if(kalan > 9)
      {
        octotal += String.fromCharCode('A'.codeUnitAt(0) + kalan.toInt() - 10);
      }
      else
        octotal += kalan.toString();
      octotal = octotal.replaceAll(RegExp(r'\.0$'), '');
    }

    fractionalString = sonuc.substring(sonuc.indexOf(".")+1, sonuc.length);
    for(int j= 0; j<=fractionalString.length-1; j++)
    {
      if(fractionalString[j] == '1') foctotal +=fmultiplier;
      fmultiplier *=0.5;
    }
    //fraction to binary
    while(foctotal != 1.00 && length > 1) {
      String getfraction = "0" + foctotal.toString().
      substring(foctotal.toString().indexOf("."),
          foctotal
              .toString()
              .length);
      kalanf = foctotal.truncate();

      if (kalanf > 9) {
        ctotal += String.fromCharCode('A'.codeUnitAt(0) + kalanf.toInt() - 10);
      }
      else
        ctotal += kalanf.toString();
      foctotal = double.parse(getfraction);
      foctotal *= multi;
      length --;
    }
    ctotal = ctotal.replaceFirst(RegExp('^0+'), '');
    hexaOutput = octotal + "." + ctotal;
  }
  else //integer number
      {
    for(int i = sonuc.length-1 ; i>=0; i--)
    {
      if(sonuc[i] == '1') total += multiplier;
      multiplier *=2;
    }
    while(total >= 1)
    {
      kalan = total%16;
      total = (total~/16).toDouble();
      if(kalan > 9)
      {
        octotal += String.fromCharCode('A'.codeUnitAt(0) + kalan.toInt() - 10);
      }
      else
        {
          octotal += kalan.toString();
        }
      octotal = octotal.replaceFirst(RegExp('^0.+'), '');
    }
    hexaOutput = octotal;
  }
  return hexaOutput;
  //print(hexaOutput);
}

void main()
{
  BinarytoOctal("1110.111" , 1);
  BinarytoHexa("1110.111" , 1);
  BinarytoDecimal("1110.111" , 1);

}

