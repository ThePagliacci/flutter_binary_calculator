import 'package:flutter/material.dart';
import 'main.dart';
import 'binary_calculation.dart';
double kalan =0;
int kalanf = 0;
double kal = 0;
double frac = 0;
String output = "";
String ctotal = ""; //binary fraction part
String octotal = ""; //binary integer part
double total =0; //integer decimal part
double foctotal =0;//fraction decimal part
String Dstring = "";
int length =6;
String Fstring = "" ;
void DecimaltoBinary(String sonuc, int ptr) //ptr 1 = fraction 2 = integer
{
  double multiplier = 2;
  output = "";
  kalan =0;
  kalanf = 0;
  ctotal = ""; //binary fraction part
  octotal = ""; //binary integer part
  total =0; //integer decimal part
  foctotal =0;//fraction decimal part
  Dstring = "";
  Fstring = "" ;

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
    while(foctotal != 1.00 && length > 1) //work on the condition
        {
      String getfraction = "0" + foctotal.toString().
      substring(foctotal.toString().indexOf("."),
          foctotal.toString().length);
      kalanf = foctotal.truncate();
      ctotal += kalanf.toString();
      foctotal = double.parse(getfraction);
      foctotal *= multiplier;
      length --;
    }
    output = octotal + "." + ctotal;

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
    output = octotal;
  }
  print(output);
}
void DecimaltoOctal(String sonuc,int ptr)
{
  output = "";
  double multiplier = 8;
  kal = 0;
  kalan = 0;
  kalanf = 0;
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
    while(foctotal != 1.00 && length > 1) //work on the condition
        {
      String getfraction = "0" + foctotal.toString().
      substring(foctotal.toString().indexOf("."),
          foctotal.toString().length);
      kalanf = foctotal.truncate();
      ctotal += kalanf.toString();
      foctotal = double.parse(getfraction);
      foctotal *= multiplier;
      ctotal = ctotal.replaceFirst(RegExp('^0+'), '');

      length --;
    }
    output = octotal + "." + ctotal;

  }
  else //integer number
      {

    total = double.parse(sonuc);
    while(total >= 1)
    {
      kalan = total%8;
      total = (total~/8).toDouble();
      octotal += kalan.toString();
    }
    octotal = octotal.split('').reversed.join();
    octotal =  octotal.replaceAll(RegExp(r'\.0$'), '');
    output = octotal;
  }
  print(output);
}
void DecimaltoHexa(String sonuc,int ptr)
{
  output = "";
  double multiplier = 16;
  kal = 0;
  kalan = 0;
  kalanf = 0;
  total = 0;

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
          foctotal *= multiplier;
          length --;
    }
    ctotal = ctotal.replaceFirst(RegExp('^0+'), '');
    output = octotal + "." + ctotal;
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
    output = octotal;
  }
  print(output);
}
