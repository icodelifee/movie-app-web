import 'dart:math';

import 'package:flutter/material.dart';

Color getRandomColor() =>
    Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
