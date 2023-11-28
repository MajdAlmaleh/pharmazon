import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pharmazon/blocs/token_cubit/token_cubit.dart';
import 'package:pharmazon/constants.dart';
import 'package:pharmazon/features/home/data/repos/home_repo.dart';
import 'package:pharmazon/core/utils/api_service.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService _apiService;
 final tokenCubit = TokenCubit();
  HomeRepoImpl(this._apiService);
  @override
  Future<void> logOut() async {
    await _apiService.delete(
        urlEndPoint: '$kBaseUrl/logout',
        body: {
          'api_token': tokenCubit.state,
        },
        token: null

        // Replace with your token if needed
        );

    // Read value
    tokenCubit.deleteSavedToken();
  }
}
