import 'package:flutter/material.dart';
// تأكد من استيراد نماذج البيانات
// import 'models/fabric.dart';
// import 'models/design.dart'; 

class FabricDetailScreen extends StatelessWidget {
  final Fabric fabric;
  final List<Design> allDesigns; // يجب تمرير جميع التصميمات هنا

  const FabricDetailScreen({
    super.key,
    required this.fabric,
    required this.allDesigns,
  });

  // دالة لجلب التصميمات المناسبة لهذا القماش
  List<Design> getSuitableDesigns() {
    return allDesigns
        .where((design) => fabric.suitableDesignIds.contains(design.id))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final suitableDesigns = getSuitableDesigns();

    return Scaffold(
      appBar: AppBar(title: Text(fabric.name)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // 1. صورة القماش الرئيسية
            Image.network(fabric.imageUrl, height: 250, width: double.infinity, fit: BoxFit.cover),
            
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 2. تفاصيل القماش
                  Text('النوع: ${fabric.type}', style: const TextStyle(fontSize: 18)),
                  const SizedBox(height: 8),
                  Text('الوصف: ${fabric.description}', style: const TextStyle(fontSize: 16)),
                  const Divider(height: 30),

                  // 3. قسم التصميمات المقترحة (الربط الذكي)
                  const Text(
                    '👗 موديلات مقترحة لهذا القماش:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),

                  // عرض قائمة التصميمات
                  if (suitableDesigns.isEmpty)
                    const Text('لا توجد موديلات مقترحة حالياً.')
                  else 
                    SizedBox(
                      height: 200, // ارتفاع ثابت لقائمة الموديلات الأفقية
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: suitableDesigns.length,
                        itemBuilder: (context, index) {
                          final design = suitableDesigns[index];
                          return DesignCard(design: design);
                        },
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// تصميم بسيط لبطاقة الموديل
class DesignCard extends StatelessWidget {
  final Design design;
  const DesignCard({super.key, required this.design});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 10),
      child: Column(
        children: [
          Expanded(
            child: Image.network(design.imageUrl, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Text(design.name, textAlign: TextAlign.center, style: const TextStyle(fontSize: 14)),
          ),
        ],
      ),
    );
  }
}
