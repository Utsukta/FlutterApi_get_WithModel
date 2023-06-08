import 'package:flutter/material.dart';
import 'model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ApiData? apidata;
  Future fetchdata() async {
    try {
      final response =
          await http.get(Uri.parse('https://reqres.in/api/users/'));
      if (response.statusCode == 200) {
        setState(() {
          apidata = ApiData.fromJson(jsonDecode(response.body));
        });
      }
    } catch (e) {
      print('error to fetch data from api');
    }
  }

  @override
  void initState() {
    fetchdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text('get with method'),
          ),
          body: apidata != null
              ? Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: apidata!.data.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            subtitle:
                                Text(apidata!.data[index].email.toString()),
                            leading: Text(apidata!.data[index].id.toString()),
                            trailing:
                                Image.network(apidata!.data[index].avatar),
                            title: Text(
                                '${apidata!.data[index].firstname} ${apidata!.data[index].lastname}'),
                          ),
                        );
                      },
                    ),
                  ],
                )
              : const CircularProgressIndicator(),
        ));
  }
}
