import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pharmazon/constants.dart';
import 'package:pharmazon/features/home/data/repos/home_repo.dart';
import 'package:pharmazon/core/utils/api_service.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService _apiService;

  HomeRepoImpl(this._apiService);
  @override
  Future<void> logOut() async {
    const storage = FlutterSecureStorage();
    final token = await storage.read(key: 'token');
    await _apiService.delete(
      urlEndPoint: '$kBaseUrl/logout',
      body: {
        'api_token':token,
      },
      token: null
    
      // Replace with your token if needed
    );

    // Read value
    await storage.delete(key: 'token');
  }
}
