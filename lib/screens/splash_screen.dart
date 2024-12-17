import 'package:flutter/material.dart';
import 'package:pawsguard/screens/sign_screen.dart';
import 'login_screen.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Ekran genişliği ve yüksekliği
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Arka plan
          Positioned(
            left: -screenWidth * 0.2, // Dinamik sol pozisyon
            top: -screenHeight * 0.3, // Dinamik üst pozisyon
            child: Image.asset(
              'assets/images/background_shapes.png',
              width: screenWidth * 1.5, // Dinamik genişlik
              height: screenHeight * 0.8, // Dinamik yükseklik
            ),
          ),
          // Kalp Görseli
          Positioned(
            left: screenWidth * 0.24,
            top: screenHeight * 0.20,
            child: Image.asset(
              'assets/images/dog_image.png',
              width: screenWidth * 0.6, // Dinamik genişlik
              height: screenHeight * 0.3, // Dinamik yükseklik
            ),
          ),
          // Köpek Görseli
          Positioned(
            left: screenWidth * 0.71,
            top: screenHeight * 0.5,
            child: Image.asset(
              'assets/images/heart_icon.png',
              width: screenWidth * 0.14, // Dinamik genişlik
              height: screenHeight * 0.07, // Dinamik yükseklik
            ),
          ),
          // Başlık: PawsGuard
          Positioned(
            left: screenWidth * 0.3,
            top: screenHeight * 0.57,
            child: const Text(
              'PawsGuard',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w900,
                color: Color(0xFF1E2843),
              ),
            ),
          ),
          // Alt Başlık
          Positioned(
            left: screenWidth * 0.24,
            top: screenHeight * 0.65,
            child: const Text(
              'Dostlarımız için en güzel hayat',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFFA1A6B3),
              ),
            ),
          ),
          // Get Start Butonu
          Positioned(
            left: screenWidth * 0.1,
            top: screenHeight * 0.76,
            child: SizedBox(
              width: screenWidth * 0.8,
              height: screenHeight * 0.07,
              child: ElevatedButton(
                onPressed: () {
                   // Get Start butonuna tıklandığında SignScreen'e geçiş yapılır
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF40339D),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text(
                  'Get Start',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ),
          // Login Butonu
          Positioned(
            left: screenWidth * 0.1,
            top: screenHeight * 0.84,
            child: SizedBox(
              width: screenWidth * 0.8,
              height: screenHeight * 0.07,
              child: ElevatedButton(
                onPressed: () {
                  // Login butonuna tıklandığında LoginScreen'e geçiş yapılır
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF007EC4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
