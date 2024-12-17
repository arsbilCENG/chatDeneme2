import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreatePetScreen extends StatefulWidget {
  const CreatePetScreen({Key? key}) : super(key: key);

  @override
  State<CreatePetScreen> createState() => _CreatePetScreenState();
}

class _CreatePetScreenState extends State<CreatePetScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController dailyMealsController = TextEditingController();

  // Aktivite seviyesi ve cinsiyet için dropdown seçimleri
  String? selectedActivityLevel;
  String? selectedGender;

  final List<String> activityLevels = ["Yüksek", "Orta", "Düşük"];
  final List<String> genderOptions = ["Dişi", "Erkek"];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Geri ok tuşu
          Positioned(
            top: screenHeight * 0.05,
            left: screenWidth * 0.05,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                width: screenWidth * 0.12,
                height: screenWidth * 0.12,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          // İleri ok tuşu
          Positioned(
            top: screenHeight * 0.85,
            right: screenWidth * 0.05,
            child: GestureDetector(
              onTap: () {
                // Boş alanları kontrol et
                if (nameController.text.isEmpty) {
                  _showAlertDialog("Lütfen isim alanını doldurun.");
                  return;
                }
                if (selectedGender == null) {
                  _showAlertDialog("Lütfen cinsiyet seçin.");
                  return;
                }
                if (ageController.text.isEmpty) {
                  _showAlertDialog("Lütfen yaş alanını doldurun.");
                  return;
                }
                if (weightController.text.isEmpty) {
                  _showAlertDialog("Lütfen kilo alanını doldurun.");
                  return;
                }
                if (dailyMealsController.text.isEmpty) {
                  _showAlertDialog("Lütfen günlük beslenme sayısını girin.");
                  return;
                }
                if (selectedActivityLevel == null) {
                  _showAlertDialog("Lütfen aktivite seviyesini seçin.");
                  return;
                }

                // Tüm kontrolleri geçtiyse
                print("Tüm bilgiler dolduruldu, ileriye geçiliyor!");
              },
              child: Container(
                width: screenWidth * 0.12,
                height: screenWidth * 0.12,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.arrow_forward,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          // Ekran içeriği
          Positioned(
            top: screenHeight * 0.12,
            left: screenWidth * 0.05,
            right: screenWidth * 0.05,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Başlık
                const Center(
                  child: Text(
                    "Create Pet",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E2843),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                // İsim TextField
                _buildInputField(
                  context,
                  iconColor: Colors.pink.shade200,
                  hintText: "İsim",
                  controller: nameController,
                  inputType: TextInputType.text,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-ZğüşöçıĞÜŞÖÇİ\s]')),
                  ],
                ),
                const SizedBox(height: 20),
                // Cinsiyet Dropdown
                _buildDropdownField(
                  context,
                  iconColor: Colors.blue.shade200,
                  hintText: "Cinsiyet",
                  value: selectedGender,
                  items: genderOptions,
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value;
                    });
                  },
                ),
                const SizedBox(height: 20),
                // Yaş TextField
                _buildInputField(
                  context,
                  iconColor: Colors.purple.shade200,
                  hintText: "Yaş",
                  controller: ageController,
                  inputType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  onChanged: (value) {
                    if (value.isNotEmpty && int.parse(value) > 25) {
                      ageController.text = '25';
                      ageController.selection = TextSelection.fromPosition(
                        TextPosition(offset: ageController.text.length),
                      );
                    }
                  },
                ),
                const SizedBox(height: 20),
                // Kilo TextField
                _buildInputField(
                  context,
                  iconColor: Colors.yellow.shade200,
                  hintText: "Kilo",
                  controller: weightController,
                  inputType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  onChanged: (value) {
                    if (value.isNotEmpty && int.parse(value) > 100) {
                      weightController.text = '100';
                      weightController.selection = TextSelection.fromPosition(
                        TextPosition(offset: weightController.text.length),
                      );
                    }
                  },
                ),
                const SizedBox(height: 20),
                // Aktivite Seviyesi Dropdown
                _buildDropdownField(
                  context,
                  iconColor: Colors.green.shade200,
                  hintText: "Aktivite Seviyesi",
                  value: selectedActivityLevel,
                  items: activityLevels,
                  onChanged: (value) {
                    setState(() {
                      selectedActivityLevel = value;
                    });
                  },
                ),
                const SizedBox(height: 20),
                // Günlük Beslenme Sayısı TextField
                _buildInputField(
                  context,
                  iconColor: Colors.orange.shade200,
                  hintText: "Günlük Beslenme Sayısı",
                  controller: dailyMealsController,
                  inputType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      int inputValue = int.parse(value);
                      if (inputValue > 5) {
                        dailyMealsController.text = '5';
                        dailyMealsController.selection = TextSelection.fromPosition(
                          TextPosition(offset: dailyMealsController.text.length),
                        );
                      } else if (inputValue == 0) {
                        dailyMealsController.text = '1';
                        dailyMealsController.selection = TextSelection.fromPosition(
                          TextPosition(offset: dailyMealsController.text.length),
                        );
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // TextField için özel metod
  Widget _buildInputField(
    BuildContext context, {
    required Color iconColor,
    required String hintText,
    required TextEditingController controller,
    required TextInputType inputType,
    List<TextInputFormatter>? inputFormatters,
    void Function(String)? onChanged,
  }) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: screenWidth * 0.08,
            height: screenWidth * 0.08,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: iconColor,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: controller,
              keyboardType: inputType,
              inputFormatters: inputFormatters,
              onChanged: onChanged,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: const TextStyle(color: Colors.grey),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Dropdown için özel metod
  Widget _buildDropdownField(
    BuildContext context, {
    required Color iconColor,
    required String hintText,
    required String? value,
    required List<String> items,
    required void Function(String?) onChanged,
  }) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: screenWidth * 0.08,
            height: screenWidth * 0.08,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: iconColor,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: DropdownButton<String>(
              value: value,
              isExpanded: true,
              hint: Text(
                hintText,
                style: const TextStyle(color: Colors.grey),
              ),
              icon: const Icon(Icons.arrow_drop_down),
              underline: const SizedBox(),
              items: items.map((item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }

  // Uyarı dialogu için metod
  void _showAlertDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Uyarı"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Tamam"),
          ),
        ],
      ),
    );
  }
}
