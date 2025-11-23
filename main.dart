import 'package:flutter/material.dart';

// تعريف موديل (نموذج بيانات) القماش
class Fabric {
  final String id;
  final String name;
  final String type;
  final String imageUrl;
  final String description;

  Fabric({
    required this.id,
    required this.name,
    required this.type,
    required this.imageUrl,
    required this.description,
  });
}

void main() {
  runApp(const FabricGalleryApp());
}

class FabricGalleryApp extends StatelessWidget {
  const FabricGalleryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'معرض الأقمشة الرقمي',
      theme: ThemeData(
        primarySwatch: Colors.pink, // لون يناسب الأقمشة النسائية
      ),
      home: const FabricListScreen(),
    );
  }
}
