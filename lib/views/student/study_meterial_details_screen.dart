import 'package:flutter/material.dart';

class StudyMaterialDetailsScreen extends StatelessWidget {
  final String title;
  final String description;
  final String price;
  final String rating;
  final String fileSize;
  final String image;

  const StudyMaterialDetailsScreen({
    super.key,
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
    required this.fileSize,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenWidth * 0.045;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Material Details"),
      ),
      body: Column(
        children: [
          _buildImageSection(),
          Expanded(child: _buildDetailsSection(fontSize)),
          _buildBottomButtons(fontSize, context),
        ],
      ),
    );
  }

  Widget _buildImageSection() {
    return Container(
      height: 280,
      decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
      ),
    );
  }

  Widget _buildDetailsSection(double fontSize) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.star, size: 22, color: Colors.amber),
              const SizedBox(width: 5),
              Text(
                rating,
                style: TextStyle(fontSize: fontSize * 0.9, color: Colors.black),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style:
                TextStyle(fontSize: fontSize * 0.85, color: Colors.grey[700]),
          ),
          const SizedBox(height: 15),
          Text(
            "File Size: $fileSize",
            style: TextStyle(
                fontSize: fontSize * 0.85, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }

  Widget _buildBottomButtons(double fontSize, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
      child: Row(
        children: [
          Expanded(flex: 1, child: _buildDownloadButton(fontSize)),
          const SizedBox(width: 10),
          Expanded(flex: 2, child: _buildBuyButton(fontSize, context)),
        ],
      ),
    );
  }

  Widget _buildDownloadButton(double fontSize) {
    return ElevatedButton.icon(
      onPressed: () {
        // Download functionality
      },
      icon: const Icon(Icons.download, size: 20),
      label: const Text("Download"),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: TextStyle(fontSize: fontSize * 0.9),
        padding: const EdgeInsets.symmetric(vertical: 12),
      ),
    );
  }

  Widget _buildBuyButton(double fontSize, BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigate to Payment Page or Confirm Purchase
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF6A82FB), Color(0xFFFC5C7D)],
          ),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          "Buy Now - $price",
          style: const TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
