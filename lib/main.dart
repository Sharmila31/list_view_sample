import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Dispatch.dart';
import 'MyThemeData.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(
    home: BaseWidget(),
    theme: ThemeData(
      primaryColor: MyThemeData.PrimaryColor,
    ),
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
    setSystemBarTheme();

    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Sample'),
        brightness: Brightness.dark,
      ),
      body: ListView.builder(
        itemCount: dispatchList.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Card(
              elevation: 6,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  dispatchList[index].DispatchNumber,
                                  style: TextStyle(
                                    color: MyThemeData.PrimaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              if (dispatchList[index].Status != null)
                                Container(
                                  decoration: BoxDecoration(
                                    color: MyThemeData.GreyBackgroundColor,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20.0),
                                    ),
                                    border: Border.all(
                                      color: MyThemeData.GreyBackgroundColor,
                                    ),
                                  ),
                                  child: Container(
                                    margin: EdgeInsets.symmetric(horizontal: 8),
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(dispatchList[index].Status!),
                                    //nullable check as Status is declared as final
                                  ),
                                ),
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
                                child: Image.asset(
                                    'assets/images/pick_up_img.png'),
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
                                child: Image.asset(
                                    'assets/images/delivery_img.png'),
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
                    Container(
                        width: 5,
                        height: 5,
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: MyThemeData.PrimaryColor,
                          size: 15,
                        ),
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

void setSystemBarTheme() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: MyThemeData.StatusBarColor,
    // navigation bar color
    statusBarColor: MyThemeData.StatusBarColor, // status bar color
  ));
}
