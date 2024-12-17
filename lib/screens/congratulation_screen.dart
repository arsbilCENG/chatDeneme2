import 'package:flutter/material.dart';

class CongratulationScreen extends StatelessWidget {
  const CongratulationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Ana içerik (Görsel, başlık ve alt başlık)
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Ana Görsel
                Image.asset(
                  'assets/images/congratulation_image.png', // Görselin yolu
                  width: screenWidth * 0.4, // Ekranın %40 genişliği kadar
                  height: screenWidth * 0.4, // Ekranın %40 genişliği kadar
                ),
                const SizedBox(height: 20),
                // Başlık
                const Text(
                  'Congratulation!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E2843), // Koyu mavi
                  ),
                ),
                const SizedBox(height: 10),
                // Alt Başlık
                const Text(
                  'Lorem ipsum dolor sit amet, consectetur\nadipiscing elit, sed do eiusmod.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFFA1A6B3), // Açık gri
                  ),
                ),
              ],
            ),
          ),
          // İleri Butonu
          Positioned(
  bottom: screenHeight * 0.05, // Ekranın altından %5 yukarıda
  right: screenWidth * 0.03,  // Ekranın sağından %5 içeride
  child: GestureDetector(
    onTap: () {
      // İleri butonuna tıklama olayı
      print('İleri butonuna tıklandı');
    },
    child: Transform.rotate(
      angle: 3.14, // 180 derece döndürme
      child: Image.asset(
        'assets/images/back_arrow.png', // Back Arrow görseli
        width: screenWidth * 0.28, // Dinamik genişlik (Ekranın %18'i)
        height: screenHeight * 0.14, // Dinamik yükseklik (Ekranın %10'u)
      ),
    ),
  ),
),

        ],
      ),
    );
  }
}
