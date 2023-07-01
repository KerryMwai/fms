import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String name;
  const CustomCard({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(10),
                              width: MediaQuery.of(context).size.width * 0.21,
                              child: Text(
                                name,
                                maxLines: 1,
                                style: const TextStyle(
                                    overflow: TextOverflow.ellipsis),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 10, right: 10, left: 10, bottom: 4),
                              height: MediaQuery.of(context).size.width * 0.12,
                              width: MediaQuery.of(context).size.width * 0.12,
                              decoration: const BoxDecoration(
                                  color: Colors.grey, shape: BoxShape.circle),
                              child: const Center(
                                child: Icon(Icons.menu),
                              ),
                            )
                          ],
                        ),
                        const Divider(
                          color: Colors.black,
                          height: 0,
                        ),
                        Expanded(
                            child: Container(
                          decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(0.5),
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                        ))
                      ],
                    ),
                  );
  }
}