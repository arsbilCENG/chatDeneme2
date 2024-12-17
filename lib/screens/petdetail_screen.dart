import 'package:flutter/material.dart';

class PetDetailsScreen extends StatelessWidget {
  const PetDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Köpek Resmi
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: screenHeight * 0.4, // Resim ekranın %40'ını kaplasın
            child: Image.asset(
              'assets/images/rottweiler.png', // Resim yolu
              fit: BoxFit.cover, // Resim alanı doldursun
            ),
          ),

          // Boncuk Yazısı
          Positioned(
            top: screenHeight * 0.3, // Resmin alt kısmına hizala
            left: screenWidth * 0.05, // Sol tarafa biraz boşluk bırak
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.6), // Siyah yarı saydam arka plan
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                "Boncuk",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),

          // Geri ve Yenile Butonları
          Positioned(
            top: screenHeight * 0.05,
            left: screenWidth * 0.05,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                width: screenWidth * 0.1,
                height: screenWidth * 0.1,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: const Icon(Icons.arrow_back, color: Colors.black),
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.05,
            right: screenWidth * 0.05,
            child: GestureDetector(
              onTap: () {
                print("Yenile Butonuna Tıklandı!");
              },
              child: Container(
                width: screenWidth * 0.1,
                height: screenWidth * 0.1,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: const Icon(Icons.refresh, color: Colors.black),
              ),
            ),
          ),

          // Alt Bilgi Kartı
          Positioned(
            top: screenHeight * 0.4, // Resmin hemen altından başla
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.05,
                vertical: screenHeight * 0.02,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  // Kaydırılabilir Alan
                  Expanded(
                    child: Scrollbar(
                      thickness: 6,
                      radius: const Radius.circular(10),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Yatay Kaydırılabilir Bilgi Kartları
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  _buildInfoCard("Age", "4"),
                                  _buildInfoCard("Sex", "Female"),
                                  _buildInfoCard("Weight", "37kg"),
                                  _buildInfoCard("Meal Count", "2"),
                                  _buildInfoCard("Activity Level", "High"),
                                  _buildInfoCard("Calorie Need", "1610"),
                                ],
                              ),
                            ),

                            const SizedBox(height: 20),

                            // Açıklama Metni
                            const Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. \n\n\n\n\n BURAYA BESLENME PLANI GELECEK",
                              style: TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                            const SizedBox(height: 10),
                            
                            const SizedBox(height: 20),

                            // Chatbot Butonu
                            Center(
                              child: GestureDetector(
                                onTap: () {
                                  print("Chatbot Butonuna Tıklandı!");
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 40,
                                    vertical: 15,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF40339D),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: const Text(
                                    "Consult the chatbot",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Bilgi Kartı Widget'ı
  Widget _buildInfoCard(String title, String value) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
