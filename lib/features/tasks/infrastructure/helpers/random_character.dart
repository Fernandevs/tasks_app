import 'dart:math';

String getRandomCharacter({required String text}) =>
    text.split(' ').join()[Random().nextInt(text.length)].toUpperCase();
