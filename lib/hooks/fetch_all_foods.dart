import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;

import '../constants/constants.dart';
import '../models/api_error.dart';
import '../models/foods.dart';
import '../models/hook_models/hook_result.dart';

FetchHook useFetchAllFoods({code}) {
  final foods = useState<List<FoodsModel>?>(null);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final apiError = useState<ApiError?>(null);

  fetchData() async {
    isLoading.value = true;
    try {
      Uri url = Uri.parse("$appBaseUrl/api/food/recommendation/$code");
      final response = await http.get(url);
      if (response.statusCode == 200) {
        foods.value = foodsModelFromJson(response.body);
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
      data: foods.value,
      isLoading: isLoading.value,
      error: error.value,
      reFetch: reFetch);
}
