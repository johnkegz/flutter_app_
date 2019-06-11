/*
Todo 
*/
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
class Todo {
  int id;
  String first_name;
  String last_name;
  String avatar;
  //Constructor
  Todo({this.id, this.first_name, this.last_name, this.avatar});
  //Static method
  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
        id: json['id'],
        first_name: json['first_name'],
        last_name: json['last_name'],
        avatar: json['avatar']);
  }
}
//Fetch data from restfull api
Future<List<Todo>> fetchTodos(http.Client client) async{
  //How to make a url in a .dart file
  final response = await client.get("https://reqres.in/api/users");
  if(response.statusCode == 200){
    Map<String, dynamic> mapResponse = json.decode(response.body);
    if(mapResponse['page'] != null){
      final todos = mapResponse['data'].cast<Map<String, dynamic>>();
      final listOfTodos = await todos.map<Todo>((json) {
        return Todo.fromJson(json);
      }).toList();
      return listOfTodos;
    }
    else {
      return [];
    }
  }
  else {
      throw Exception('Failed to load data from the internet');
    }
}
