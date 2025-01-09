import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;

import '../constants/constants.dart';
import '../models/api_error.dart';
import '../models/categories.dart';
import '../models/hook_models/hook_result.dart';

FetchHook useFetchCategories() {
  final categoryItems = useState<List<CategoriesModel>?>(null);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final apiError = useState<ApiError?>(null);

  fetchData() async {
    isLoading.value = true;
    try {
      Uri url = Uri.parse("$appBaseUrl/api/category/random");
      final response = await http.get(url);
      if (response.statusCode == 200) {
        categoryItems.value = categoriesModelFromJson(response.body);
      } else {
        apiError.value = apiErrorFromJson(response.body);
      }
    } catch (e) {
      error.value = e as Exception;
    } finally {
      isLoading.value = false;
    }
  }

  useEffect(() {
    fetchData();
    return null;
  }, []);

  reFetch() {
    isLoading.value = true;
    fetchData();
  }

  return FetchHook(
      data: categoryItems.value,
      isLoading: isLoading.value,
      error: error.value,
      reFetch: reFetch);
}
