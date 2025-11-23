// ... تكملة للكود
class FabricItem extends StatelessWidget {
  final Fabric fabric;
  const FabricItem({super.key, required this.fabric});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Image.network(
              fabric.imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                // رسالة إذا فشل تحميل الصورة
                return const Center(child: Text('❌ تعذر تحميل الصورة', textAlign: TextAlign.center,));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              fabric.name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              fabric.type,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
        ],
      ),
    );
  }
}
