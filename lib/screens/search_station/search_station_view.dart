import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchStationView extends StatelessWidget {
  const SearchStationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200.0),
        child: AppBar(
          backgroundColor: Color(0xFF743BBC),
          centerTitle: true,
          title: Text("Search Station"),
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Icon(Icons.close),
            ),
          ],
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Which PriceLOCQ station will you likely visit?",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: 300,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1F4FB),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: "Search",
                      hintStyle: TextStyle(color: Colors.black26),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 18, horizontal: 20),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (var i = 0; i < 10; i++)
              ListTile(
                onTap: () {},
                title: Text(
                  "SEAOIL INDEX $i - ADDRESS",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: Text("kilometer away from you"),
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                // I dont know the functionality of the radio button
                // if the user can select multiple station
                // i just added a plain radio button
                trailing: Radio(
                  value: 1,
                  groupValue: 0,
                  onChanged: (val) {},
                ),
              )
          ],
        ),
      ),
    );
  }
}
