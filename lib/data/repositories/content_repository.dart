import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:litra_ar_draw_app/domain/entitys/category_entity.dart';
import 'package:litra_ar_draw_app/domain/repositories/use_content_repository.dart';

class ContentRepository implements UseContentRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  @override
  Future<List<CategoryEntity>> getCategoryItem(String category) async {
    final querySnapshot = await _firestore
        .collection('categorys')
        .where('category', isEqualTo: category)
        .limit(20)
        .get();

    // 🔥 async map → Future.wait
    return Future.wait(
      querySnapshot.docs.map((doc) async {
        final data = doc.data();

        final String imagePath = data['imageUrl'] ?? '';

        String downloadUrl = '';
        if (imagePath.isNotEmpty) {
          try {
            downloadUrl =
            await _storage.ref(imagePath).getDownloadURL();
          } catch (e) {
            downloadUrl = '';
          }
        }

        return CategoryEntity(
          order: (data['order'] as num?)?.toInt() ?? 0,
          category: data['category'] ?? '',
          imageUrl: downloadUrl,
          isActive: data['isActive'] as bool? ?? false,
          type: data['type'] ?? '',
        );
      }),
    );
  }
}
