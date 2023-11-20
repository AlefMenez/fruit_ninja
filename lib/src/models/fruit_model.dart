// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class FruitModel {
  String image;
  bool isBomb;
  Color color;
  FruitModel({
    required this.image,
    this.isBomb = false,
    this.color = Colors.transparent,
  });
}
