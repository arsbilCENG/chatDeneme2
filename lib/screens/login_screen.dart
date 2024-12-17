import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Geri Butonu
          Positioned(
             top: screenHeight * 0.06,
            left: screenWidth * 0.0,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context); // Bir önceki ekrana döner
              },
              child: Image.asset(
                'assets/images/back_arrow.png', // Geri buton görseli
                width: screenWidth * 0.28, // Dinamik genişlik
              height: screenHeight * 0.14, // Dinamik yükseklik
              ),
            ),
          ),
          // Başlık ve Alt Başlık
          Positioned(
            top: screenHeight * 0.2,
            left: screenWidth * 0.32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Welcome!",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w900 ,
                    color: Color(0xFF1E2843),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "  Sign in to continue",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFFA1A6B3),
                  ),
                ),
              ],
            ),
          ),
          // Kullanıcı Adı Giriş Alanı
          Positioned(
            top: screenHeight * 0.35,
            left: screenWidth * 0.1,
            child: Container(
              width: screenWidth * 0.8,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/email_icon.png', // Zarf ikonu
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Username or Email",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Şifre Giriş Alanı
          Positioned(
            top: screenHeight * 0.45,
            left: screenWidth * 0.1,
            child: Container(
              width: screenWidth * 0.8,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/lock_icon.png', // Kilit ikonu
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Password",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Forgot Password
          Positioned(
            top: screenHeight * 0.55,
            right: screenWidth * 0.1,
            child: const Text(
              "Forgot Password?",
              style: TextStyle(
                color: Color(0xFFA1A6B3),
                fontSize: 14,
              ),
            ),
          ),
          // Login Butonu
          Positioned(
            top: screenHeight * 0.6,
            left: screenWidth * 0.1,
            child: SizedBox(
              width: screenWidth * 0.8,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Login işlemi
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF40339D),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text(
                  "Login",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ),
          // OR LOGIN WITH YAZISI
           Positioned(
            left: screenWidth * 0.35,
            top: screenHeight * 0.74,
            child: const Text(
              'OR LOGIN WITH',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Color(0xFFA1A6B3),
              ),
            ),
          ),
          // Google ile giriş
          Positioned(
            top: screenHeight * 0.8,
            left: screenWidth * 0.44,
            child: GestureDetector(
              onTap: () {
                // Google ile giriş işlemi
              },
              child: Image.asset(
                'assets/images/google_icon.png',
                width: 45,
                height: 45,
              ),
            ),
          ),
          // Signup Linki
          Positioned(
            top: screenHeight * 0.9,
            left: screenWidth * 0.28,
            child: Row(
              children: [
                const Text(
                  "Create new Account? ",
                  style: TextStyle(color: Color(0xFFA1A6B3)),
                ),
                GestureDetector(
                  onTap: () {
                    // Signup ekranına yönlendirme
                  },
                  child: const Text(
                    "Signup",
                    style: TextStyle(
                      color: Color(0xFF40339D),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
