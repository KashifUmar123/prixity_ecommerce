import 'package:firebase_core/firebase_core.dart';
import 'package:prixity_ecommerce_app/core/network/failures/failure.dart';

CustomFirebaseException wrapFirebaseException(FirebaseException e) {
  if (e.message?.contains('user-not-found') ?? false) {
    return FirebaseUserNotFoundAuthException();
  } else if (e.message?.contains('invalid-email') ??
      false || e.message!.contains('wrong-password')) {
    return FirebaseInvalidCredentialsAuthException();
  } else if (e.message?.contains('email-already-in-use') ?? false) {
    return FirebaseEmailAlreadyInUseAuthException();
  } else if (e.message?.contains('weak-password') ?? false) {
    return FirebaseWeakPasswordAuthException();
  } else if (e.message?.contains('PERMISSION_DENIED') ?? false) {
    return FirebasePermissionDeniedFirestoreException();
  } else if (e.message?.contains('NOT_FOUND') ?? false) {
    return FirebaseDocumentNotExistsFirestoreException();
  } else if (e.message?.contains('object-not-found') ?? false) {
    return FirebaseObjectNotFoundStorageException();
  } else if (e.message?.contains('unauthorized') ?? false) {
    return FirebaseUnauthorizedStorageException();
  } else if (e.message?.contains('file-too-large') ?? false) {
    return FirebaseFileTooLargeStorageException();
  } else {
    return CustomFirebaseException(e.message ?? "Something went wrong");
  }
}
