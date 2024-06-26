import 'package:injectable/injectable.dart';
import 'package:state_learning/datasources/remote_data_source.dart';


@lazySingleton  
class FakeRepository {
  final RemoteDataSource _remoteDataSource;

  FakeRepository(this._remoteDataSource);

  Future<String> fetchData() async {
    const isNetworkOnline = true;
    if (isNetworkOnline) {
      final results = _remoteDataSource.fetchData();

    return results;
    } 
  }
}