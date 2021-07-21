import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Dispatch.dart';

void main() {
  runApp(MaterialApp(
    home: BaseWidget(),
  ));
}

class BaseWidget extends StatelessWidget {
  final dispatchList = [
    Dispatch("DISPATCH-1001", 1001, "Florida, MO, 23456",
        "California, CA, 98789", "07/20/2021"),
    Dispatch("DISPATCH-1002", 1002, "Fulton, MO, 98700",
        "North Beltrami, MN, 97547", "07/21/2021",
        Status: "Assigned"),
    Dispatch("DISPATCH-1003", 1003, "Marshall, TX, 92823", "Berni, M0, 72536",
        "07/22/2021",
        Status: "Assigned", DeliveryDate: "07/24/2021"),
    Dispatch("DISPATCH-1004", 1004, "Rockville, NE, 12039",
        "Shellbyville skhd sjgfsfdg ksjfhg, KY, 82736", "07/23/2021",
        DeliveryDate: "07/25/2021")
  ];

  final italicFontStyle = TextStyle(
    fontStyle: FontStyle.italic,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Sample'),
      ),
      body: ListView.builder(
        itemCount: dispatchList.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(15),
            child: Card(
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            dispatchList[index].DispatchNumber,
                          ),
                        ),
                        if (dispatchList[index].Status != null)
                          Text(dispatchList[index].Status!),
                        //nullable check as Status is declared as final
                      ],
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 25,
                          height: 25,
                          child: Image.asset('assets/images/pick_up_img.png'),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Text(dispatchList[index].PickUpLocation),
                        ),
                        Text(
                          dispatchList[index].PickUpDate,
                          style: italicFontStyle,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 25,
                          height: 25,
                          child: Image.asset('assets/images/delivery_img.png'),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Text(
                            dispatchList[index].DeliveryLocation,
                          ),
                        ),
                        if (dispatchList[index].DeliveryDate != null)
                          Container(
                            child: Text(
                              dispatchList[index].DeliveryDate!,
                              textAlign: TextAlign.end,
                              style: italicFontStyle,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
