import 'package:flutter/material.dart';
import 'package:foxbrain_task/model/country.dart';
import 'package:foxbrain_task/screens/detail_screen.dart';
import 'package:foxbrain_task/service/api_service.dart';
import 'package:foxbrain_task/service/db_provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isLoading = false;
  late int selectedIndex = -1;
  late List<Country> country;

  @override
  void initState() {
    ApiService().get();
    super.initState();

    refreshCountry();
  }

  @override
  void dispose() {
    DBProvider.instance.close();

    super.dispose();
  }

  Future refreshCountry() async {
    setState(() => isLoading = true);

    this.country = await DBProvider.instance.readAllCountry();

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.black,
          title: const Text(
            'Country List',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: country.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        var con = country[index];
                        late var select = country[index].isSelected;
                        return InkWell(
                          onTap: () async {
                            if (selectedIndex == -1) {
                              setState(() {
                                selectedIndex = index;
                                con.isSelected = true;
                              });
                            } else {
                              setState(() {
                                country[selectedIndex].isSelected = false;
                                selectedIndex = index;
                                con.isSelected = true;
                              });
                            }
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetailScreen(country: con),
                              ),
                            );
                          },
                          child: Container(
                            height: 80,
                            width: width,
                            color: index % 2 == 0
                                ? Colors.white
                                : Colors.grey[300],
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Center(
                                          child: Text(
                                            con.name.substring(0, 1),
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Container(
                                        width: width * 0.6,
                                        child: Text(
                                          con.name,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Icon(
                                    con.isSelected
                                        ? Icons.favorite
                                        : Icons.favorite_border_rounded,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
