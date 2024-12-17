import 'package:flutter/material.dart';

class AnimalSearchScreen extends StatefulWidget {
  const AnimalSearchScreen({Key? key}) : super(key: key);

  @override
  _AnimalSearchScreenState createState() => _AnimalSearchScreenState();
}

class _AnimalSearchScreenState extends State<AnimalSearchScreen> {
  bool isCatSelected = true; // Başlangıçta kedi seçili
  final TextEditingController searchController = TextEditingController();

  // Kedi ve Köpek Listeleri
  final List<Map<String, String>> cats = [
  {"name": "British Shorthair", "image": "assets/images/british_shorthair.png"},
  {"name": "Persian (İran Kedisi)", "image": "assets/images/persian_iran_kedisi.png"},
  {"name": "Maine Coon", "image": "assets/images/maine_coon.png"},
  {"name": "Siamese (Siyam Kedisi)", "image": "assets/images/siamese_siyam_kedisi.png"},
  {"name": "Ragdoll", "image": "assets/images/ragdoll.png"},
  {"name": "Bengal", "image": "assets/images/bengal.png"},
  {"name": "Russian Blue", "image": "assets/images/russian_blue.png"},
  {"name": "Scottish Fold", "image": "assets/images/scottish_fold.png"},
  {"name": "Sphynx", "image": "assets/images/sphynx.png"},
  {"name": "Birman", "image": "assets/images/birman.png"},
  {"name": "Devon Rex", "image": "assets/images/devon_rex.png"},
  {"name": "Oriental Shorthair", "image": "assets/images/oriental_shorthair.png"},
  {"name": "Turkish Angora (Ankara Kedisi)", "image": "assets/images/turkish_angora_ankara_kedisi.png"},
  {"name": "Norwegian Forest Cat", "image": "assets/images/norwegian_forest_cat.png"},
  {"name": "American Shorthair", "image": "assets/images/american_shorthair.png"},
  {"name": "Burmese (Burma Kedisi)", "image": "assets/images/burmese_burma_kedisi.png"},
  {"name": "Cornish Rex", "image": "assets/images/cornish_rex.png"},
  {"name": "Chartreux", "image": "assets/images/chartreux.png"},
  {"name": "Himalayan", "image": "assets/images/himalayan.png"},
  {"name": "Tekir", "image": "assets/images/tekir.png"},
];

  final List<Map<String, String>> dogs = [
  {"name": "Labrador Retriever", "image": "assets/images/labrador_retriever.png"},
  {"name": "Golden Retriever", "image": "assets/images/golden_retriever.png"},
  {"name": "German Shepherd", "image": "assets/images/german_shepherd.png"},
  {"name": "French Bulldog", "image": "assets/images/french_bulldog.png"},
  {"name": "Bulldog", "image": "assets/images/bulldog.png"},
  {"name": "Poodle (Kaniş)", "image": "assets/images/poodle_kanis.png"},
  {"name": "Beagle", "image": "assets/images/beagle.png"},
  {"name": "Rottweiler", "image": "assets/images/rottweiler.png"},
  {"name": "Yorkshire Terrier (Yorkie)", "image": "assets/images/yorkshire_terrier_yorkie.png"},
  {"name": "Dachshund (Sosis Köpek)", "image": "assets/images/dachshund_sosis_kopek.png"},
  {"name": "Boxer", "image": "assets/images/boxer.png"},
  {"name": "Siberian Husky", "image": "assets/images/siberian_husky.png"},
  {"name": "Shih Tzu", "image": "assets/images/shih_tzu.png"},
  {"name": "Border Collie", "image": "assets/images/border_collie.png"},
  {"name": "Australian Shepherd", "image": "assets/images/australian_shepherd.png"},
  {"name": "Pembroke Welsh Corgi", "image": "assets/images/pembroke_welsh_corgi.png"},
  {"name": "Great Dane (Danua)", "image": "assets/images/great_dane_danua.png"},
  {"name": "Chihuahua", "image": "assets/images/chihuahua.png"},
  {"name": "Pomeranian", "image": "assets/images/pomeranian.png"},
  {"name": "Melez", "image": "assets/images/melez.png"},
];

  // Filtrelenmiş Listeler
  List<Map<String, String>> filteredCats = [];
  List<Map<String, String>> filteredDogs = [];

  @override
  void initState() {
    super.initState();
    filteredCats = List.from(cats);
    filteredDogs = List.from(dogs);
    searchController.addListener(() {
      _filterAnimals(searchController.text);
    });
  }

  void _filterAnimals(String query) {
    setState(() {
      if (isCatSelected) {
        filteredCats = cats
            .where((cat) => cat['name']!.toLowerCase().contains(query.toLowerCase()))
            .toList();
      } else {
        filteredDogs = dogs
            .where((dog) => dog['name']!.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Back Arrow
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
          // Profile Frame
          Positioned(
            top: screenHeight * 0.05,
            left: (screenWidth - (screenWidth * 0.3)) / 2,
            child: SizedBox(
              width: screenWidth * 0.3,
              height: screenWidth * 0.3,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/images/profile_frame.png',
                    fit: BoxFit.cover,
                  ),
                  const CircleAvatar(
                    radius: 46,
                    backgroundColor: Color(0xFFEDEDED),
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
          // Başlık
          Positioned(
            top: screenHeight * 0.23,
            left: screenWidth * 0.2,
            child: const Text(
              "Find Your Pet's Breed",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E2843),
              ),
            ),
          ),
          // Arama Çubuğu
          Positioned(
            top: screenHeight * 0.31,
            left: screenWidth * 0.05,
            right: screenWidth * 0.05,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Icon(
                      Icons.search,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      decoration: const InputDecoration(
                        hintText: "Search",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Kedi ve Köpek Butonları
          Positioned(
            top: screenHeight * 0.40,
            left: screenWidth * 0.13,
            child: Row(
              children: [
                // Kedi Butonu
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isCatSelected = true;
                      _filterAnimals(searchController.text);
                    });
                  },
                  child: Container(
                    width: screenWidth * 0.35,
                    height: screenWidth * 0.15,
                    margin: EdgeInsets.only(right: screenWidth * 0.05),
                    decoration: BoxDecoration(
                      color: isCatSelected
                          ? const Color(0xFF40339D)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: Colors.grey.shade300,
                        width: 2,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Image.asset(
                      isCatSelected
                          ? 'assets/images/cat_white.png'
                          : 'assets/images/cat_black.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                // Köpek Butonu
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isCatSelected = false;
                      _filterAnimals(searchController.text);
                    });
                  },
                  child: Container(
                    width: screenWidth * 0.35,
                    height: screenWidth * 0.15,
                    decoration: BoxDecoration(
                      color: !isCatSelected
                          ? const Color(0xFF40339D)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: Colors.grey.shade300,
                        width: 2,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Image.asset(
                      !isCatSelected
                          ? 'assets/images/dog_white.png'
                          : 'assets/images/dog_black.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // GridView (Hayvan Listesi)
          Positioned(
            top: screenHeight * 0.50,
            left: 0,
            right: 0,
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.8,
                ),
                itemCount: isCatSelected ? filteredCats.length : filteredDogs.length,
                itemBuilder: (context, index) {
                  final animal = isCatSelected
                      ? filteredCats[index]
                      : filteredDogs[index];
                  return GestureDetector(
                    onTap: () {
                      print("Seçilen hayvan: ${animal['name']}");
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            animal['image']!,
                            height: screenHeight * 0.15,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            animal['name']!,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
