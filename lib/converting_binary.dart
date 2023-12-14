import 'package:flutter/material.dart';
import 'main.dart';
import 'binary_conversion.dart';
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
double fractionTotal = 0;
double multiplier = 1;
double fmultiplier = 0.5;
String decimalString = "";
String fractionalString = "";

void BinarytoDecimal(String sonuc, int ptr)
{
  total = 0;
  fractionTotal = 0;
  multiplier = 1;
  fmultiplier = 0.5;
  output = "";

  if(ptr == 1 )
  {
    decimalString = sonuc.substring(0, sonuc.indexOf("."));
    fractionalString = sonuc.substring(sonuc.indexOf(".")+1, sonuc.length);
    for(int j= decimalString.length-1; j>=0; j--)
    {
      if(decimalString[j] == '1') total +=multiplier;
      multiplier *=2;
    }
    for(int j= 0; j<=fractionalString.length-1; j++)
    {
      if(fractionalString[j] == '1') fractionTotal +=fmultiplier;
      fmultiplier *=0.5;
    }
    output = (total + fractionTotal).toString();
  }
  else
  {
    for(int i = sonuc.length-1 ; i>=0; i--)
    {
      if(sonuc[i] == '1') total += multiplier;
      multiplier *=2;
    }
    output = total.toString();
  }
  print(output);
}
void BinarytoOctal(String sonuc,int ptr)
{
  output = "";
  double multi = 8;
  kal = 0;
  kalan = 0;
  kalanf = 0;
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
    output = octotal + "." + ctotal;

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
    output = octotal;
  }
  print(output);
}
void BinarytoHexa(sonuc, ptr)
{
  output = "";
  double multi = 16;
  kal = 0;
  kalan = 0;
  kalanf = 0;
  total = 0;
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
      octotal =  octotal.replaceAll(RegExp(r'\.0$'), '');
    }
    octotal = octotal.split('').reversed.join();

    //foctotal = double.parse(Fstring);
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
    output = octotal + "." + ctotal;
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
        octotal += kalan.toString();
      octotal =  octotal.replaceFirst(RegExp(r'0+(\.0+)?$'), '');
      octotal = octotal.split('').reversed.join();
    }
    output = octotal;
  }
  print(output);
}

void main()
{
  BinarytoOctal("1110.111" , 1);
}

