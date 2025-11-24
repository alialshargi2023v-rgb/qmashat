import React from 'react';
import { View, Text, Image, StyleSheet, TouchableOpacity, Dimensions } from 'react-native';
// (يجب أن يتم استيراد شاشة FabricDetailScreen هنا)

const screenWidth = Dimensions.get('window').width;
const itemWidth = (screenWidth / 2) - 15; // عرض العمودين مع الهوامش

const FabricItem = ({ fabric, allDesigns, navigation }) => {
  const handlePress = () => {
    // للتنقل إلى شاشة التفاصيل
    // يجب أن تكون شاشة FabricDetailScreen مسجلة في التنقل (Navigation Stack)
    navigation.navigate('FabricDetail', { fabric, allDesigns });
  };

  return (
    <TouchableOpacity onPress={handlePress} style={styles.cardContainer}>
      <View style={styles.card}>
        <Image 
          source={{ uri: fabric.imageUrl }} 
          style={styles.image} 
          resizeMode="cover" 
        />
        <View style={styles.details}>
          <Text style={styles.name} numberOfLines={1}>{fabric.name}</Text>
          <Text style={styles.type}>{fabric.type}</Text>
        </View>
      </View>
    </TouchableOpacity>
  );
};

// ... (أنماط Stylesheet)
const styles = StyleSheet.create({
    cardContainer: {
        width: itemWidth,
        marginVertical: 10,
        backgroundColor: '#f8f8f8',
        borderRadius: 8,
        elevation: 3,
        shadowColor: '#000',
        shadowOffset: { width: 0, height: 2 },
        shadowOpacity: 0.1,
        shadowRadius: 4,
    },
    image: {
        width: '100%',
        height: 150,
        borderTopLeftRadius: 8,
        borderTopRightRadius: 8,
    },
    // ...
});

export default FabricItem;
