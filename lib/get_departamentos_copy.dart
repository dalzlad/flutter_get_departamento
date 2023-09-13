import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_get_api/models/model_departamentos.dart';

import 'package:http/http.dart' as http;

class DepartamentoApiGet extends StatefulWidget {
  const DepartamentoApiGet({Key? key}) : super(key: key);

  @override
  State<DepartamentoApiGet> createState() => _DepartamentoApiGetState();
}

class _DepartamentoApiGetState extends State<DepartamentoApiGet> {
  bool _isLoading = true;
  DepartamentoModel? dataFromAPI;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  _getData() async {
    try {
      String url = "https://www.datos.gov.co/resource/ya3g-4kqg.json";
      http.Response res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        setState(() {
          dataFromAPI = DepartamentoModel.fromJson(json.decode(res.body));
          _isLoading = false;
        });
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("REST API Departamentos"),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SizedBox(
            child: Column(
                children: [
                  
                  /*const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       // Text("Valor del dólar"),
                        Text("Código"),
                        Text("Nombre"),
                      ],
                    ),
                  ),
                  */
          
          
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                     /* return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                           // Text("\$${dataFromAPI!.dolars[index].valor.toString()}"),
                            Text(dataFromAPI!.departamentos[index].iddepto.toString()),
                            Text(dataFromAPI!.departamentos[index].nomdepto.toString()),
                          ],
                        ),
                      );
                      */
                      return SizedBox(
            width: 150.0,
            height: 40.0,
            child: Card(child: Text(dataFromAPI!.departamentos[index].nomdepto.toString(),
            )
            
            ),
          );
          
                    },
                    itemCount: dataFromAPI!.departamentos.length,
                  ),
                ],
              ),
          ),
    );
  }
}