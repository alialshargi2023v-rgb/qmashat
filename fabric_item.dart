// تأكد من استيراد الشاشة
// import 'fabric_detail_screen.dart'; 

class FabricItem extends StatelessWidget {
  final Fabric fabric;
  // **الجديد**
  final List<Design> allDesigns; 
  
  const FabricItem({
    super.key, 
    required this.fabric,
    required this.allDesigns, // **الجديد**
  });

  @override
  Widget build(BuildContext context) {
    // نستخدم GestureDetector لجعل البطاقة قابلة للنقر
    return GestureDetector(
      onTap: () {
        // عند النقر، انتقل إلى شاشة التفاصيل
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FabricDetailScreen(
              fabric: fabric,
              allDesigns: allDesigns, // **تمرير البيانات المطلوبة**
            ),
          ),
        );
      },
      child: Card(
        elevation: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // ... (بقية تصميم البطاقة كما هو: الصورة والاسم والنوع)
            Expanded(
                child: Image.network(
              fabric.imageUrl,
              fit: BoxFit.cover,
            )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                fabric.name,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            // ...
          ],
        ),
      ),
    );
  }
}
