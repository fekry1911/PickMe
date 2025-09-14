import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseImageService {
  final SupabaseClient  supabase ;
  final picker = ImagePicker();
  SupabaseImageService(this.supabase);


  /// Pick single image
  Future<File?> pickImage({bool fromCamera = false}) async {
    final pickedFile = await picker.pickImage(
      source: fromCamera ? ImageSource.camera : ImageSource.gallery,
      imageQuality: 80, // يقلل الحجم ويحافظ على الجودة
    );
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }

  /// Upload single image and return its URL
  Future<String?> uploadImage(File imageFile, String uid, {String? folderName}) async {
    try {
      final filePath =
          "users/$uid/${folderName ?? "general"}/${DateTime.now().millisecondsSinceEpoch}.png";

      // حوّل الملف إلى Bytes
      final bytes = await imageFile.readAsBytes();

      // استخدم uploadBinary بدلاً من upload
      await supabase.storage
          .from("drivers_bucket") // لازم يكون نفس اسم الـ bucket بالظبط
          .uploadBinary(filePath, bytes);

      // رجّع الرابط العام
      return supabase.storage.from("drivers_bucket").getPublicUrl(filePath);
    } catch (e) {
      print("❌ Error uploading image: $e");
      return null;
    }
  }
}
