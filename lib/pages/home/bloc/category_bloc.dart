import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'category_event.dart';
import 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryInitial()) {
    on<FetchCategories>((event, emit) async {
      emit(CategoryLoading());
      try {
        final categories = await _fetchCategories();
        emit(CategoryLoaded(categories));
      } catch (e) {
        emit(CategoryError(e.toString()));
      }
    });
  }

  Future<List<dynamic>> _fetchCategories() async {
    try{

    }catch(e) {

    }
    final response = await http.post(
      Uri.parse('http://esptiles.imperoserver.in/api/API/Product/DashBoard'),
      body: jsonEncode({
        "CategoryId": 0,
        "DeviceManufacturer": "Google",
        "DeviceModel": "Android SDK built for x86",
        "DeviceToken": " ",
        "PageIndex": 1
      }),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      print("====>>>>${response.body}");
      final data = jsonDecode(response.body);
      return data['Result']['Category'];
    } else {
      throw Exception('Failed to load categories');
    }
  }
}
