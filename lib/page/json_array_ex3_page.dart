// ignore_for_file: import_of_legacy_library_into_null_safe, avoid_print, prefer_final_fields, avoid_function_literals_in_foreach_calls

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sport_football/ob/higlight_ob.dart';
import 'package:sport_football/page/highlight_detail_page.dart';
import 'package:sport_football/widget/highlight_widget.dart';

class JsonArrayEx3Page extends StatefulWidget {
  const JsonArrayEx3Page({super.key});

  @override
  State<JsonArrayEx3Page> createState() => _JsonArrayEx3PageState();
}

class _JsonArrayEx3PageState extends State<JsonArrayEx3Page> {
  final _scalffoldKey = GlobalKey<ScaffoldMessengerState>();
  String url = 'https://www.scorebat.com/video-api/v1/';

  List<HighlightOb> highList = [];

  bool isLoading = true;
  getData() async {
    setState(() {
      isLoading = true;
    });
    var response = await http.get(url);

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      List<dynamic> list = json.decode(response.body);

      list.forEach((element) {
        highList.add(HighlightOb.fromJson(element));
      });

      setState(() {
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      _scalffoldKey.currentState!.showSnackBar(const SnackBar(
        content: Text("Error Something Wrong"),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ));
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scalffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title: const Text("Sport Football"),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: highList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  child: HighlightWidget(highList[index]),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return HighLightDetailPage(highList[index]);
                      },
                    ));
                  },
                );
              },
            ),
    );
  }
}
