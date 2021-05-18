import 'dart:math';

class GeneratePassword {
  String text;

  Random random = new Random();

  generateone(String text) {
    if (text.isNotEmpty) {
      List element = text.split('');
      
      // print(element); // Cek apakah list sudah terisi nilai 
      List result;

      for (int i = 0; i < text.length; i++) {
        result = (element..shuffle());
      }
      // print(result.join()); // Cek apakah result sudah terisi hasil perhitungannya
      return result.join();
    } else {
      return "Data tidak masuk";
    }
  }
}
