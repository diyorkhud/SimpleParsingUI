import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:parsingdemo/models/empone_model.dart';

import '../models/emp_model.dart';
import '../services/http_service.dart';
class DetailsPage extends StatefulWidget {
  static const String id = "details_page";
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

   late Employee item;

  void _apiEmpOne(int id){
    Network.GET(Network.API_ONEEMP, Network.paramsEmpty()).then((response) => {
      print(response),
      _showResponse(response!),
    });
  }

  void _showResponse(String response) {
    if (response != null) {
      EmpOne empOne = Network.parseEmpOne(response);
      setState(() {
        item = empOne.data;
      });
    } else {
      print("Try again");
    }
  }

  @override
  void initState(){
    super.initState();
    //var post = User(name:'Diyor', salary: 99, age:21, id: 1);
    _apiEmpOne(1);
  }


  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Details Page"),
          centerTitle: true,
        ),
        body: Container(
          child: Center(
            child: Container(child: itemOfOne(item)),
          ),
        ),
      );
    }

  Widget itemOfOne(Employee emp){
    return Center(
      child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.only(bottom: 1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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

