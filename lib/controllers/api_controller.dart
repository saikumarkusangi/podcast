
import 'package:flutter_application_1/models/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/api_services.dart';

final collectionsProvider = FutureProvider<List<CatergoriesModel>>((ref) async {
  return ref.watch(ApiDataProvider).fetchCollections();
});

