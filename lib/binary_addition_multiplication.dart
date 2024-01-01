import 'package:flutter/material.dart';
import 'main.dart';
import 'binary_conversion.dart';
String binaryMultiply(String binary1, String binary2) {
  int i = 0, remainder = 0;
  List<int> sum = List.filled(20, 0);
  int b1 = int.tryParse(binary1) ?? 0;
  int b2 = int.tryParse(binary2) ?? 0;
  int binaryProd = 0;
  String sonuc = "";

  while (b1 != 0 || b2 != 0) {
    sum[i++] = (b1 % 10 + b2 % 10 + remainder) % 2;
    remainder = (b1 % 10 + b2 % 10 + remainder) ~/ 2;
    b1 = b1 ~/ 10;
    b2 = b2 ~/ 10;
  }

  if (remainder != 0) {
    sum[i++] = remainder;
  }

  --i;
  while (i >= 0) {
    binaryProd = binaryProd * 10 + sum[i--];
  }

  sonuc = binaryProd.toString();
  return sonuc;
}

String binaryAdd(String binary1, String binary2) {
  int i = 0, remainder = 0;
  List<int> sum = List.filled(20, 0);
  String sonuc ="";
  int b1 = int.tryParse(binary1) ?? 0;
  int b2 = int.tryParse(binary2) ?? 0;
  int binaryProd = 0;

  while (b1 != 0 || b2 != 0) {
    sum[i++] = (b1 % 10 + b2 % 10 + remainder) % 2;
    remainder = (b1 % 10 + b2 % 10 + remainder) ~/ 2;
    b1 = b1 ~/ 10;
    b2 = b2 ~/ 10;
  }

  if (remainder != 0) {
    sum[i++] = remainder;
  }

  --i;
  while (i >= 0) {
    binaryProd = binaryProd * 10 + sum[i--];
  }

  sonuc = binaryProd.toString();

  return sonuc;
}

void main() {

  String multiply = binaryMultiply("110", "101");
  print(multiply);

  String add = binaryAdd("11011", "10011");
  print(add);

}