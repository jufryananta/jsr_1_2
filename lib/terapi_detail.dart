import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class TerapiDetail extends StatelessWidget {
  final data;
  const TerapiDetail({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          data['nama'],
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: ListView(
        //child: Column(
        //  mainAxisSize: MainAxisSize.max,
        //  crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Flexible(
                  flex: 3,
                  child: Stack(
                    children: [
                      Image(
                        image:
                            AssetImage('assets/images/' + data["img"] + '.jpg'),
                        fit: BoxFit.cover,
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          heightFactor: 1,
                          child: Text(
                            'sumber: ' + data['sumber'],
                            style: const TextStyle(
                                backgroundColor:
                                    Color.fromARGB(172, 58, 58, 58),
                                color: Colors.white),
                          )),
                    ],
                  ),
                ),
              ]),
          Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Flexible(
                    flex: 7,
                    child: Column(children: [
                      Container(
                          color: const Color.fromARGB(255, 201, 255, 234),
                          alignment: Alignment.center,
                          padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          child: const Text(
                            'Bagaimanakah Caranya?',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22),
                          )),
                      ListView.builder(
                        padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                        shrinkWrap: true,
                        primary: false,
                        itemCount: data['cara'].length,
                        itemBuilder: (context, index) {
                          return Padding(
                              padding: const EdgeInsets.all(4),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    data['cara'][index]
                                            .toString()
                                            .toLowerCase()
                                            .contains('hindari')
                                        ? const Text('\u2717 ',
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.red))
                                        : const Text('\u2713 ',
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.green)),
                                    Flexible(
                                        child: Text(
                                      data['cara'][index],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 18),
                                    )),
                                  ]));
                        },
                      ),
                      Container(
                          color: const Color.fromARGB(255, 162, 212, 253),
                          alignment: Alignment.center,
                          padding: const EdgeInsets.fromLTRB(0, 6, 0, 6),
                          child: const Text(
                            'Info',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          )),
                      SingleChildScrollView(
                        child: Html(data: data['info']),
                      ),
                    ])),
              ])
        ],
      ),
    );
  }
}
