import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foxbrain_task/model/country.dart';

class DetailScreen extends StatefulWidget {
  final Country country;

  DetailScreen({required this.country});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late double lating;
  late double population;
  late double currencies;
  late double region;
  late double subregion;

  @override
  void initState() {
    initializeContainerSize();
    super.initState();
  }

  initializeContainerSize() {
    setState(() {
      lating = 50;
      population = 50;
      currencies = 50;
      region = 50;
      subregion = 50;
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    // var curr = widget.country.currencies;
    // print(widget.country.currencies.length);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          elevation: 0,
          title: Text(
            widget.country.name,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 200,
                  width: width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    child: SvgPicture.network(
                      widget.country.flag,
                      fit: BoxFit.fill,
                      height: 200.0,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    setState(() {
                      initializeContainerSize();
                      lating = 80;
                    });
                  },
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    height: lating,
                    width: width,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: lating == 80
                        ? SingleChildScrollView(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 25.0, top: 15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Lating',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    '${widget.country.latlng0}   ${widget.country.latlng1}',
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : const Padding(
                            padding: EdgeInsets.only(left: 25.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Lating',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                  ),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    setState(() {
                      initializeContainerSize();
                      population = 80;
                    });
                  },
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    height: population,
                    width: width,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: population == 80
                        ? SingleChildScrollView(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 25.0, top: 15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Population',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    widget.country.population,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : const Padding(
                            padding: EdgeInsets.only(left: 25.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Population',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                  ),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    setState(() {
                      initializeContainerSize();
                      currencies = 110;
                    });
                  },
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    height: currencies,
                    width: width,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: currencies == 110
                        ? SingleChildScrollView(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 25.0, top: 5),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Currencies',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    widget.country.currencies0.toString(),
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    widget.country.currencies1.toString(),
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    widget.country.currencies2.toString(),
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : const Padding(
                            padding: EdgeInsets.only(left: 25.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Currencies',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                  ),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    setState(() {
                      initializeContainerSize();
                      region = 80;
                    });
                  },
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    height: region,
                    width: width,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: region == 80
                        ? SingleChildScrollView(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 25.0, top: 15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Region',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    widget.country.region,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : const Padding(
                            padding: EdgeInsets.only(left: 25.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Region',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                  ),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    setState(() {
                      initializeContainerSize();
                      subregion = 80;
                    });
                  },
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    height: subregion,
                    width: width,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: subregion == 80
                        ? SingleChildScrollView(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 25.0, top: 15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Subregion',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    widget.country.subregion,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : const Padding(
                            padding: EdgeInsets.only(left: 25.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Subregion',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
