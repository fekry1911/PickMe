import 'package:firebase_auth/firebase_auth.dart';

class FirebaseErrorHandler {
  // 🟢 Singleton instance
  static final FirebaseErrorHandler instance = FirebaseErrorHandler._internal();

  // 🛠️ Private constructor
  FirebaseErrorHandler._internal();

  /// 🔹 Handle FirebaseAuth Errors
  String getAuthErrorMessage(FirebaseAuthException e) {
    print("🔥 Auth Error Code: ${e.code}");

    switch (e.code) {
      // ✅ شائعة مع التسجيل
      case "weak-password":
        return "كلمة المرور ضعيفة جدًا.";
      case "email-already-in-use":
        return "هذا البريد الإلكتروني مستخدم بالفعل.";
      case "invalid-email":
        return "البريد الإلكتروني غير صالح.";
      case "operation-not-allowed":
        return "طريقة تسجيل الدخول هذه غير مفعلة.";

      // ✅ شائعة مع تسجيل الدخول
      case "user-not-found":
      case "invalid-credential":
      case "invalid-login-credentials":
        return "لا يوجد مستخدم بهذا البريد.";
      case "wrong-password":
        return "كلمة المرور غير صحيحة أو بيانات الدخول غير صالحة.";
        case "user-disabled":
        return "تم تعطيل هذا الحساب.";
      case "too-many-requests":
        return "محاولات كثيرة جدًا. جرب لاحقًا.";

      // ✅ تخص التوكن أو الجلسة
      case "user-token-expired":
      case "invalid-user-token":
      case "id-token-expired":
        return "انتهت صلاحية جلسة تسجيل الدخول. يرجى تسجيل الدخول مرة أخرى.";
      case "invalid-verification-code":
      case "invalid-verification-id":
        return "كود التحقق غير صحيح.";

      // ✅ تخص الهاتف
      case "missing-verification-code":
        return "من فضلك أدخل كود التحقق المرسل لهاتفك.";
      case "missing-verification-id":
        return "حدث خطأ في عملية التحقق. جرب مرة أخرى.";
      case "session-expired":
        return "انتهت صلاحية جلسة التحقق. أعد المحاولة.";

      // ✅ تخص الشبكة
      case "network-request-failed":
        return "تأكد من اتصالك بالإنترنت.";

      default:
        return "حدث خطأ غير متوقع أثناء تسجيل الدخول. [${e.code}]";
    }
  }

  /// 🔹 Handle Firestore Errors
  String getFirestoreErrorMessage(FirebaseException e) {
    print("🔥 Firestore Error Code: ${e.code}");

    switch (e.code) {
      case "cancelled":
        return "تم إلغاء العملية.";
      case "unknown":
        return "خطأ غير معروف حدث في قاعدة البيانات.";
      case "invalid-argument":
        return "تم تمرير بيانات غير صحيحة.";
      case "deadline-exceeded":
        return "انتهى وقت الطلب. حاول مرة أخرى.";
      case "not-found":
        return "المستند المطلوب غير موجود.";
      case "already-exists":
        return "البيانات موجودة بالفعل.";
      case "permission-denied":
        return "لا تملك صلاحية للوصول لهذه البيانات.";
      case "resource-exhausted":
        return "تم استهلاك الحد الأقصى للموارد.";
      case "failed-precondition":
        return "لا يمكن تنفيذ العملية في الوقت الحالي.";
      case "aborted":
        return "تم إلغاء العملية بسبب تعارض.";
      case "out-of-range":
        return "البيانات خارج النطاق المسموح.";
      case "unimplemented":
        return "العملية غير مدعومة.";
      case "internal":
        return "خطأ داخلي في الخادم.";
      case "unavailable":
        return "خدمة قاعدة البيانات غير متاحة حاليًا.";
      case "data-loss":
        return "فقدان بيانات بشكل غير متوقع.";
      case "unauthenticated":
        return "يجب تسجيل الدخول للوصول لهذه البيانات.";
      default:
        return "حدث خطأ أثناء التعامل مع قاعدة البيانات. [${e.code}]";
    }
  }
}
