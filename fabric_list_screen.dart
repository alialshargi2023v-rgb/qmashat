// تكملة للكود السابق... يمكنك وضع هذا الكلاس في ملف منفصل إذا استخدمت Cloud IDE
class FabricListScreen extends StatelessWidget {
  const FabricListScreen({super.key});

  // بيانات وهمية (Mock Data) للاختبار
  final List<Fabric> dummyFabrics = const [
    Fabric(
      id: 'f1',
      name: 'حرير شيفون',
      type: 'حرير',
      imageUrl: 'https://example.com/chiffon.jpg', // يجب تغيير هذا لرابط حقيقي
      description: 'قماش ناعم وخفيف جداً، مثالي لفساتين السهرة.',
    ),
    Fabric(
      id: 'f2',
      name: 'قطن مطبوع',
      type: 'قطن',
      imageUrl: 'https://example.com/cotton.jpg', // يجب تغيير هذا لرابط حقيقي
      description: 'مثالي للأرواب الصيفية والملابس المنزلية.',
    ),
    // ... أضف المزيد من الأقمشة هنا
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('جميع الأقمشة'),
        actions: [
          IconButton(icon: const Icon(Icons.filter_list), onPressed: () {
            // إضافة وظيفة الفلترة هنا لاحقاً
          }),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // عمودين
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.75, // نسبة العرض إلى الارتفاع لبطاقة القماش
        ),
        itemCount: dummyFabrics.length,
        itemBuilder: (context, index) {
          return FabricItem(fabric: dummyFabrics[index]);
        },
      ),
    );
  }
}
