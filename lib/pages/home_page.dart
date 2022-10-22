import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:parsingdemo/models/emp_model.dart';
import 'package:parsingdemo/models/emplist_model.dart';
import 'package:parsingdemo/models/empone_model.dart';
import 'package:parsingdemo/pages/details_page.dart';
import 'package:parsingdemo/services/http_service.dart';

import '../models/user_model.dart';
class HomePage extends StatefulWidget {
  static const String id = "home_page";
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Employee> items = [];
  String? data;

  void _apiEmpList(){
    Network.GET(Network.API_LIST, Network.paramsEmpty()).then((response) => {
      print(response),
      _showResponse(response!),
    });
  }

  // void _apiEmpOne(int id){
  //   Network.GET(Network.API_ONEEMP, Network.paramsEmpty()).then((response) => {
  //     print(response),
  //     _showResponse(response!),
  //   });
  // }

  void _apiCreatePost(User post){
    Network.POST(Network.API_CREATE, Network.paramsCreate(post)).then((response) => {
      print(response),
      _showResponse(response!),
    });
  }

  void _apiUpdatePost(User post){
    Network.PUT(Network.API_UPDATE, Network.paramsUpdate(post)).then((response) => {
      print(response),
      _showResponse(response!),
    });
  }

  void _apiDeletePost(User post){
    Network.DEL(Network.API_DELETE, Network.paramsEmpty()).then((response) => {
      print(response),
      _showResponse(response!),
    });
  }

  void _showResponse(String? response){
    if(response != null){
      EmpList empList = Network.parseEmpList(response);
      setState((){
        items = empList.data;
      });
    }else{
      print("Try again");
    }


  }

  @override
  void initState(){
    super.initState();
    //var post = User(name:'Diyor', salary: 99, age:21, id: 1);
    _apiEmpList();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Employee List"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: items.length,
          itemBuilder: (ctx, i){
          return itemOfList(items[i]);
          },
      ),
    );
  }
  Widget itemOfList(Employee emp){
    return GestureDetector(
      onTap: (){
      Navigator.pushNamed(context, DetailsPage.id);

      },
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(bottom: 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${emp.employee_name}(${emp.employee_age})", style: const TextStyle(color: Colors.black, fontSize: 20),),
            const SizedBox(height: 20,),
            Text("${emp.employee_salary}\$", style: const TextStyle(color: Colors.black, fontSize: 18),),
          ],
        ),
      ),
    );
  }
}
