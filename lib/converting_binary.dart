import 'package:flutter/material.dart';
import 'main.dart';
import 'binary_conversion.dart';
String output = "";
double total = 0; //final decimal number
double fractionTotal=0;
String foctotal ="";
double multiplier = 1;
double fmultiplier = 0.5; //Change
String decimalString = "";
String fractionalString = "";
double frac = 0;
double fracbit = 0;

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
  fractionTotal = 0;
  multiplier = 1;
  fmultiplier = 0.5;
  double fmulti = 0.125;
  total = 0;
  double kalan =0;
  double kalanf = 0;
  output = "";
  String FStirng = "";
  String DStirng = "";
  String octotal = "";
  String decimalfraction = "";
  String integerString = "";
  if(ptr == 1 )
  {
    DStirng = sonuc.substring(0, sonuc.indexOf(".")); //integer part of the binary
    FStirng = sonuc.substring(sonuc.indexOf(".") +1,sonuc.length); //fraction part of the binary
    //integer part became decimal
    for(int i = DStirng.length-1 ; i>=0; i--)
    {
      if(DStirng[i] == '1') total += multiplier;
      multiplier *=2;
    }
    //total is the decimal part
    while(total >= 1)
    {
      kalan = total%8;
      total = (total~/8).toDouble();
      octotal += kalan.toString();
    }
    octotal =  octotal.replaceAll(RegExp(r'\.0$'), '');
    for(int j= 0; j<=FStirng.length-1; j++)
    {
      if(FStirng[j] == '1') fractionTotal +=fmultiplier;
      fmultiplier *=0.5;
    }
    decimalfraction = fractionTotal.toString();
    decimalfraction =  decimalfraction.replaceAll(RegExp('^0+\\.'), '');
    for(int j = 0; j<= decimalfraction.length-1; j++)
    {
      kalanf +=fmulti;
      fmulti *=0.125;
    }
    integerString = kalanf.toString();
    integerString =  integerString.replaceAll(RegExp('^0+\\.'), '');
    output = octotal + "." +  integerString;
  }
  else
  {
    for(int i = sonuc.length-1 ; i>=0; i--)
    {
      if(sonuc[i] == '1') total += multiplier;
      multiplier *=2;
    }
    //total has become the decimal number
    //converting decimal
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
  multiplier = 1;
  fractionTotal = 0;
  fmultiplier = 0.5;
  double fmulti = 0.0625;
  total = 0;
  foctotal = "";
  double kalan =0;
  double kalanf = 0;
  String FStirng = "";
  String DStirng = "";
  String octotal = "";
  if(ptr == 1)
  {
    DStirng = sonuc.substring(0, sonuc.indexOf(".")); //integer part of the binary
    FStirng = sonuc.substring(sonuc.indexOf(".") +1,sonuc.length); //fraction part of the binary
    //integer part became decimal
    for(int i = DStirng.length-1 ; i>=0; i--)
    {
      if(DStirng[i] == '1') total += multiplier;
      multiplier *=2;
    }
    //total is the decimal part
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
    }
    octotal =  octotal.replaceAll(RegExp(r'\.0$'), '');

    for(int j= 0; j<=FStirng.length-1; j++)
    {
      if(FStirng[j] == '1') fractionTotal +=fmultiplier;
      fmultiplier *=0.5;
    }
    String decimalfraction = fractionTotal.toString();

    String integerString = decimalfraction.replaceAll('.', '').replaceFirst(RegExp('^0+'), '');
    //integerString is the integer equavlent of the fraction decimal number
    for(int j = 0; j<= integerString.length-1; j++)
    {
      kalanf +=fmulti;
      fmulti *=0.0625;
      if(kalanf>9)
      {
        foctotal += String.fromCharCode('A'.codeUnitAt(0) + kalanf.toInt() - 10);
      }
      else
      {
        foctotal += kalanf.toString();
      }
    }
    foctotal =  foctotal.replaceAll(RegExp('^0+\\.'), '');

    print (foctotal);
    print (octotal);
    output = octotal +"."+foctotal;

  }
  else
  {
    for(int i = sonuc.length-1 ; i>=0; i--)
    {
      if(sonuc[i] == '1') total += multiplier;
      multiplier *=2;
    }
    //total has become the decimal number
    //converting decimal
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
    }
    output = octotal;
    }
    print(output);
  }