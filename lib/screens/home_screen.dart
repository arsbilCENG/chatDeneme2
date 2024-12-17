import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Profil Fotoğrafı
          Positioned(
            top: screenHeight * 0.1, // Yukarıdan uzaklık
            left: screenWidth * 0.35, // Soldan uzaklık
            child: SizedBox(
              width: screenWidth * 0.3,
              height: screenWidth * 0.3,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Çerçeve
                  Image.asset(
                    'assets/images/profile_frame.png', // Çerçeve görseli
                    fit: BoxFit.cover,
                  ),
                  // Profil Fotoğrafı (Placeholder)
                  const CircleAvatar(
                    radius: 46,
                    backgroundColor: Color(0xFFEDEDED), // Gri arka plan
                    child: Icon(
                      Icons.person,
                      size: 40,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // İsim Soyisim
          Positioned(
            top: screenHeight * 0.27, // Yukarıdan uzaklık
            left: screenWidth * 0.35, // Soldan uzaklık
            child: const Text(
              "Umut Can Gür",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E2843),
              ),
            ),
          ),
        // My Pets Butonu
          Positioned(
            top: screenHeight * 0.25, // Yukarıdan uzaklık
            left: screenWidth * -0.08, // Soldan uzaklık
            child: Stack(
              children: [
                // Buton Görseli
                Image.asset(
                  'assets/images/pet_button.png', // Buton görseli
                  width: screenWidth * 0.6, // Genişlik
                  height: screenWidth * 0.6, // Yükseklik
                  fit: BoxFit.cover,
                ),
                // Buton Yazısı
                Positioned(
                  top: screenWidth * 0.32, // Görsel içinde yukarıdan uzaklık
                  left: screenWidth * 0.24, // Görsel içinde soldan uzaklık
                  child: const Text(
                    "My Pets",
                    style: TextStyle(
                      fontSize: 15, // Yazı boyutu
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Siyah renk
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Create Pets Butonu
          Positioned(
            top: screenHeight * 0.25, // Yukarıdan uzaklık
            left: screenWidth * 0.47, // Soldan uzaklık
            child: Stack(
              children: [
                // Buton Görseli
                Image.asset(
                  'assets/images/pet_button.png', // Buton görseli
                  width: screenWidth * 0.6, // Genişlik
                  height: screenWidth * 0.6, // Yükseklik
                  fit: BoxFit.cover,
                ),
                // Buton Yazısı
                Positioned(
                  top: screenWidth * 0.32, // Görsel içinde yukarıdan uzaklık
                  left: screenWidth * 0.21, // Görsel içinde soldan uzaklık
                  child: const Text(
                    "Create Pets",
                    style: TextStyle(
                      fontSize: 15, // Yazı boyutu
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Siyah renk
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Carousel (Yana Kaydırmalı)
          Positioned(
            top: screenHeight * 0.6, // Yukarıdan uzaklık
            left: screenWidth * -0.1, // Soldan uzaklık
            child: SizedBox(
              width: screenWidth * 1.2,
              height: screenHeight * 0.3,
              child: PageView(
                controller: PageController(viewportFraction: 0.8),
                onPageChanged: (index) {
                  print("Carousel sayfa: $index");
                },
                children: [
                  // Carousel Sayfa 1
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.black,
                    ),
                    child: const Center(
                      child: Text(
                        "Sayfa 1",
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ),
                  ),
                  // Carousel Sayfa 2
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.blue,
                    ),
                    child: const Center(
                      child: Text(
                        "Sayfa 2",
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ),
                  ),
                  // Carousel Sayfa 3
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.green,
                    ),
                    child: const Center(
                      child: Text(
                        "Sayfa 3",
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Gösterge Noktaları (Dots)
          Positioned(
            top: screenHeight * 0.9, // Yukarıdan uzaklık
            left: screenWidth * 0.42, // Soldan uzaklık
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  width: 10.0,
                  height: 10.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index == 0
                        ? Colors.blue // Aktif sayfa rengi
                        : Colors.grey, // Pasif sayfa rengi
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
