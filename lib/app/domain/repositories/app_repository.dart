import 'package:coding_challenge/app/data/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:injectable/injectable.dart';

abstract class AppRepository {
  Stream<User> get user;
}

@LazySingleton(as: AppRepository)
class ImpAppRepository implements AppRepository {
  ImpAppRepository(this._firebaseAuth);

  final firebase_auth.FirebaseAuth _firebaseAuth;

  @override
  Stream<User> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      final user = firebaseUser == null ? User.empty : firebaseUser.toUser;
      return user;
    });
  }
}

extension on firebase_auth.User {
  User get toUser {
    return User(id: uid, email: email, name: displayName, photo: photoURL);
  }
}
