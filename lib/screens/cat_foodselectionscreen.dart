import 'package:flutter/material.dart';

class CatFoodSelectionScreen extends StatefulWidget {
  const CatFoodSelectionScreen({Key? key}) : super(key: key);

  @override
  State<CatFoodSelectionScreen> createState() => _CatFoodSelectionScreenState();
}

class _CatFoodSelectionScreenState extends State<CatFoodSelectionScreen> {
  final List<String> foodOptions = [
    "Kuru Mama",
    "Yaş Mama",
    "Tavuk",
    "Hindi",
    "Dana Eti",
    "Kuzu Eti",
    "Organ Etleri (karaciğer, böbrek)",
  ];

  final List<String> selectedFoods = [];

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
                if (!selectedFoods.any((food) =>
                    ["Kuru Mama", "Yaş Mama", "Tavuk", "Hindi", "Dana Eti", "Kuzu Eti", "Organ Etleri (karaciğer, böbrek)"]
                        .contains(food))) {
                  _showAlertDialog("Lütfen besin seçeneklerinden en az birini seçin.");
                  return;
                }

                print("Seçilen besinler: $selectedFoods");
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
          // İçerik
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.only(
                top: screenHeight * 0.15,
                left: screenWidth * 0.05,
                right: screenWidth * 0.05,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      "Cat Food Selection",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1E2843),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Seçim Yapabileceğiniz Besinler",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: foodOptions.map((food) {
                          final isSelected = selectedFoods.contains(food);
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                if (isSelected) {
                                  selectedFoods.remove(food);
                                } else {
                                  selectedFoods.add(food);
                                }
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: isSelected ? Colors.blue : Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: isSelected ? Colors.blue : Colors.grey,
                                  width: 1,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    blurRadius: 5,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Text(
                                food,
                                style: TextStyle(
                                  color: isSelected ? Colors.white : Colors.black,
                                  fontWeight:
                                      isSelected ? FontWeight.bold : FontWeight.normal,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Seçilen Besinler",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: selectedFoods.length,
                      itemBuilder: (context, index) {
                        final food = selectedFoods[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          child: ListTile(
                            title: Text(food),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                setState(() {
                                  selectedFoods.removeAt(index);
                                });
                              },
                            ),
                          ),
                        );
                      },
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
