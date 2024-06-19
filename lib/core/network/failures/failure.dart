class Failure implements Exception {
  final String message;

  Failure(this.message);

  @override
  String toString() {
    return message;
  }
}

class GeneralFailure extends Failure {
  GeneralFailure(super.message);
}

class CustomFirebaseException extends Failure {
  CustomFirebaseException(super.message);

  @override
  String toString() {
    return message;
  }
}

// Auth
class FirebaseUserNotFoundAuthException extends CustomFirebaseException {
  FirebaseUserNotFoundAuthException() : super("User not found.");
}

class FirebaseInvalidCredentialsAuthException extends CustomFirebaseException {
  FirebaseInvalidCredentialsAuthException() : super("Invalid Credentials.");
}

class FirebaseEmailAlreadyInUseAuthException extends CustomFirebaseException {
  FirebaseEmailAlreadyInUseAuthException() : super("Email already exists.");
}

class FirebaseWeakPasswordAuthException extends CustomFirebaseException {
  FirebaseWeakPasswordAuthException() : super("Please try a strong password.");
}

// Firestore
class FirebaseDocumentNotExistsFirestoreException
    extends CustomFirebaseException {
  FirebaseDocumentNotExistsFirestoreException()
      : super("Record doesn't exsits.");
}

class FirebasePermissionDeniedFirestoreException
    extends CustomFirebaseException {
  FirebasePermissionDeniedFirestoreException()
      : super("You are not authorized.");
}

// Storage
class FirebaseObjectNotFoundStorageException extends CustomFirebaseException {
  FirebaseObjectNotFoundStorageException() : super("File not found.");
}

class FirebaseUnauthorizedStorageException extends CustomFirebaseException {
  FirebaseUnauthorizedStorageException()
      : super("You're not authorized to access the file.");
}

class FirebaseFileTooLargeStorageException extends CustomFirebaseException {
  FirebaseFileTooLargeStorageException()
      : super("File is too large to upload.");
}
