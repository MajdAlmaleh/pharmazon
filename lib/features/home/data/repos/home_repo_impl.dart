
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pharmazon/features/home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  @override
  Future<void> logOut()async {
      const storage =  FlutterSecureStorage();

    // Read value 
   await storage.delete(key: 'token');
  
  }
 
}
