import 'dart:ui';

import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:moneyly/pages/selection.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class InvestmentTypeProvider extends ChangeNotifier {
  List<String> storedInvestList = [];
  List<String> exchangeDepot = [];
  String _selectedInvestmentType = "";
  String get selectedInvestmentType => _selectedInvestmentType;

  void updateSelectedInvestmentType(String value) {
    _selectedInvestmentType = value;
    notifyListeners();
    storedInvestList.add(value);
  }
}


class InvestmentPage extends StatefulWidget {
  const InvestmentPage({Key? key}) : super(key: key);

  @override
  State<InvestmentPage> createState() => _InvestmentPageState();
}

class _InvestmentPageState extends State<InvestmentPage> {

  bool isPopupVisible = false;

  void togglePopupVisibility(BuildContext context) {
    print("çalıştım");
    setState(() {
      isPopupVisible = !isPopupVisible;
    });
  }

  @override
  Widget build(BuildContext context) {

    final page1 = Provider.of<IncomeSelections>(context, listen: false);
    final investDataProvider = Provider.of<InvestmentTypeProvider>(context, listen: false);
    double incomeValue = NumberFormat.decimalPattern('tr_TR').parse(page1.incomeValue) as double;
    double savingsValue = incomeValue*0.2;
    String formattedsavingsValue = NumberFormat.currency(locale: 'tr_TR', symbol: '', decimalDigits: 2).format(savingsValue);

    List<String> itemList = ["Döviz", "Nakit", "Gayrimenkül", "Araba", "Elektronik", "Diğer"];
    List<IconData> itemIcons = [
      Icons.currency_exchange,
      Icons.money,
      Icons.real_estate_agent_sharp,
      Icons.car_rental,
      Icons.phone_android_sharp,
      Icons.arrow_drop_down_circle_sharp,
    ];
    String selectedInvestmentType = "";
    return Material(
      child: Stack(
        children: [
          Consumer<InvestmentTypeProvider>(
            builder: (context, provider, _) {
              final selectedInvestmentType = provider.selectedInvestmentType;
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: Color(0xfff0f0f1),
                  elevation: 0,
                  toolbarHeight: 70,
                  automaticallyImplyLeading: false,
                  leadingWidth: 30,
                  title: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {

                            },
                            icon: Icon(Icons.settings, color: Colors.black), // Replace with the desired left icon
                          ),
                          IconButton(
                            onPressed: () {

                            },
                            icon: Icon(Icons.person, color: Colors.black), // Replace with the desired right icon
                          ),
                        ],
                      ),
                      Text(
                        "Eylül 2023",
                        style: GoogleFonts.montserrat(color: Colors.black, fontSize: 28, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
                body: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Hedefler", style: GoogleFonts.montserrat(color: Colors.black, fontSize: 16, fontWeight: FontWeight.normal)),
                        SizedBox(height: 10),
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Birikim Hedefi", style: GoogleFonts.montserrat(color: Colors.black, fontSize: 19, fontWeight: FontWeight.normal)),
                              SizedBox(height: 10),
                              Text("0,00 / $formattedsavingsValue", style: GoogleFonts.montserrat(color: Colors.black, fontSize: 19, fontWeight: FontWeight.normal)),
                              SizedBox(
                                child: LinearPercentIndicator(
                                  padding: EdgeInsets.only(right: 10),
                                  backgroundColor: Color(0xffc6c6c7),
                                  animation: true,
                                  lineHeight: 10,
                                  animationDuration: 1000,
                                  percent: 0,
                                  trailing: Text("%0", style: GoogleFonts.montserrat(color: Colors.black, fontSize: 16, fontWeight: FontWeight.normal)),
                                  barRadius: Radius.circular(10),
                                  progressColor: Colors.lightBlue,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text("Birikimlerinizi buraya ekleyin.", style: GoogleFonts.montserrat(color: Colors.black, fontSize: 14, fontWeight: FontWeight.normal)),
                              SizedBox(height: 5),
                              SizedBox(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Birikim Ekle", style: GoogleFonts.montserrat(color: Colors.black, fontSize: 16, fontWeight: FontWeight.normal)),
                                    IconButton(
                                      onPressed: () {
                                        togglePopupVisibility(context);
                                      },
                                      icon: Icon(Icons.add_circle),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: investDataProvider.storedInvestList.length,
                          itemBuilder: (context, index) {
                            if(investDataProvider._selectedInvestmentType != ""){
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 20),
                                  Text(investDataProvider.storedInvestList[index], style: GoogleFonts.montserrat(fontSize: 22, fontWeight: FontWeight.bold)),
                                  SizedBox(height: 10),
                                  Container(
                                    padding: EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("0,00 / $formattedsavingsValue", style: GoogleFonts.montserrat(color: Colors.black, fontSize: 19, fontWeight: FontWeight.normal)),
                                        SizedBox(
                                              child: LinearPercentIndicator(
                                                padding: EdgeInsets.only(right: 10),
                                                backgroundColor: Color(0xffc6c6c7),
                                                animation: true,
                                                lineHeight: 10,
                                                animationDuration: 1000,
                                                percent: 0,
                                                trailing: Text("%0", style: GoogleFonts.montserrat(color: Colors.black, fontSize: 16, fontWeight: FontWeight.normal)),
                                                barRadius: Radius.circular(10),
                                                progressColor: Colors.lightBlue,
                                              ),
                                            ),
                                        TextButton(onPressed: () {
                                        },
                                          child: Text("Biriktir"),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                bottomNavigationBar: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: Offset(0, 3),
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10), // Adjust as needed
                      topRight: Radius.circular(10), // Adjust as needed
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10), // Adjust as needed
                      topRight: Radius.circular(10), // Adjust as needed
                    ),
                    child: BottomNavigationBar(
                      currentIndex: 3,
                      onTap: (int index) {
                        switch (index) {
                          case 0:
                            Navigator.pushNamed(context, 'ana-sayfa');
                            break;
                          case 1:
                            Navigator.pushNamed(context, 'income-page');
                            break;
                          case 2:
                            Navigator.pushNamed(context, 'outcome-page');
                            break;
                          case 3:
                            Navigator.pushNamed(context, 'investment-page');
                            break;
                          case 4:
                            Navigator.pushNamed(context, 'page5');
                            break;
                        }
                      },
                      type: BottomNavigationBarType.fixed,
                      items: [
                        BottomNavigationBarItem(
                          icon: Icon(Icons.home, size: 30),
                          label: 'Ana Sayfa',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.attach_money, size: 30),
                          label: 'Gelir',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.money_off, size: 30),
                          label: 'Gider',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.trending_up, size: 30),
                          label: 'Yatırım',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.star, size: 30),
                          label: 'İstekler',
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 500), // Duration for the animation
            top: 0,
            right: 0,
            left: 0,
            bottom: 0,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: isPopupVisible ? 5 : 0, sigmaY: isPopupVisible ? 5 : 0),
            child: AnimatedOpacity(
              opacity: isPopupVisible ? 0.7 : 0.0, // Fade in/out based on visibility
              duration: Duration(milliseconds: 500), // Duration for the opacity animation
              child: Visibility(
                visible: isPopupVisible,
                  child: Container(
                    padding: EdgeInsets.only(bottom: 10),
                    color: Colors.black.withOpacity(0.5), // Darkened background
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: itemList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Provider.of<InvestmentTypeProvider>(context, listen: false)
                                  .updateSelectedInvestmentType(itemList[index]);
                              togglePopupVisibility(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
                              child: Row(
                                children: [
                                  Icon(
                                    itemIcons[index], // Use the corresponding icon
                                    size: 45,
                                    color: Colors.white, // Icon color
                                  ),
                                  SizedBox(width: 15),
                                  Text(
                                    itemList[index],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 60,
            right: 20,
            child: Visibility(
              visible: isPopupVisible,
              child: Center(
                  child: GestureDetector(
                    onTap: () {
                      togglePopupVisibility(context);
                    },
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 50,
                      shadows: <Shadow>[
                        Shadow(color: Colors.black, blurRadius: 10.0, offset: Offset(6, 3))
                      ],
                    ),
                  )
              )
            ),
          ),
        ],
      ),
    );
  }
}
