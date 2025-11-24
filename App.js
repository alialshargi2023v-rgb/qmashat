import React from 'react';
import { View, Text, StyleSheet, FlatList } from 'react-native';
// (سنفترض أنك ستنشئ ملفات models.js و FabricItem.js و FabricDetail.js لاحقاً)

// ====== بيانات وهمية (Mock Data) باستخدام JavaScript ======
// 1. نموذج التصميمات
const dummyDesigns = [
  { id: 'd1', name: 'فستان زفاف كلاسيكي', imageUrl: 'https://example.com/d1.jpg', usage: 'زفاف' },
  { id: 'd2', name: 'روب منزلي بأكمام واسعة', imageUrl: 'https://example.com/d2.jpg', usage: 'يومي' },
  { id: 'd3', name: 'فستان سهرة قصير', imageUrl: 'https://example.com/d3.jpg', usage: 'سهرة' },
];

// 2. نموذج الأقمشة مع خاصية الربط
const dummyFabrics = [
  {
    id: 'f1',
    name: 'حرير شيفون فاخر',
    type: 'حرير',
    imageUrl: 'https://example.com/chiffon.jpg',
    description: 'قماش ناعم وخفيف جداً.',
    suitableDesignIds: ['d1', 'd3'], // الربط
  },
  {
    id: 'f2',
    name: 'قطن مطبوع',
    type: 'قطن',
    imageUrl: 'https://example.com/cotton.jpg',
    description: 'مثالي للأرواب الصيفية.',
    suitableDesignIds: ['d2'],
  },
];
// =========================================================

// شاشة القائمة الرئيسية
const FabricListScreen = ({ navigation }) => {
  const renderItem = ({ item }) => (
    // يجب إنشاء هذا المكون (Component) لاحقاً
    <FabricItem 
      fabric={item} 
      allDesigns={dummyDesigns} 
      navigation={navigation} 
    />
  );

  return (
    <View style={styles.container}>
      <Text style={styles.title}>كتالوج الأقمشة</Text>
      <FlatList
        data={dummyFabrics}
        renderItem={renderItem}
        keyExtractor={item => item.id}
        numColumns={2} // لعرضها في شبكة
        columnWrapperStyle={styles.row}
      />
    </View>
  );
};

// ملف التنقل (إذا كنت تستخدم React Navigation)
const App = () => {
    // هنا يجب أن يتم إعداد مكتبة التنقل (مثل React Navigation)
    // لعرض شاشة FabricListScreen أولاً.
    return <FabricListScreen />; 
};

export default App;

const styles = StyleSheet.create({
  container: {
    flex: 1,
    paddingTop: 40,
    backgroundColor: '#fff',
  },
  title: {
    fontSize: 24,
    fontWeight: 'bold',
    textAlign: 'center',
    marginBottom: 15,
  },
  row: {
    justifyContent: 'space-around',
    marginHorizontal: 5,
  },
});
