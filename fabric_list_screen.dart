// ... الكلاسات Fabric و Design وبيانات dummyFabrics و dummyDesigns موجودة في هذا الملف أو تم استيرادها

class FabricListScreen extends StatelessWidget {
  const FabricListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('جميع الأقمشة'),
        // ... (وظائف الفلترة)
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, 
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.75,
        ),
        itemCount: dummyFabrics.length,
        itemBuilder: (context, index) {
          return FabricItem(
            fabric: dummyFabrics[index],
            // **الجديد: تمرير قائمة كل التصميمات هنا**
            allDesigns: dummyDesigns, 
          );
        },
      ),
    );
  }
}
