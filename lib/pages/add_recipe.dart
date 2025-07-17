import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddRecipe extends StatefulWidget {
  const AddRecipe({super.key});

  @override
  State<AddRecipe> createState() => _AddRecipeState();
}

class _AddRecipeState extends State<AddRecipe> {
  File? selectedImage;
  Uint8List? _webImage;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController detailController = TextEditingController();

  final ImagePicker _picker = ImagePicker();

  Future<void> getImage() async {
    final image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      if (kIsWeb) {
        final bytes = await image.readAsBytes();
        setState(() {
          _webImage = bytes;
        });
      } else {
        setState(() {
          selectedImage = File(image.path);
        });
      }
    }
  }

  void _saveRecipe() {
    print("Saved Recipe:");
    print("Name: ${nameController.text}");
    print("Details: ${detailController.text}");
    print("Image selected: ${kIsWeb ? _webImage != null : selectedImage != null}");

    // TODO: Add Firebase upload or database save logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Add Recipe",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: GestureDetector(
                onTap: getImage,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black12),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: kIsWeb
                        ? (_webImage != null
                        ? Image.memory(_webImage!, fit: BoxFit.cover)
                        : Icon(Icons.camera_alt_outlined,
                        size: 40, color: Colors.black54))
                        : (selectedImage != null
                        ? Image.file(selectedImage!, fit: BoxFit.cover)
                        : Icon(Icons.camera_alt_outlined,
                        size: 40, color: Colors.black54)),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Text(
              "Recipe Name",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black26),
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: "Write a recipe name",
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 25),
            Text(
              "Recipe Details",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black26),
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                controller: detailController,
                maxLines: 8,
                decoration: InputDecoration(
                  hintText: "Write full recipe details",
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: _saveRecipe,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 14),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    "SAVE",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.1,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
