import 'package:flutter/material.dart';
import 'main.dart';
import 'binary_calculation.dart';
String DecimaltoBinary(String sonuc, int ptr) //ptr 1 = fraction 2 = integer
{
  int length =6;
  double multiplier = 2;
  String binaryString = "";
  double kalan =0;
  int kalanf = 0;
  String ctotal = ""; //binary fraction part
  String octotal = ""; //binary integer part
  double total =0; //integer decimal part
  double foctotal =0;//fraction decimal part
  String Dstring = "";
  String Fstring = "" ;

  if(ptr == 1) //fractional number
      {
    Dstring = sonuc.substring(0, sonuc.indexOf(".")); //integer part of the binary
    Fstring = "0" + sonuc.substring(sonuc.indexOf("."),sonuc.length); //fraction part of the binary

    total = double.parse(Dstring);
    foctotal = double.parse(Fstring);
    while(total >= 1)
    {
      kalan = total%2;
      total = (total~/2).toDouble();
      octotal += kalan.toString();
      octotal =  octotal.replaceAll(RegExp(r'\.0$'), '');
    }
    octotal = octotal.split('').reversed.join();

    //fraction to binary
    while(foctotal != 1.0 && length > 1) //work on the condition
        {
      String getfraction = "0" + foctotal.toString().
      substring(foctotal.toString().indexOf("."),
          foctotal.toString().length);
      foctotal = double.parse(getfraction);
      foctotal *= multiplier;
      kalanf = foctotal.truncate();
      ctotal += kalanf.toString();
      if(foctotal == "1.0") {
        ctotal += "1";
        break;
      }
      length --;
    }
    binaryString = octotal + "." + ctotal;
  }
  else //integer number
      {
    total = double.parse(sonuc);
    while(total >= 1)
    {
      kalan = total%2;
      total = (total~/2).toDouble();
      octotal += kalan.toString();
      octotal =  octotal.replaceAll(RegExp(r'\.0$'), '');
    }
    octotal = octotal.split('').reversed.join();
    binaryString = octotal;
  }
  return binaryString;
}
String DecimaltoOctal(String sonuc,int ptr)
{
  int length =6;
  String octalString = "";
  double multiplier = 8;
  String Dstring = "";
  String Fstring = "" ;
  String ctotal = ""; //binary fraction part
  double kal = 0;
  double foctotal =0;//fraction decimal part
  double kalan = 0;
  String octotal = ""; //binary integer part
  int kalanf = 0;
  double total =0; //integer decimal part
  if(ptr == 1) //fractional number
      {
    Dstring = sonuc.substring(0, sonuc.indexOf(".")); //integer part of the binary
    Fstring = "0" + sonuc.substring(sonuc.indexOf("."),sonuc.length); //fraction part of the binary

    total = double.parse(Dstring);
    foctotal = double.parse(Fstring);
    while(total >= 1)
    {
      kalan = total%8;
      total = (total~/8).toDouble();
      octotal += kalan.toString();
      octotal =  octotal.replaceAll(RegExp(r'\.0$'), '');
    }
    octotal = octotal.split('').reversed.join();

    //fraction to binary
    while(foctotal != 1.0 && length > 1) //work on the condition
        {
      String getfraction = "0" + foctotal.toString().
      substring(foctotal.toString().indexOf("."),
          foctotal.toString().length);
      foctotal = double.parse(getfraction);
      foctotal *= multiplier;
      kalanf = foctotal.truncate();
      ctotal += kalanf.toString();
      if(foctotal == "1.0") {
        ctotal += "1";
        break;
      }
      length --;
    }
    octalString = octotal + "." + ctotal;
  }
  else //integer number
      {
    total = double.parse(sonuc);
    while(total >= 1)
    {
      kalan = total%8;
      total = (total~/8).toDouble();
      octotal += kalan.toString();
      octotal =  octotal.replaceAll(RegExp(r'\.0$'), '');
    }
    octotal = octotal.split('').reversed.join();
    octalString = octotal;
  }
  return octalString;
}
String DecimaltoHexa(String sonuc,int ptr)
{
  String Dstring = "";
  String Fstring = "" ;
  int length =6;
  String hexaString = "";
  double multiplier = 16;
  double kal = 0;
  double foctotal =0;//fraction decimal part
  double kalan = 0;
  String octotal = ""; //binary integer part
  String ctotal = ""; //binary fraction part
  int kalanf = 0;
  double total =0; //integer decimal part

  if(ptr == 1) //fractional number
      {
    Dstring = sonuc.substring(0, sonuc.indexOf(".")); //integer part of the binary
    Fstring = "0" + sonuc.substring(sonuc.indexOf("."),sonuc.length); //fraction part of the binary

    total = double.parse(Dstring);
    foctotal = double.parse(Fstring);
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
      octotal =  octotal.replaceAll(RegExp(r'\.0$'), '');
    }
    octotal = octotal.split('').reversed.join();
    //fraction to binary
    while(foctotal != 1.0 && length > 1) //work on the condition
        {
      String getfraction = "0" + foctotal.toString().
      substring(foctotal.toString().indexOf("."),
          foctotal.toString().length);
      foctotal = double.parse(getfraction);
      foctotal *= multiplier;
      kalanf = foctotal.truncate();
      ctotal += kalanf.toString();
      if(foctotal == "1.0") {
        ctotal += "1";
        break;
      }
      length --;
    }
    ctotal = ctotal.replaceFirst(RegExp('^0+'), '');
    hexaString = octotal + "." + ctotal;
  }
  else //integer number
  {
    total = double.parse(sonuc);
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
      octotal =  octotal.replaceAll(RegExp(r'\.0$'), '');
      octotal = octotal.split('').reversed.join();
    }
    hexaString = octotal;
  }
  return hexaString;
}

void main()
{
  print(DecimaltoBinary("14.25" , 1));
  print(DecimaltoOctal("14.25" , 1));
  print(DecimaltoHexa("14.25" , 1));

}
