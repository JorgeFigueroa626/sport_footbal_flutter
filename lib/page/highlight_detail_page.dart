// ignore_for_file: sized_box_for_whitespace, import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import 'package:sport_football/ob/higlight_ob.dart';
import 'package:url_launcher/url_launcher.dart';

class HighLightDetailPage extends StatelessWidget {
  HighLightDetailPage(this.hlob, {super.key});

  HighlightOb hlob;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title: Text(hlob.title!),
        actions: [
          IconButton(
              onPressed: () {
                _launchURL();
              },
              icon: const Icon(Icons.language))
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: 300,
            child: HtmlWidget(
              hlob.embed,
              webView: true,
              webViewJs: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hlob.competition!.name!,
                  style: const TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "${hlob.side1!.name}   Vs   ${hlob.side2!.name}",
                  style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                //const SizedBox(height: 10,)
                const Divider(color: Colors.red, thickness: 2),
                const Text(
                  "Videos",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Column(
                          children: [
                            Container(
                              height: 150,
                              width: 250,
                              child: HtmlWidget(
                                hlob.videos![index].embed,
                                webView: true,
                                webViewJs: true,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(hlob.videos![index].title!)
                          ],
                        ),
                      );
                    },
                    itemCount: hlob.videos!.length,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  _launchURL() async {
    if (await canLaunch(hlob.url)) {
      await launch(hlob.url);
    } else {
      throw 'Could not launch this url';
    }
  }
}
