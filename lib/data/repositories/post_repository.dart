import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart' show FirebaseFirestore, DocumentReference, FieldValue, DocumentSnapshot;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:litra_ar_draw_app/domain/entitys/users_post_item.dart';
import 'package:litra_ar_draw_app/domain/repositories/use_post_repository.dart';
import 'package:litra_ar_draw_app/presentation/enums/gallery_permission_status.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:uuid/uuid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PostRepository implements UsePostRepository{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  final ImagePicker _picker = ImagePicker();
  final List<UsersPostItem> postList = [];

  @override
  Future<File?> pickImage({ImageSource source = ImageSource.gallery}) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: source,
        maxWidth: 1920,
        maxHeight: 1080,
        imageQuality: 85,
      );

      if (pickedFile != null) {
        return File(pickedFile.path);
      }
      return null;
    } catch (e) {
      print('Resim seçme hatası: $e');
      return null;
    }
  }

  @override
  Future<String?> createPost({
    required UsersPostItem userPostItem,
  }) async
  {
    try{

      DocumentReference postRef = await _firestore.collection('posts').add({
        'userId': userPostItem.userId,
        'title': userPostItem.postTitle,
        'content': userPostItem.postContent,
        'imageUrl': userPostItem.imageUrl,
        'createdAt': FieldValue.serverTimestamp(),
        'spark': userPostItem.sparkScore

      });

      String postId = postRef.id;

      await _firestore.collection('users').doc(userPostItem.userId).update({
          'postsId': FieldValue.arrayUnion([postId])
        }
      );

      return postId;

    }catch (e){
      print('Post oluşturma hatası: $e');
      return null;
    }
  }

  @override
  Future<void> deletePost(String postId, String userId) async {
    try{
      DocumentSnapshot postDoc = await _firestore
            .collection('posts')
            .doc(postId)
            .get();

      if(postDoc.exists){
        Map<String,dynamic> data = postDoc.data() as Map<String,dynamic>;
        String? imageUrl = data['imageUrl'];

        //Resimi strogedan sil
        if(imageUrl != null && imageUrl.isNotEmpty){
          Reference ref = _storage.refFromURL(imageUrl);
          await ref.delete();
          print('Resim silindi');
        }

        //post fierstordan da silindi
        await _firestore.collection('posts').doc(postId).delete();

        await _firestore.collection('users').doc(userId).update({
          'postsId' : FieldValue.arrayRemove([postId])
        });

        print("Post silindi");

      }

    }catch(e){
       print("Post slime hatası");
    }

  }

  @override
  Future<String?> sharePostWithImage({
    required String title,
    required String content,
    required File imageFile}) async
  {
    //Hepsini birleştiren fonskiyon.

    try{
      final user = _auth.currentUser;
      if(user == null){
        throw Exception('Kullanıcı giriş yapmamış');
      }

      String? imageUrl = await uploadImage(imageFile: imageFile, userId:user.uid);

      if(imageUrl == null){
        return null;
      }


      String? postId = await createPost(userPostItem:
      UsersPostItem(
          userId: user.uid,
          postTitle: title,
          imageUrl: imageUrl,
          postContent: content,
          sparkScore: 0)
      );

      return postId;

    }catch(e){
      print("Hata: $e");
      return null;
    }
  }

  @override
  Future<String?> uploadImage({
    required File imageFile,
    required String userId}) async
  {

    try {
      String fileName = '${const Uuid().v4()}.jpg';

      //Storage yolu: post/{userId}/{fileNam}
      Reference ref = _storage.ref().child('posts/$userId/$fileName');

      SettableMetadata metadata = SettableMetadata(
          contentType: 'image/jpg',
          customMetadata: {
            'uploadedBy' : userId,
            'uploadedAt' : DateTime.now().toIso8601String(),
          }
      );

      UploadTask uploadTask = ref.putFile(imageFile,metadata);
      uploadTask.snapshotEvents.listen((TaskSnapshot snapShot){

        double progress = (snapShot.bytesTransferred / snapShot.totalBytes)*100;
        print('Yukleme durumu: ${progress.toStringAsFixed(2)}%');
      });

      TaskSnapshot snapshot = await uploadTask;

      String downlandUrl = await snapshot.ref.getDownloadURL();

      print("Resim başarıyla yüklendi: $downlandUrl");

      return downlandUrl;
    } catch (e){
      print('Resim yuklenemedi: $e');
      return null;
    }

  }


  @override
  Future<GalleryPermissionStatus> requestGalleryPermission() async {
    PermissionStatus status;

    if (await Permission.photos.isGranted) {
      return GalleryPermissionStatus.granted;
    }

    status = await Permission.photos.request();

    if (status.isGranted) {
      return GalleryPermissionStatus.granted;
    } else {
      return GalleryPermissionStatus.denied;
    }
  }

  @override
  Future<List<UsersPostItem>> getPostList() async{

     final querySnapshot = await _firestore
         .collection('posts')
         .orderBy('createdAt',descending: true)
         .limit(10)
         .get();

     final newPosts = querySnapshot.docs.map((doc){

       final data = doc.data() as Map<String,dynamic>;
       final timestamp = data['createdAt'] as Timestamp;

       return UsersPostItem(
         userId: data['userId']?.toString() ?? '',
         imageUrl: data['imageUrl']?.toString() ?? '',
         postTitle: data['title']?.toString(),
         postContent: data['content']?.toString(),
         createdAt: timestamp.toDate().toIso8601String(),
         sparkScore: int.tryParse(data['spark']?.toString() ?? '0'),
       );
     }).toList();

     postList.addAll(newPosts);

     return postList;
  }



}
