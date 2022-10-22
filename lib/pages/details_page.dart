
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

  String getname='';
  String getsalary='';
  String getage='';
  late EmpOne empone;


   //late Employee item;

  void _apiEmpOne(int id){
    Network.GET(Network.API_ONEEMP, Network.paramsEmpty()).then((response) => {
      empone = Network.parseEmpOne(response!),
      setState(() {
        getname=empone.data.employee_name;
        getsalary=empone.data.employee_salary.toString();
        getage=empone.data.employee_age.toString();
      }),
    });
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
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(bottom: 1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("$getname($getage)", style: const TextStyle(color: Colors.black, fontSize: 20),),
                const SizedBox(height: 20,),
                Text("$getsalary\$", style: const TextStyle(color: Colors.black, fontSize: 18),),
              ],
            ),
          ),
        ),
      );
    }
  }

