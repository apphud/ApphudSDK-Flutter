import 'package:apphud/apphud.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExampleScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ExampleScreenState();
  }
}

class ExampleScreenState extends State<ExampleScreen> {
  @override
  void initState() {
    super.initState();

    AppHud.startManually(
      apiKey: "app_DZzKAkuBWhe9nz3qeofJMU9PJezkxn",
      userID: "test_ren6_10_2",
      deviceID: "a356ca94-e3e2-4a1f-8096-b75af8ab7411",
      observerMode: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
    // return Scaffold(
    //   appBar: AppBar(),
    //   body: FutureBuilder<List<SKProductWrapper>>(
    //     future: AppHud.products(),
    //     builder: (BuildContext context,
    //         AsyncSnapshot<List<SKProductWrapper>> snapshot) {
    //       if (snapshot.hasData) {
    //         return ListView.builder(
    //           itemCount: snapshot.data.length,
    //           itemBuilder: (context, index) {
    //             return InkWell(child: ListTile(
    //               title: Text('${snapshot.data[index].localizedTitle}'),
    //               subtitle: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Text("price: ${snapshot.data[index].price}"),
    //                   Text(
    //                       "productIdentifier: ${snapshot.data[index]
    //                           .productIdentifier}")
    //                 ],
    //               ),
    //               trailing: Icon(Icons.monetization_on_outlined),
    //             ),
    //               onTap: () async {
    //                 ApphudPurchaseResultWrapper response = await AppHud.purchase(snapshot.data[index].productIdentifier);
    //                 print(response);
    //               },);
    //           },
    //         );
    //       } else if (snapshot.hasError) {
    //         return Text(snapshot.error);
    //       } else {
    //         return Center(
    //           child: CircularProgressIndicator(),
    //         );
    //       }
    //     },
    //   ),
    // );
  }
}
