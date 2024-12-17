import 'package:flutter/material.dart';

class SignScreen extends StatelessWidget {
  const SignScreen({Key? key}) : super(key: key);

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
                Navigator.pop(context); // Geri döner
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
            left: screenWidth * 0.29,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "   Sign Up",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E2843),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  " Create new an account",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFFA1A6B3),
                  ),
                ),
              ],
            ),
          ),
          // Full Name Giriş Alanı
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
                    'assets/images/user_icon.png', // Kullanıcı ikonu
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Full Name",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Username or Email Giriş Alanı
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
            top: screenHeight * 0.55,
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
          // Sign Up Butonu
          Positioned(
            top: screenHeight * 0.65,
            left: screenWidth * 0.1,
            child: SizedBox(
              width: screenWidth * 0.8,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Kayıt ol işlemi
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF40339D),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ),
          // OR LOGIN WITH yazısı
          // OR LOGIN WITH YAZISI
           Positioned(
            left: screenWidth * 0.35,
            top: screenHeight * 0.77,
            child: const Text(
              'OR LOGIN WITH',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Color(0xFFA1A6B3),
              ),
            ),
          ),
          // Google ile Giriş
          Positioned(
            top: screenHeight * 0.83,
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
          // Sign In Linki
          Positioned(
            top: screenHeight * 0.93,
            left: screenWidth * 0.25,
            child: Row(
              children: [
                const Text(
                  "Do you have an account? ",
                  style: TextStyle(color: Color(0xFFA1A6B3)),
                ),
                GestureDetector(
                  onTap: () {
                    // SignIn ekranına yönlendirme
                  },
                  child: const Text(
                    "Sign In",
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
