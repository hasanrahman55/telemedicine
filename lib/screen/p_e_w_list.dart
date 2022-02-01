//pregnancy Every Week List .....

import 'package:flutter/material.dart';
import 'package:telemedicine/model/p_e_w_data.dart';
import 'package:telemedicine/screen/p_e_w_details_page.dart';

class pregnancyEveryWeek extends StatelessWidget {
  const pregnancyEveryWeek({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Pregnancy Every Week"),
        ),
        body: ListView.separated(
          separatorBuilder: (context, index) => Divider(
            color: Colors.black,
          ),
          itemCount: listData.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DetailsPage(
                          details: listData[index].details,
                        )));
              },
              title: Text(listData[index].title),
              subtitle: Text(listData[index].subtitle),
            );
          },
        ));
  }
}
