import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:moneyly/pages/selection.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OutcomePage extends StatefulWidget {
  const OutcomePage({Key? key}) : super(key: key);

  @override
  State<OutcomePage> createState() => _OutcomePageState();
}

class _OutcomePageState extends State<OutcomePage> {
  int biggestIndex = 0;
  final TextEditingController textController = TextEditingController();
  final TextEditingController platformPriceController = TextEditingController();

  bool isSubsAddActive = false;
  bool hasSubsCategorySelected = false;
  bool isBillsAddActive = false;
  bool hasBillsCategorySelected = false;
  bool isOthersAddActive = false;
  bool hasOthersCategorySelected = false;
  // Initial Selected Value
  String dropdownvaluesubs = 'Film, Dizi ve TV';
  String dropdownvaluebills = 'Ev Faturaları';
  String dropdownvalueothers = 'Kira';

  // List of items in our dropdown menu
  var subsItems = [
    'Film, Dizi ve TV',
    'Oyun',
    'Müzik',
  ];

  var billsItems = [
    'Ev Faturaları',
    'İnternet',
    'Telefon'
  ];

  var othersItems = [
    'Kira',
    'Mutfak',
    'Yeme İçme',
    'Eğlence',
    'Diğer'
  ];


  List<String> tvTitleList = [];
  List<String> gameTitleList = [];
  List<String> musicTitleList = [];
  List<String> tvPriceList = [];
  List<String> gamePriceList = [];
  List<String> musicPriceList = [];

  List<String> homeBillsTitleList = [];
  List<String> internetTitleList = [];
  List<String> phoneTitleList = [];
  List<String> homeBillsPriceList = [];
  List<String> internetPriceList = [];
  List<String> phonePriceList = [];

  List<String> rentTitleList = [];
  List<String> kitchenTitleList = [];
  List<String> cateringTitleList = [];
  List<String> entertainmentTitleList = [];
  List<String> otherTitleList = [];
  List<String> rentPriceList = [];
  List<String> kitchenPriceList = [];
  List<String> cateringPriceList = [];
  List<String> entertainmentPriceList = [];
  List<String> otherPriceList = [];

  double incomeValue = 0.0;
  double savingsValue = 0.0;
  double wishesValue = 0.0;
  double needsValue = 0.0;
  double sumOfSubs = 0.0;
  double sumOfBills = 0.0;
  double sumOfOthers = 0.0;
  String sumOfTV = "0.0";
  String sumOfGame = "0.0";
  String sumOfMusic = "0.0";
  String sumOfHome = "0.0";
  String sumOfInternet = "0.0";
  String sumOfPhone = "0.0";
  String sumOfRent = "0.0";
  String sumOfKitchen = "0.0";
  String sumOfCatering = "0.0";
  String sumOfEnt = "0.0";
  String sumOfOther = "0.0";
  String selectedTitle = '';

  @override
  void initState() {
    super.initState();
    _load();
  }

  String labelForOption(SelectedOption option) {
    switch (option) {
      case SelectedOption.Is:
        return 'İş';
      case SelectedOption.Burs:
        return 'Burs';
      case SelectedOption.Emekli:
        return 'Emekli';
      default:
        return '';
    }
  }

  void _load() async {
    final prefs = await SharedPreferences.getInstance();
    final ab1 = prefs.getInt('selected_option') ?? SelectedOption.None.index;
    final ab2 = prefs.getString('income_value') ?? '0';
    final ab3 = prefs.getDouble('sumOfTV2') ?? 0.0;
    final ab4 = prefs.getDouble('sumOfGame2') ?? 0.0;
    final ab5 = prefs.getDouble('sumOfMusic2') ?? 0.0;
    final ab6 = prefs.getDouble('sumOfHome2') ?? 0.0;
    final ab7 = prefs.getDouble('sumOfInternet2') ?? 0.0;
    final ab8 = prefs.getDouble('sumOfPhone2') ?? 0.0;
    final ab9 = prefs.getDouble('sumOfRent2') ?? 0.0;
    final ab10 = prefs.getDouble('sumOfKitchen2') ?? 0.0;
    final ab11 = prefs.getDouble('sumOfCatering2') ?? 0.0;
    final ab12 = prefs.getDouble('sumOfEnt2') ?? 0.0;
    final ab13 = prefs.getDouble('sumOfOther2') ?? 0.0;
    final ab14 = prefs.getDouble('sumOfSubs2') ?? 0.0;
    final ab15 = prefs.getDouble('sumOfBills2') ?? 0.0;
    final ab16 = prefs.getDouble('sumOfOthers2') ?? 0.0;
    final ab17 = prefs.getStringList('tvTitleList2') ?? [];
    final ab18 = prefs.getStringList('gameTitleList2') ?? [];
    final ab19 = prefs.getStringList('musicTitleList2') ?? [];
    final ab20 = prefs.getStringList('homeBillsTitleList2') ?? [];
    final ab21 = prefs.getStringList('internetTitleList2') ?? [];
    final ab22 = prefs.getStringList('phoneTitleList2') ?? [];
    final ab23 = prefs.getStringList('rentTitleList2') ?? [];
    final ab24 = prefs.getStringList('kitchenTitleList2') ?? [];
    final ab25 = prefs.getStringList('cateringTitleList2') ?? [];
    final ab26 = prefs.getStringList('entertainmentTitleList2') ?? [];
    final ab27 = prefs.getStringList('otherTitleList2') ?? [];
    final ab28 = prefs.getStringList('tvPriceList2') ?? [];
    final ab29 = prefs.getStringList('gamePriceList2') ?? [];
    final ab30 = prefs.getStringList('musicPriceList2') ?? [];
    final ab31 = prefs.getStringList('homeBillsPriceList2') ?? [];
    final ab32 = prefs.getStringList('internetPriceList2') ?? [];
    final ab33 = prefs.getStringList('phonePriceList2') ?? [];
    final ab34 = prefs.getStringList('rentPriceList2') ?? [];
    final ab35 = prefs.getStringList('kitchenPriceList2') ?? [];
    final ab36 = prefs.getStringList('cateringPriceList2') ?? [];
    final ab37 = prefs.getStringList('entertainmentPriceList2') ?? [];
    final ab38 = prefs.getStringList('otherPriceList2') ?? [];
    setState(() {
      selectedTitle = labelForOption(SelectedOption.values[ab1]);
      incomeValue = double.parse(ab2);
      sumOfTV = ab3.toString();
      sumOfGame = ab4.toString();
      sumOfMusic = ab5.toString();
      sumOfHome = ab6.toString();
      sumOfInternet = ab7.toString();
      sumOfPhone = ab8.toString();
      sumOfRent = ab9.toString();
      sumOfKitchen = ab10.toString();
      sumOfCatering = ab11.toString();
      sumOfEnt = ab12.toString();
      sumOfOther = ab13.toString();
      sumOfSubs = ab14;
      sumOfBills = ab15;
      sumOfOthers = ab16;
      tvTitleList = ab17;
      gameTitleList = ab18;
      musicTitleList = ab19;
      homeBillsTitleList = ab20;
      internetTitleList = ab21;
      phoneTitleList = ab22;
      rentTitleList = ab23;
      kitchenTitleList = ab24;
      cateringTitleList = ab25;
      entertainmentTitleList = ab26;
      otherTitleList = ab27;
      tvPriceList = ab28;
      gamePriceList = ab29;
      musicPriceList = ab30;
      homeBillsPriceList = ab31;
      internetPriceList = ab32;
      phonePriceList = ab33;
      rentPriceList = ab34;
      kitchenPriceList = ab35;
      cateringPriceList = ab36;
      entertainmentPriceList = ab37;
      otherPriceList = ab38;
    });
  }

  @override
  Widget build(BuildContext context) {
    double outcomeValue = sumOfSubs+sumOfBills+sumOfOthers;
    double subsPercent = sumOfSubs/outcomeValue;
    double billsPercent = sumOfBills/outcomeValue;
    double othersPercent = sumOfOthers/outcomeValue;
    List<double> percentages = [subsPercent, billsPercent, othersPercent];
    print("First List: $percentages");
    Map<String, double> variableMap = {
      'subsPercent': subsPercent,
      'billsPercent': billsPercent,
      'othersPercent': othersPercent,
    };
    percentages.sort();
    String smallestVariable = variableMap.keys.firstWhere((key) => variableMap[key] == percentages[0], orElse: () => "");
    String mediumVariable = variableMap.keys.firstWhere((key) => variableMap[key] == percentages[1], orElse: () => "");
    String largestVariable = variableMap.keys.firstWhere((key) => variableMap[key] == percentages[2], orElse: () => "");

    print("Biggest value: ${percentages[2]} $largestVariable");
    print("Medium value: ${percentages[1]} $mediumVariable");
    print("Smallest value: ${percentages[0]} $smallestVariable");

    percentages.sort((a, b) => b.compareTo(a),);
    print("Original List: $percentages");
    percentages[0] = 1.0;
    print("Modified List: $percentages");
    String formattedIncomeValue = NumberFormat.currency(locale: 'tr_TR', symbol: '', decimalDigits: 2).format(incomeValue);
    String formattedOutcomeValue = NumberFormat.currency(locale: 'tr_TR', symbol: '', decimalDigits: 2).format(outcomeValue);
    String formattedsavingsValue = NumberFormat.currency(locale: 'tr_TR', symbol: '', decimalDigits: 2).format(savingsValue);
    String formattedwishesValue = NumberFormat.currency(locale: 'tr_TR', symbol: '', decimalDigits: 2).format(wishesValue);
    String formattedneedsValue = NumberFormat.currency(locale: 'tr_TR', symbol: '', decimalDigits: 2).format(needsValue);
    String formattedSumOfSubs = NumberFormat.currency(locale: 'tr_TR', symbol: '', decimalDigits: 2).format(sumOfSubs);
    String formattedSumOfBills = NumberFormat.currency(locale: 'tr_TR', symbol: '', decimalDigits: 2).format(sumOfBills);
    String formattedSumOfOthers = NumberFormat.currency(locale: 'tr_TR', symbol: '', decimalDigits: 2).format(sumOfOthers);

    Color smallestColor = Color(0xFFFFD700);
    Color mediumColor = Color(0xFFFFA500);
    Color biggestColor = Color(0xFFFF8C00);

    int totalSubsElement = tvTitleList.length + gameTitleList.length + musicTitleList.length;
    int totalBillsElement = homeBillsTitleList.length + internetTitleList.length + phoneTitleList.length;
    int totalOthersElement = rentTitleList.length + kitchenTitleList.length + cateringTitleList.length + entertainmentTitleList.length + otherTitleList.length;

    void _showEditDialog(BuildContext context, int index, int page, int orderIndex) {
      String caterogyName = "";
      if(page == 1){
        switch (orderIndex) {
          case 1:
            caterogyName = "TV";
            break;
          case 2:
            caterogyName = "Gaming";
            break;
          case 3:
            caterogyName = "Music";
            break;
        }
      } else if (page == 2){
        switch (orderIndex) {
          case 1:
            caterogyName = "Home Bills";
            break;
          case 2:
            caterogyName = "Internet";
            break;
          case 3:
            caterogyName = "Phone";
            break;
        }
      } else if (page == 3){
        switch (orderIndex) {
          case 1:
            caterogyName = "Rent";
            break;
          case 2:
            caterogyName = "Kitchen";
            break;
          case 3:
            caterogyName = "Catering";
            break;
          case 4:
            caterogyName = "Entertainment";
            break;
          case 5:
            caterogyName = "Other";
            break;
        }
      }

      TextEditingController selectedEditController = TextEditingController();
      TextEditingController selectedPriceController = TextEditingController();

      if(page == 1){
        switch (orderIndex) {
          case 1:
            TextEditingController editController =
            TextEditingController(text: tvTitleList[index]);
            TextEditingController priceController =
            TextEditingController(text: tvPriceList[index]);
            selectedEditController = editController;
            selectedPriceController = priceController;
            break;
          case 2:
            TextEditingController NDeditController =
            TextEditingController(text: gameTitleList[index]);
            TextEditingController NDpriceController =
            TextEditingController(text: gamePriceList[index]);
            selectedEditController = NDeditController;
            selectedPriceController = NDpriceController;
            break;
          case 3:
            TextEditingController RDeditController =
            TextEditingController(text: musicTitleList[index]);
            TextEditingController RDpriceController =
            TextEditingController(text: musicPriceList[index]);
            selectedEditController = RDeditController;
            selectedPriceController = RDpriceController;
            break;
        }
      } else if (page == 2){
        switch (orderIndex) {
          case 1:
            TextEditingController editController =
            TextEditingController(text: homeBillsTitleList[index]);
            TextEditingController priceController =
            TextEditingController(text: homeBillsPriceList[index]);
            selectedEditController = editController;
            selectedPriceController = priceController;
            break;
          case 2:
            TextEditingController NDeditController =
            TextEditingController(text: internetTitleList[index]);
            TextEditingController NDpriceController =
            TextEditingController(text: internetPriceList[index]);
            selectedEditController = NDeditController;
            selectedPriceController = NDpriceController;
            break;
          case 3:
            TextEditingController RDeditController =
            TextEditingController(text: phoneTitleList[index]);
            TextEditingController RDpriceController =
            TextEditingController(text: phonePriceList[index]);
            selectedEditController = RDeditController;
            selectedPriceController = RDpriceController;
            break;
        }
      } else if (page == 3){
        switch (orderIndex) {
          case 1:
            TextEditingController editController =
            TextEditingController(text: rentTitleList[index]);
            TextEditingController priceController =
            TextEditingController(text: rentPriceList[index]);
            selectedEditController = editController;
            selectedPriceController = priceController;
            break;
          case 2:
            TextEditingController NDeditController =
            TextEditingController(text: kitchenTitleList[index]);
            TextEditingController NDpriceController =
            TextEditingController(text: kitchenPriceList[index]);
            selectedEditController = NDeditController;
            selectedPriceController = NDpriceController;
            break;
          case 3:
            TextEditingController RDeditController =
            TextEditingController(text: cateringTitleList[index]);
            TextEditingController RDpriceController =
            TextEditingController(text: cateringPriceList[index]);
            selectedEditController = RDeditController;
            selectedPriceController = RDpriceController;
            break;
          case 4:
            TextEditingController THeditController =
            TextEditingController(text: entertainmentTitleList[index]);
            TextEditingController THpriceController =
            TextEditingController(text: entertainmentPriceList[index]);
            selectedEditController = THeditController;
            selectedPriceController = THpriceController;
            break;
          case 5:
            TextEditingController otherEditController =
            TextEditingController(text: otherTitleList[index]);
            TextEditingController otherPriceController =
            TextEditingController(text: otherPriceList[index]);
            selectedEditController = otherEditController;
            selectedPriceController = otherPriceController;
            break;
        }
      }

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
            ),
            title: Text('Edit $caterogyName',style: TextStyle(fontSize: 20)),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(child: Text("Item", style: TextStyle(fontSize: 18),), alignment: Alignment.centerLeft,),
                SizedBox(height: 10),
                TextFormField(
                  controller: selectedEditController,
                  decoration: InputDecoration(
                    isDense: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 3, color: Colors.black)
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(width: 3, color: Colors.black), // Use the same border style for enabled state
                    ),
                    contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  ),
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 10),
                Align(child: Text("Price",style: TextStyle(fontSize: 18)), alignment: Alignment.centerLeft),
                SizedBox(height: 10),
                TextFormField(
                  controller: selectedPriceController,
                  decoration: InputDecoration(
                    isDense: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 3, color: Colors.black)
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(width: 3, color: Colors.black), // Use the same border style for enabled state
                    ),
                    contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  ),
                  style: TextStyle(fontSize: 20),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.cancel)
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      if(page == 1){
                        switch (orderIndex){
                          case 1:
                            tvTitleList[index] = selectedEditController.text;
                            tvPriceList[index] = selectedPriceController.text;
                            break;
                          case 2:
                            gameTitleList[index] = selectedEditController.text;
                            gamePriceList[index] = selectedPriceController.text;
                            break;
                          case 3:
                            musicTitleList[index] = selectedEditController.text;
                            musicPriceList[index] = selectedPriceController.text;
                            break;
                        }
                      } else if (page == 2){
                        switch (orderIndex){
                          case 1:
                            homeBillsTitleList[index] = selectedEditController.text;
                            homeBillsPriceList[index] = selectedPriceController.text;
                            break;
                          case 2:
                            internetTitleList[index] = selectedEditController.text;
                            internetPriceList[index] = selectedPriceController.text;
                            break;
                          case 3:
                            phoneTitleList[index] = selectedEditController.text;
                            phonePriceList[index] = selectedPriceController.text;
                            break;
                        }
                      } else if (page == 3){
                        switch (orderIndex){
                          case 1:
                            rentTitleList[index] = selectedEditController.text;
                            rentPriceList[index] = selectedPriceController.text;
                            break;
                          case 2:
                            kitchenTitleList[index] = selectedEditController.text;
                            kitchenPriceList[index] = selectedPriceController.text;
                            break;
                          case 3:
                            cateringTitleList[index] = selectedEditController.text;
                            cateringPriceList[index] = selectedPriceController.text;
                            break;
                          case 4:
                            entertainmentTitleList[index] = selectedEditController.text;
                            entertainmentPriceList[index] = selectedPriceController.text;
                            break;
                          case 5:
                            otherTitleList[index] = selectedEditController.text;
                            otherPriceList[index] = selectedPriceController.text;
                            break;
                        }
                      }
                    });
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.save)
              ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        if(page == 1 && totalSubsElement != 1){
                          switch (orderIndex){
                            case 1:
                              TextEditingController priceController =
                              TextEditingController(text: tvPriceList[index]);
                              tvTitleList.removeAt(index);
                              tvPriceList.removeAt(index);
                              priceController.clear();
                              break;
                            case 2:
                              TextEditingController NDpriceController =
                              TextEditingController(text: gamePriceList[index]);
                              gameTitleList.removeAt(index);
                              gamePriceList.removeAt(index);
                              NDpriceController.clear();
                              break;
                            case 3:
                              TextEditingController RDpriceController =
                              TextEditingController(text: musicPriceList[index]);
                              musicTitleList.removeAt(index);
                              musicPriceList.removeAt(index);
                              RDpriceController.clear();
                              break;
                          }
                        } else if (page == 2 && totalBillsElement != 1){
                          switch (orderIndex){
                            case 1:
                              TextEditingController priceController =
                              TextEditingController(text: homeBillsPriceList[index]);
                              homeBillsTitleList.removeAt(index);
                              homeBillsPriceList.removeAt(index);
                              priceController.clear();
                              break;
                            case 2:
                              TextEditingController NDpriceController =
                              TextEditingController(text: internetPriceList[index]);
                              internetTitleList.removeAt(index);
                              internetPriceList.removeAt(index);
                              NDpriceController.clear();
                              break;
                            case 3:
                              TextEditingController RDpriceController =
                              TextEditingController(text: phonePriceList[index]);
                              phoneTitleList.removeAt(index);
                              phonePriceList.removeAt(index);
                              RDpriceController.clear();
                              break;
                          }
                        } else if (page == 3 && totalOthersElement != 1){
                          switch (orderIndex){
                            case 1:
                              TextEditingController priceController =
                              TextEditingController(text: rentPriceList[index]);
                              rentTitleList.removeAt(index);
                              rentPriceList.removeAt(index);
                              priceController.clear();
                              break;
                            case 2:
                              TextEditingController NDpriceController =
                              TextEditingController(text: kitchenPriceList[index]);
                              kitchenTitleList.removeAt(index);
                              kitchenPriceList.removeAt(index);
                              NDpriceController.clear();
                              break;
                            case 3:
                              TextEditingController RDpriceController =
                              TextEditingController(text: cateringPriceList[index]);
                              cateringTitleList.removeAt(index);
                              cateringPriceList.removeAt(index);
                              RDpriceController.clear();
                              break;
                            case 4:
                              TextEditingController THpriceController =
                              TextEditingController(text: entertainmentPriceList[index]);
                              entertainmentTitleList.removeAt(index);
                              entertainmentPriceList.removeAt(index);
                              THpriceController.clear();
                              break;
                            case 5:
                              TextEditingController otherPriceController =
                              TextEditingController(text: otherPriceList[index]);
                              otherTitleList.removeAt(index);
                              otherPriceList.removeAt(index);
                              otherPriceController.clear();
                              break;
                          }
                        } else {
                          // Show a Snackbar
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Delete operation not allowed."),
                            ),
                          );
                        }
                        Navigator.of(context).pop();
                      });
                    },
                    icon: Icon(Icons.delete_forever)
                )
            ],
          );
        },
      );
    }
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
          padding: EdgeInsets.fromLTRB(20,0,20,20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Giderler Detayı", style: GoogleFonts.montserrat(fontSize: 22, fontWeight: FontWeight.bold)),
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
                    Text("Tüm Giderler", style: GoogleFonts.montserrat(fontSize: 19, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Text(formattedOutcomeValue, style: GoogleFonts.montserrat(fontSize: 19, fontWeight: FontWeight.w600)),
                    SizedBox(height: 10),
                    Stack(
                      children: [
                        LinearPercentIndicator(
                          padding: EdgeInsets.zero,
                          percent: percentages[0],
                          backgroundColor: Colors.transparent,
                          progressColor: Color(0xFFFF8C00),
                          lineHeight: 10,
                          barRadius: Radius.circular(10),
                        ),
                        LinearPercentIndicator(
                          padding: EdgeInsets.zero,
                          percent: percentages[1]+percentages[2],
                          progressColor: Color(0xFFFFA500),
                          backgroundColor: Colors.transparent,
                          lineHeight: 10,
                          barRadius: Radius.circular(10),
                        ),
                        LinearPercentIndicator(
                          padding: EdgeInsets.zero,
                          percent: percentages[2],
                          progressColor: Color(0xFFFFD700),
                          backgroundColor: Colors.transparent,
                          lineHeight: 10,
                          barRadius: Radius.circular(10),
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Divider(color: Color(0xffc6c6c7), thickness: 2, height: 30),
                    if (largestVariable == "subsPercent" && mediumVariable == "billsPercent")
                      Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              CircularPercentIndicator(
                                radius: 30,
                                lineWidth: 7.0,
                                percent: sumOfOthers/outcomeValue,
                                center: new Text("%${((sumOfOthers/outcomeValue)*100).toStringAsFixed(0)}",style: GoogleFonts.montserrat(color: Colors.black, fontSize: (sumOfSubs/outcomeValue)*100 == 100 ? 12 : 16, fontWeight: FontWeight.w600)),
                                progressColor: smallestColor,
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Diğer Giderler", style: GoogleFonts.montserrat(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600)),
                                  Text("${formattedSumOfOthers} / $formattedOutcomeValue", style: GoogleFonts.montserrat(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600))
                                ],
                              )
                            ],
                          ),
                        ),
                        Divider(color: Color(0xffc6c6c7), thickness: 2, height: 30),
                        Container(
                          child: Row(
                            children: [
                              CircularPercentIndicator(
                                radius: 30,
                                lineWidth: 7.0,
                                percent: sumOfBills/outcomeValue,
                                center: new Text("%${((sumOfBills/outcomeValue)*100).toStringAsFixed(0)}", style: GoogleFonts.montserrat(color: Colors.black, fontSize: (sumOfSubs/outcomeValue)*100 == 100 ? 12 : 16, fontWeight: FontWeight.w600)),
                                progressColor: mediumColor,
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Faturalar", style: GoogleFonts.montserrat(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600)),
                                  Text("${formattedSumOfBills} / $formattedOutcomeValue", style: GoogleFonts.montserrat(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600))
                                ],
                              )
                            ],
                          ),
                        ),
                        Divider(color: Color(0xffc6c6c7), thickness: 2, height: 30),
                        Container(
                          child: Row(
                            children: [
                              CircularPercentIndicator(
                                radius: 30,
                                lineWidth: 7.0,
                                percent: sumOfSubs/outcomeValue,
                                center: Text("%${((sumOfSubs/outcomeValue)*100).toStringAsFixed(0)}",style: GoogleFonts.montserrat(color: Colors.black, fontSize: (sumOfSubs/outcomeValue)*100 == 100 ? 12 : 16, fontWeight: FontWeight.w600)),
                                progressColor: biggestColor,
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Abonelikler", style: GoogleFonts.montserrat(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600)),
                                  Text("${formattedSumOfSubs} / $formattedOutcomeValue", style: GoogleFonts.montserrat(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600))
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    if (largestVariable == "subsPercent" && mediumVariable == "othersPercent")
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                CircularPercentIndicator(
                                  radius: 30,
                                  lineWidth: 7.0,
                                  percent: sumOfBills/outcomeValue,
                                  center: new Text("%${((sumOfBills/outcomeValue)*100).toStringAsFixed(0)}", style: GoogleFonts.montserrat(color: Colors.black, fontSize: (sumOfSubs/outcomeValue)*100 == 100 ? 12 : 16, fontWeight: FontWeight.w600)),
                                  progressColor: smallestColor,
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Faturalar", style: GoogleFonts.montserrat(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600)),
                                    Text("${formattedSumOfBills} / $formattedOutcomeValue", style: GoogleFonts.montserrat(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600))
                                  ],
                                )
                              ],
                            ),
                          ),
                          Divider(color: Color(0xffc6c6c7), thickness: 2, height: 30),
                          Container(
                            child: Row(
                              children: [
                                CircularPercentIndicator(
                                  radius: 30,
                                  lineWidth: 7.0,
                                  percent: sumOfOthers/outcomeValue,
                                  center: new Text("%${((sumOfOthers/outcomeValue)*100).toStringAsFixed(0)}",style: GoogleFonts.montserrat(color: Colors.black, fontSize: (sumOfSubs/outcomeValue)*100 == 100 ? 12 : 16, fontWeight: FontWeight.w600)),
                                  progressColor: mediumColor,
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Diğer Giderler", style: GoogleFonts.montserrat(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600)),
                                    Text("${formattedSumOfOthers} / $formattedOutcomeValue", style: GoogleFonts.montserrat(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600))
                                  ],
                                )
                              ],
                            ),
                          ),
                          Divider(color: Color(0xffc6c6c7), thickness: 2, height: 30),
                          Container(
                            child: Row(
                              children: [
                                CircularPercentIndicator(
                                  radius: 30,
                                  lineWidth: 7.0,
                                  percent: sumOfSubs/outcomeValue,
                                  center: Text("%${((sumOfSubs/outcomeValue)*100).toStringAsFixed(0)}",style: GoogleFonts.montserrat(color: Colors.black, fontSize: (sumOfSubs/outcomeValue)*100 == 100 ? 12 : 16, fontWeight: FontWeight.w600)),
                                  progressColor: biggestColor,
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Abonelikler", style: GoogleFonts.montserrat(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600)),
                                    Text("${formattedSumOfSubs} / $formattedOutcomeValue", style: GoogleFonts.montserrat(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    if (largestVariable == "billsPercent" && mediumVariable == "subsPercent")
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                CircularPercentIndicator(
                                  radius: 30,
                                  lineWidth: 7.0,
                                  percent: sumOfOthers/outcomeValue,
                                  center: new Text("%${((sumOfOthers/outcomeValue)*100).toStringAsFixed(0)}",style: GoogleFonts.montserrat(color: Colors.black, fontSize: (sumOfSubs/outcomeValue)*100 == 100 ? 12 : 16, fontWeight: FontWeight.w600)),
                                  progressColor: smallestColor,
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Diğer Giderler", style: GoogleFonts.montserrat(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600)),
                                    Text("${formattedSumOfOthers} / $formattedOutcomeValue", style: GoogleFonts.montserrat(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600))
                                  ],
                                )
                              ],
                            ),
                          ),
                          Divider(color: Color(0xffc6c6c7), thickness: 2, height: 30),
                          Container(
                            child: Row(
                              children: [
                                CircularPercentIndicator(
                                  radius: 30,
                                  lineWidth: 7.0,
                                  percent: sumOfSubs/outcomeValue,
                                  center: Text("%${((sumOfSubs/outcomeValue)*100).toStringAsFixed(0)}",style: GoogleFonts.montserrat(color: Colors.black, fontSize: (sumOfSubs/outcomeValue)*100 == 100 ? 12 : 16, fontWeight: FontWeight.w600)),
                                  progressColor: mediumColor,
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Abonelikler", style: GoogleFonts.montserrat(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600)),
                                    Text("${formattedSumOfSubs} / $formattedOutcomeValue", style: GoogleFonts.montserrat(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600))
                                  ],
                                )
                              ],
                            ),
                          ),
                          Divider(color: Color(0xffc6c6c7), thickness: 2, height: 30),
                          Container(
                            child: Row(
                              children: [
                                CircularPercentIndicator(
                                  radius: 30,
                                  lineWidth: 7.0,
                                  percent: sumOfBills/outcomeValue,
                                  center: new Text("%${((sumOfBills/outcomeValue)*100).toStringAsFixed(0)}", style: GoogleFonts.montserrat(color: Colors.black, fontSize: (sumOfSubs/outcomeValue)*100 == 100 ? 12 : 16, fontWeight: FontWeight.w600)),
                                  progressColor: biggestColor,
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Faturalar", style: GoogleFonts.montserrat(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600)),
                                    Text("${formattedSumOfBills} / $formattedOutcomeValue", style: GoogleFonts.montserrat(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    if (largestVariable == "billsPercent" && mediumVariable == "othersPercent")
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                CircularPercentIndicator(
                                  radius: 30,
                                  lineWidth: 7.0,
                                  percent: sumOfSubs/outcomeValue,
                                  center: Text("%${((sumOfSubs/outcomeValue)*100).toStringAsFixed(0)}",style: GoogleFonts.montserrat(color: Colors.black, fontSize: (sumOfSubs/outcomeValue)*100 == 100 ? 12 : 16, fontWeight: FontWeight.w600)),
                                  progressColor: smallestColor,
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Abonelikler", style: GoogleFonts.montserrat(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600)),
                                    Text("${formattedSumOfSubs} / $formattedOutcomeValue", style: GoogleFonts.montserrat(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600))
                                  ],
                                )
                              ],
                            ),
                          ),
                          Divider(color: Color(0xffc6c6c7), thickness: 2, height: 30),
                          Container(
                            child: Row(
                              children: [
                                CircularPercentIndicator(
                                  radius: 30,
                                  lineWidth: 7.0,
                                  percent: sumOfOthers/outcomeValue,
                                  center: new Text("%${((sumOfOthers/outcomeValue)*100).toStringAsFixed(0)}",style: GoogleFonts.montserrat(color: Colors.black, fontSize: (sumOfSubs/outcomeValue)*100 == 100 ? 12 : 16, fontWeight: FontWeight.w600)),
                                  progressColor: mediumColor,
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Diğer Giderler", style: GoogleFonts.montserrat(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600)),
                                    Text("${formattedSumOfOthers} / $formattedOutcomeValue", style: GoogleFonts.montserrat(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600))
                                  ],
                                )
                              ],
                            ),
                          ),
                          Divider(color: Color(0xffc6c6c7), thickness: 2, height: 30),
                          Container(
                            child: Row(
                              children: [
                                CircularPercentIndicator(
                                  radius: 30,
                                  lineWidth: 7.0,
                                  percent: sumOfBills/outcomeValue,
                                  center: new Text("%${((sumOfBills/outcomeValue)*100).toStringAsFixed(0)}", style: GoogleFonts.montserrat(color: Colors.black, fontSize: (sumOfSubs/outcomeValue)*100 == 100 ? 12 : 16, fontWeight: FontWeight.w600)),
                                  progressColor: biggestColor,
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Faturalar", style: GoogleFonts.montserrat(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600)),
                                    Text("${formattedSumOfBills} / $formattedOutcomeValue", style: GoogleFonts.montserrat(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    if (largestVariable == "othersPercent" && mediumVariable == "subsPercent")
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                CircularPercentIndicator(
                                  radius: 30,
                                  lineWidth: 7.0,
                                  percent: sumOfBills/outcomeValue,
                                  center: new Text("%${((sumOfBills/outcomeValue)*100).toStringAsFixed(0)}", style: GoogleFonts.montserrat(color: Colors.black, fontSize: (sumOfSubs/outcomeValue)*100 == 100 ? 12 : 16, fontWeight: FontWeight.w600)),
                                  progressColor: smallestColor,
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Faturalar", style: GoogleFonts.montserrat(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600)),
                                    Text("${formattedSumOfBills} / $formattedOutcomeValue", style: GoogleFonts.montserrat(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600))
                                  ],
                                )
                              ],
                            ),
                          ),
                          Divider(color: Color(0xffc6c6c7), thickness: 2, height: 30),
                          Container(
                            child: Row(
                              children: [
                                CircularPercentIndicator(
                                  radius: 30,
                                  lineWidth: 7.0,
                                  percent: sumOfSubs/outcomeValue,
                                  center: Text("%${((sumOfSubs/outcomeValue)*100).toStringAsFixed(0)}",style: GoogleFonts.montserrat(color: Colors.black, fontSize: (sumOfSubs/outcomeValue)*100 == 100 ? 12 : 16, fontWeight: FontWeight.w600)),
                                  progressColor: mediumColor,
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Abonelikler", style: GoogleFonts.montserrat(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600)),
                                    Text("${formattedSumOfSubs} / $formattedOutcomeValue", style: GoogleFonts.montserrat(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600))
                                  ],
                                )
                              ],
                            ),
                          ),
                          Divider(color: Color(0xffc6c6c7), thickness: 2, height: 30),
                          Container(
                            child: Row(
                              children: [
                                CircularPercentIndicator(
                                  radius: 30,
                                  lineWidth: 7.0,
                                  percent: sumOfOthers/outcomeValue,
                                  center: new Text("%${((sumOfOthers/outcomeValue)*100).toStringAsFixed(0)}",style: GoogleFonts.montserrat(color: Colors.black, fontSize: (sumOfSubs/outcomeValue)*100 == 100 ? 12 : 16, fontWeight: FontWeight.w600)),
                                  progressColor: biggestColor,
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Diğer Giderler", style: GoogleFonts.montserrat(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600)),
                                    Text("${formattedSumOfOthers} / $formattedOutcomeValue", style: GoogleFonts.montserrat(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    if (largestVariable == "othersPercent" && mediumVariable == "billsPercent")
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                CircularPercentIndicator(
                                  radius: 30,
                                  lineWidth: 7.0,
                                  percent: sumOfSubs/outcomeValue,
                                  center: Text("%${((sumOfSubs/outcomeValue)*100).toStringAsFixed(0)}",style: GoogleFonts.montserrat(color: Colors.black, fontSize: (sumOfSubs/outcomeValue)*100 == 100 ? 12 : 16, fontWeight: FontWeight.w600)),
                                  progressColor: smallestColor,
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Abonelikler", style: GoogleFonts.montserrat(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600)),
                                    Text("${formattedSumOfSubs} / $formattedOutcomeValue", style: GoogleFonts.montserrat(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600))
                                  ],
                                )
                              ],
                            ),
                          ),
                          Divider(color: Color(0xffc6c6c7), thickness: 2, height: 30),
                          Container(
                            child: Row(
                              children: [
                                CircularPercentIndicator(
                                  radius: 30,
                                  lineWidth: 7.0,
                                  percent: sumOfBills/outcomeValue,
                                  center: new Text("%${((sumOfBills/outcomeValue)*100).toStringAsFixed(0)}", style: GoogleFonts.montserrat(color: Colors.black, fontSize: (sumOfSubs/outcomeValue)*100 == 100 ? 12 : 16, fontWeight: FontWeight.w600)),
                                  progressColor: mediumColor,
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Faturalar", style: GoogleFonts.montserrat(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600)),
                                    Text("${formattedSumOfBills} / $formattedOutcomeValue", style: GoogleFonts.montserrat(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600))
                                  ],
                                )
                              ],
                            ),
                          ),
                          Divider(color: Color(0xffc6c6c7), thickness: 2, height: 30),
                          Container(
                            child: Row(
                              children: [
                                CircularPercentIndicator(
                                  radius: 30,
                                  lineWidth: 7.0,
                                  percent: sumOfOthers/outcomeValue,
                                  center: new Text("%${((sumOfOthers/outcomeValue)*100).toStringAsFixed(0)}",style: GoogleFonts.montserrat(color: Colors.black, fontSize: (sumOfSubs/outcomeValue)*100 == 100 ? 12 : 16, fontWeight: FontWeight.w600)),
                                  progressColor: biggestColor,
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Diğer Giderler", style: GoogleFonts.montserrat(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600)),
                                    Text("${formattedSumOfOthers} / $formattedOutcomeValue", style: GoogleFonts.montserrat(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    if (largestVariable == mediumVariable && mediumVariable == smallestVariable)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                CircularPercentIndicator(
                                  radius: 30,
                                  lineWidth: 7.0,
                                  percent: sumOfSubs/outcomeValue,
                                  center: Text("%${((sumOfSubs/outcomeValue)*100).toStringAsFixed(0)}",style: GoogleFonts.montserrat(color: Colors.black, fontSize: (sumOfSubs/outcomeValue)*100 == 100 ? 12 : 16, fontWeight: FontWeight.w600)),
                                  progressColor: smallestColor,
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Abonelikler", style: GoogleFonts.montserrat(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600)),
                                    Text("${formattedSumOfSubs} / $formattedOutcomeValue", style: GoogleFonts.montserrat(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600))
                                  ],
                                )
                              ],
                            ),
                          ),
                          Divider(color: Color(0xffc6c6c7), thickness: 2, height: 30),
                          Container(
                            child: Row(
                              children: [
                                CircularPercentIndicator(
                                  radius: 30,
                                  lineWidth: 7.0,
                                  percent: sumOfBills/outcomeValue,
                                  center: new Text("%${((sumOfBills/outcomeValue)*100).toStringAsFixed(0)}", style: GoogleFonts.montserrat(color: Colors.black, fontSize: (sumOfSubs/outcomeValue)*100 == 100 ? 12 : 16, fontWeight: FontWeight.w600)),
                                  progressColor: mediumColor,
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Faturalar", style: GoogleFonts.montserrat(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600)),
                                    Text("${formattedSumOfBills} / $formattedOutcomeValue", style: GoogleFonts.montserrat(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600))
                                  ],
                                )
                              ],
                            ),
                          ),
                          Divider(color: Color(0xffc6c6c7), thickness: 2, height: 30),
                          Container(
                            child: Row(
                              children: [
                                CircularPercentIndicator(
                                  radius: 30,
                                  lineWidth: 7.0,
                                  percent: sumOfOthers/outcomeValue,
                                  center: new Text("%${((sumOfOthers/outcomeValue)*100).toStringAsFixed(0)}",style: GoogleFonts.montserrat(color: Colors.black, fontSize: (sumOfSubs/outcomeValue)*100 == 100 ? 12 : 16, fontWeight: FontWeight.w600)),
                                  progressColor: biggestColor,
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Diğer Giderler", style: GoogleFonts.montserrat(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600)),
                                    Text("${formattedSumOfOthers} / $formattedOutcomeValue", style: GoogleFonts.montserrat(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text("Abonelikler", style: GoogleFonts.montserrat(fontSize: 22, fontWeight: FontWeight.bold)),
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
                    Text("${formattedSumOfSubs} / ${formattedOutcomeValue}", style: GoogleFonts.montserrat(fontSize: 19, fontWeight: FontWeight.bold)),
                    SizedBox(
                      child: LinearPercentIndicator(
                        padding: EdgeInsets.only(right: 10),
                        backgroundColor: Color(0xffc6c6c7),
                        animation: true,
                        lineHeight: 10,
                        animationDuration: 1000,
                        percent: sumOfSubs/outcomeValue,
                        trailing: Text("%${((sumOfSubs/outcomeValue)*100).toStringAsFixed(0)}", style: GoogleFonts.montserrat(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600)),
                        barRadius: Radius.circular(10),
                        progressColor: Colors.lightBlue,
                      ),
                    ),
                    SizedBox(height: 5),
                    ListView(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        if(tvTitleList.isNotEmpty)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("TV", style: GoogleFonts.montserrat(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
                            Divider(color: Color(0xffc6c6c7), thickness: 2, height: 20),
                            ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: tvTitleList.length + 1, // +1 for the "Abonelik Ekle" row
                              itemBuilder: (context, index) {
                                if (index < tvTitleList.length) {
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            flex: 2,
                                            fit: FlexFit.tight,
                                            child: Text(
                                              tvTitleList[index],
                                              style: GoogleFonts.montserrat(fontSize: 20),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Flexible(
                                            flex: 2,
                                            fit: FlexFit.tight,
                                            child: Text(
                                              textAlign: TextAlign.right,
                                              tvPriceList[index],
                                              style: GoogleFonts.montserrat(fontSize: 20),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          SizedBox(width: 20),
                                          IconButton(
                                            splashRadius: 0.0001,
                                            padding: EdgeInsets.zero,
                                            constraints: const BoxConstraints(minWidth: 23, maxWidth: 23),
                                            icon: Icon(Icons.edit, size: 21),
                                            onPressed: () {
                                              _showEditDialog(context, index, 1, 1); // Show the edit dialog
                                            },
                                          ),
                                        ],
                                      ),
                                      Divider(color: Color(0xffc6c6c7), thickness: 2, height: 20),
                                    ],
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                        if(gameTitleList.isNotEmpty)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Gaming", style: GoogleFonts.montserrat(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
                            Divider(color: Color(0xffc6c6c7), thickness: 2, height: 20),
                            ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: gameTitleList.length + 1, // +1 for the "Abonelik Ekle" row
                              itemBuilder: (context, index) {
                                if (index < gameTitleList.length) {
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            flex: 2,
                                            fit: FlexFit.tight,
                                            child: Text(
                                              gameTitleList[index],
                                              style: GoogleFonts.montserrat(fontSize: 20),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Flexible(
                                            flex: 2,
                                            fit: FlexFit.tight,
                                            child: Text(
                                              textAlign: TextAlign.right,
                                              gamePriceList[index],
                                              style: GoogleFonts.montserrat(fontSize: 20),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          SizedBox(width: 20),
                                          IconButton(
                                            splashRadius: 0.0001,
                                            padding: EdgeInsets.zero,
                                            constraints: const BoxConstraints(minWidth: 23, maxWidth: 23),
                                            icon: Icon(Icons.edit, size: 21),
                                            onPressed: () {
                                              _showEditDialog(context, index, 1, 2); // Show the edit dialog
                                            },
                                          ),
                                        ],
                                      ),
                                      Divider(color: Color(0xffc6c6c7), thickness: 2, height: 20),
                                    ],
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                        if(musicTitleList.isNotEmpty)
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Music", style: GoogleFonts.montserrat(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
                            Divider(color: Color(0xffc6c6c7), thickness: 2, height: 20),
                            ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: musicTitleList.length + 1, // +1 for the "Abonelik Ekle" row
                              itemBuilder: (context, index) {
                                if (index < musicTitleList.length) {
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            flex: 2,
                                            fit: FlexFit.tight,
                                            child: Text(
                                              musicTitleList[index],
                                              style: GoogleFonts.montserrat(fontSize: 20),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Flexible(
                                            flex: 2,
                                            fit: FlexFit.tight,
                                            child: Text(
                                              textAlign: TextAlign.right,
                                              musicPriceList[index],
                                              style: GoogleFonts.montserrat(fontSize: 20),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          SizedBox(width: 20),
                                          IconButton(
                                            splashRadius: 0.0001,
                                            padding: EdgeInsets.zero,
                                            constraints: const BoxConstraints(minWidth: 23, maxWidth: 23),
                                            icon: Icon(Icons.edit, size: 21),
                                            onPressed: () {
                                              _showEditDialog(context, index, 1, 3); // Show the edit dialog
                                            },
                                          ),
                                        ],
                                      ),
                                      Divider(color: Color(0xffc6c6c7), thickness: 2, height: 20),
                                    ],
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                        if(!isSubsAddActive)
                        SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Abonelik Ekle", style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w600)),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    isSubsAddActive = true;
                                  });
                                },
                                icon: Icon(Icons.add_circle),
                              ),
                            ],
                          ),
                        ),
                        if(isSubsAddActive)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child:DropdownButton(
                                  value: dropdownvaluesubs,
                                  icon:Icon(Icons.keyboard_arrow_down),
                                  items: subsItems.map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownvaluesubs = newValue!;
                                    });
                                  },
                                )
                              ),
                              Wrap(
                                children: [
                                  if(!hasSubsCategorySelected)
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isSubsAddActive = true;
                                        hasSubsCategorySelected = true;
                                      });
                                    },
                                    icon: Icon(Icons.arrow_downward, size: 26),
                                  ),
                                  if(!hasSubsCategorySelected)
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isSubsAddActive = false;
                                        hasSubsCategorySelected = false;
                                      });
                                    },
                                    icon: Icon(Icons.cancel, size: 26),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        if(hasSubsCategorySelected)
                        Container(
                          padding: EdgeInsets.only(top:10, bottom:10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: textController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'ABA',
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: TextFormField(
                                  controller: platformPriceController,
                                  keyboardType: TextInputType.number, // Show numeric keyboard
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'GAG',
                                  ),
                                ),
                              ),
                              Wrap(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      final text = textController.text.trim();
                                      final priceText = platformPriceController.text.trim();
                                      if (text.isNotEmpty && priceText.isNotEmpty && dropdownvaluesubs == "Film, Dizi ve TV") {
                                        double dprice = double.tryParse(priceText) ?? 0.0;
                                        String price = dprice.toStringAsFixed(2);
                                        setState(() {
                                          //isEditingList = false; // Add a corresponding entry for the new item
                                          textController.clear();
                                          platformPriceController.clear();
                                          //isTextFormFieldVisible = false;
                                          isSubsAddActive = false;
                                          hasSubsCategorySelected = false;
                                        });
                                      } else if (text.isNotEmpty && priceText.isNotEmpty && dropdownvaluesubs == "Oyun") {
                                        double dprice = double.tryParse(priceText) ?? 0.0;
                                        String price = dprice.toStringAsFixed(2);
                                        setState(() {
                                          //isEditingList = false; // Add a corresponding entry for the new item
                                          textController.clear();
                                          platformPriceController.clear();
                                          //isTextFormFieldVisible = false;
                                          isSubsAddActive = false;
                                          hasSubsCategorySelected = false;
                                        });
                                      } else if (text.isNotEmpty && priceText.isNotEmpty && dropdownvaluesubs == "Müzik") {
                                        double dprice = double.tryParse(priceText) ?? 0.0;
                                        String price = dprice.toStringAsFixed(2);
                                        setState(() {
                                          //isEditingList = false; // Add a corresponding entry for the new item
                                          textController.clear();
                                          platformPriceController.clear();
                                          //isTextFormFieldVisible = false;
                                          isSubsAddActive = false;
                                          hasSubsCategorySelected = false;
                                        });
                                      }
                                    },
                                    icon: Icon(Icons.check_circle, size: 26),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        //isTextFormFieldVisible = false;
                                        isSubsAddActive = false;
                                        hasSubsCategorySelected = false;
                                        textController.clear();
                                        platformPriceController.clear();
                                      });
                                    },
                                    icon: Icon(Icons.cancel, size: 26),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text("Faturalar", style: GoogleFonts.montserrat(fontSize: 22, fontWeight: FontWeight.bold)),
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
                    Text("${formattedSumOfBills} / ${formattedOutcomeValue}", style: GoogleFonts.montserrat(fontSize: 19, fontWeight: FontWeight.bold)),
                    SizedBox(
                      child: LinearPercentIndicator(
                        padding: EdgeInsets.only(right: 10),
                        backgroundColor: Color(0xffc6c6c7),
                        animation: true,
                        lineHeight: 10,
                        animationDuration: 1000,
                        percent: sumOfBills/outcomeValue,
                        trailing: Text("%${((sumOfBills/outcomeValue)*100).toStringAsFixed(0)}", style: GoogleFonts.montserrat(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600)),
                        barRadius: Radius.circular(10),
                        progressColor: Colors.lightBlue,
                      ),
                    ),
                    SizedBox(height: 5),
                    ListView(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        if(homeBillsTitleList.isNotEmpty)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Home Bills", style: GoogleFonts.montserrat(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
                            Divider(color: Color(0xffc6c6c7), thickness: 2, height: 20),
                            ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: homeBillsTitleList.length + 1, // +1 for the "Abonelik Ekle" row
                              itemBuilder: (context, index) {
                                if (index < homeBillsTitleList.length) {
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            flex: 2,
                                            fit: FlexFit.tight,
                                            child: Text(
                                              homeBillsTitleList[index],
                                              style: GoogleFonts.montserrat(fontSize: 20),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Flexible(
                                            flex: 2,
                                            fit: FlexFit.tight,
                                            child: Text(
                                              textAlign: TextAlign.right,
                                              homeBillsPriceList[index],
                                              style: GoogleFonts.montserrat(fontSize: 20),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          SizedBox(width: 20),
                                          IconButton(
                                            splashRadius: 0.0001,
                                            padding: EdgeInsets.zero,
                                            constraints: const BoxConstraints(minWidth: 23, maxWidth: 23),
                                            icon: Icon(Icons.edit, size: 21),
                                            onPressed: () {
                                              _showEditDialog(context, index, 2, 1); // Show the edit dialog
                                            },
                                          ),
                                        ],
                                      ),
                                      Divider(color: Color(0xffc6c6c7), thickness: 2, height: 20),
                                    ],
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                        if(internetTitleList.isNotEmpty)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Internet", style: GoogleFonts.montserrat(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
                            Divider(color: Color(0xffc6c6c7), thickness: 2, height: 20),
                            ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: internetTitleList.length + 1, // +1 for the "Abonelik Ekle" row
                              itemBuilder: (context, index) {
                                if (index < internetTitleList.length) {
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            flex: 2,
                                            fit: FlexFit.tight,
                                            child: Text(
                                              internetTitleList[index],
                                              style: GoogleFonts.montserrat(fontSize: 20),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Flexible(
                                            flex: 2,
                                            fit: FlexFit.tight,
                                            child: Text(
                                              textAlign: TextAlign.right,
                                              internetPriceList[index],
                                              style: GoogleFonts.montserrat(fontSize: 20),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          SizedBox(width: 20),
                                          IconButton(
                                            splashRadius: 0.0001,
                                            padding: EdgeInsets.zero,
                                            constraints: const BoxConstraints(minWidth: 23, maxWidth: 23),
                                            icon: Icon(Icons.edit, size: 21),
                                            onPressed: () {
                                              _showEditDialog(context, index, 2, 2); // Show the edit dialog
                                            },
                                          ),
                                        ],
                                      ),
                                      Divider(color: Color(0xffc6c6c7), thickness: 2, height: 20),
                                    ],
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                        if(phoneTitleList.isNotEmpty)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Phone", style: GoogleFonts.montserrat(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
                            Divider(color: Color(0xffc6c6c7), thickness: 2, height: 20),
                            ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: phoneTitleList.length + 1, // +1 for the "Abonelik Ekle" row
                              itemBuilder: (context, index) {
                                if (index < phoneTitleList.length) {
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            flex: 2,
                                            fit: FlexFit.tight,
                                            child: Text(
                                              phoneTitleList[index],
                                              style: GoogleFonts.montserrat(fontSize: 20),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Flexible(
                                            flex: 2,
                                            fit: FlexFit.tight,
                                            child: Text(
                                              textAlign: TextAlign.right,
                                              phonePriceList[index],
                                              style: GoogleFonts.montserrat(fontSize: 20),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          SizedBox(width: 20),
                                          IconButton(
                                            splashRadius: 0.0001,
                                            padding: EdgeInsets.zero,
                                            constraints: const BoxConstraints(minWidth: 23, maxWidth: 23),
                                            icon: Icon(Icons.edit, size: 21),
                                            onPressed: () {
                                              _showEditDialog(context, index, 2, 3); // Show the edit dialog
                                            },
                                          ),
                                        ],
                                      ),
                                      Divider(color: Color(0xffc6c6c7), thickness: 2, height: 20),
                                    ],
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                        if(!isBillsAddActive)
                        SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Fatura Ekle", style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w600)),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    isBillsAddActive = true;
                                  });
                                },
                                icon: Icon(Icons.add_circle),
                              ),
                            ],
                          ),
                        ),
                        if(isBillsAddActive)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  child:DropdownButton(
                                    value: dropdownvaluebills,
                                    icon:Icon(Icons.keyboard_arrow_down),
                                    items: billsItems.map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Text(items),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownvaluebills = newValue!;
                                      });
                                    },
                                  )
                              ),
                              Wrap(
                                children: [
                                  if(!hasBillsCategorySelected)
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isBillsAddActive = true;
                                        hasBillsCategorySelected = true;
                                      });
                                    },
                                    icon: Icon(Icons.arrow_downward, size: 26),
                                  ),
                                  if(!hasBillsCategorySelected)
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isBillsAddActive = false;
                                        hasBillsCategorySelected = false;
                                      });
                                    },
                                    icon: Icon(Icons.cancel, size: 26),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        if(hasBillsCategorySelected)
                          Container(
                            padding: EdgeInsets.only(top:10, bottom:10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: textController,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'ABA',
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: TextFormField(
                                    controller: platformPriceController,
                                    keyboardType: TextInputType.number, // Show numeric keyboard
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'GAG',
                                    ),
                                  ),
                                ),
                                Wrap(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        final text = textController.text.trim();
                                        final priceText = platformPriceController.text.trim();
                                        if (text.isNotEmpty && priceText.isNotEmpty && dropdownvaluebills == "Ev Faturaları") {
                                          double dprice = double.tryParse(priceText) ?? 0.0;
                                          String price = dprice.toStringAsFixed(2);
                                          setState(() {
                                            //isEditingList = false; // Add a corresponding entry for the new item
                                            textController.clear();
                                            platformPriceController.clear();
                                            //isTextFormFieldVisible = false;
                                            isBillsAddActive = false;
                                            hasBillsCategorySelected = false;
                                          });
                                        } else if (text.isNotEmpty && priceText.isNotEmpty && dropdownvaluebills == "İnternet") {
                                          double dprice = double.tryParse(priceText) ?? 0.0;
                                          String price = dprice.toStringAsFixed(2);
                                          setState(() {
                                            //isEditingList = false; // Add a corresponding entry for the new item
                                            textController.clear();
                                            platformPriceController.clear();
                                            //isTextFormFieldVisible = false;
                                            isBillsAddActive = false;
                                            hasBillsCategorySelected = false;
                                          });
                                        } else if (text.isNotEmpty && priceText.isNotEmpty && dropdownvaluebills == "Telefon") {
                                          double dprice = double.tryParse(priceText) ?? 0.0;
                                          String price = dprice.toStringAsFixed(2);
                                          setState(() {
                                            //isEditingList = false; // Add a corresponding entry for the new item
                                            textController.clear();
                                            platformPriceController.clear();
                                            //isTextFormFieldVisible = false;
                                            isBillsAddActive = false;
                                            hasBillsCategorySelected = false;
                                          });
                                        }
                                      },
                                      icon: Icon(Icons.check_circle, size: 26),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          //isTextFormFieldVisible = false;
                                          isBillsAddActive = false;
                                          hasBillsCategorySelected = false;
                                          textController.clear();
                                          platformPriceController.clear();
                                        });
                                      },
                                      icon: Icon(Icons.cancel, size: 26),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text("Diğer Giderler", style: GoogleFonts.montserrat(fontSize: 22, fontWeight: FontWeight.bold)),
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
                    Text("${formattedSumOfOthers} / ${formattedOutcomeValue}", style: GoogleFonts.montserrat(fontSize: 19, fontWeight: FontWeight.bold)),
                    SizedBox(
                      child: LinearPercentIndicator(
                        padding: EdgeInsets.only(right: 10),
                        backgroundColor: Color(0xffc6c6c7),
                        animation: true,
                        lineHeight: 10,
                        animationDuration: 1000,
                        percent: sumOfOthers/outcomeValue,
                        trailing: Text("%${((sumOfOthers/outcomeValue)*100).toStringAsFixed(0)}", style: GoogleFonts.montserrat(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600)),
                        barRadius: Radius.circular(10),
                        progressColor: Colors.lightBlue,
                      ),
                    ),
                    SizedBox(height: 5),
                    ListView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        if(rentTitleList.isNotEmpty)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Rent", style: GoogleFonts.montserrat(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
                            Divider(color: Color(0xffc6c6c7), thickness: 2, height: 20),
                            ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: rentTitleList.length + 1, // +1 for the "Abonelik Ekle" row
                              itemBuilder: (context, index) {
                                if (index < rentTitleList.length) {
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            flex: 2,
                                            fit: FlexFit.tight,
                                            child: Text(
                                              rentTitleList[index],
                                              style: GoogleFonts.montserrat(fontSize: 20),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Flexible(
                                            flex: 2,
                                            fit: FlexFit.tight,
                                            child: Text(
                                              textAlign: TextAlign.right,
                                              rentPriceList[index],
                                              style: GoogleFonts.montserrat(fontSize: 20),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          SizedBox(width: 20),
                                          IconButton(
                                            splashRadius: 0.0001,
                                            padding: EdgeInsets.zero,
                                            constraints: const BoxConstraints(minWidth: 23, maxWidth: 23),
                                            icon: Icon(Icons.edit, size: 21),
                                            onPressed: () {
                                              _showEditDialog(context, index, 3, 1); // Show the edit dialog
                                            },
                                          ),
                                        ],
                                      ),
                                      Divider(color: Color(0xffc6c6c7), thickness: 2, height: 20),
                                    ],
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                        if(kitchenTitleList.isNotEmpty)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Kitchen", style: GoogleFonts.montserrat(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
                            Divider(color: Color(0xffc6c6c7), thickness: 2, height: 20),
                            ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: kitchenTitleList.length + 1, // +1 for the "Abonelik Ekle" row
                              itemBuilder: (context, index) {
                                if (index < kitchenTitleList.length) {
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            flex: 2,
                                            fit: FlexFit.tight,
                                            child: Text(
                                              kitchenTitleList[index],
                                              style: GoogleFonts.montserrat(fontSize: 20),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Flexible(
                                            flex: 2,
                                            fit: FlexFit.tight,
                                            child: Text(
                                              textAlign: TextAlign.right,
                                              kitchenPriceList[index],
                                              style: GoogleFonts.montserrat(fontSize: 20),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          SizedBox(width: 20),
                                          IconButton(
                                            splashRadius: 0.0001,
                                            padding: EdgeInsets.zero,
                                            constraints: const BoxConstraints(minWidth: 23, maxWidth: 23),
                                            icon: Icon(Icons.edit, size: 21),
                                            onPressed: () {
                                              _showEditDialog(context, index, 3, 2); // Show the edit dialog
                                            },
                                          ),
                                        ],
                                      ),
                                      Divider(color: Color(0xffc6c6c7), thickness: 2, height: 20),
                                    ],
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                        if(cateringTitleList.isNotEmpty)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Catering", style: GoogleFonts.montserrat(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
                            Divider(color: Color(0xffc6c6c7), thickness: 2, height: 20),
                            ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: cateringTitleList.length + 1, // +1 for the "Abonelik Ekle" row
                              itemBuilder: (context, index) {
                                if (index < cateringTitleList.length) {
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            flex: 2,
                                            fit: FlexFit.tight,
                                            child: Text(
                                              cateringTitleList[index],
                                              style: GoogleFonts.montserrat(fontSize: 20),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Flexible(
                                            flex: 2,
                                            fit: FlexFit.tight,
                                            child: Text(
                                              textAlign: TextAlign.right,
                                              cateringPriceList[index],
                                              style: GoogleFonts.montserrat(fontSize: 20),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          SizedBox(width: 20),
                                          IconButton(
                                            splashRadius: 0.0001,
                                            padding: EdgeInsets.zero,
                                            constraints: const BoxConstraints(minWidth: 23, maxWidth: 23),
                                            icon: Icon(Icons.edit, size: 21),
                                            onPressed: () {
                                              _showEditDialog(context, index, 3, 3); // Show the edit dialog
                                            },
                                          ),
                                        ],
                                      ),
                                      Divider(color: Color(0xffc6c6c7), thickness: 2, height: 20),
                                    ],
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                        if(entertainmentTitleList.isNotEmpty)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Entertainment", style: GoogleFonts.montserrat(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
                            Divider(color: Color(0xffc6c6c7), thickness: 2, height: 20),
                            ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: entertainmentTitleList.length + 1, // +1 for the "Abonelik Ekle" row
                              itemBuilder: (context, index) {
                                if (index < entertainmentTitleList.length) {
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            flex: 2,
                                            fit: FlexFit.tight,
                                            child: Text(
                                              entertainmentTitleList[index],
                                              style: GoogleFonts.montserrat(fontSize: 20),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Flexible(
                                            flex: 2,
                                            fit: FlexFit.tight,
                                            child: Text(
                                              textAlign: TextAlign.right,
                                              entertainmentPriceList[index],
                                              style: GoogleFonts.montserrat(fontSize: 20),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          SizedBox(width: 20),
                                          IconButton(
                                            splashRadius: 0.0001,
                                            padding: EdgeInsets.zero,
                                            constraints: const BoxConstraints(minWidth: 23, maxWidth: 23),
                                            icon: Icon(Icons.edit, size: 21),
                                            onPressed: () {
                                              _showEditDialog(context, index, 3, 4); // Show the edit dialog
                                            },
                                          ),
                                        ],
                                      ),
                                      Divider(color: Color(0xffc6c6c7), thickness: 2, height: 20),
                                    ],
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                        if(otherTitleList.isNotEmpty)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Others", style: GoogleFonts.montserrat(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
                            Divider(color: Color(0xffc6c6c7), thickness: 2, height: 20),
                            ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: otherTitleList.length + 1, // +1 for the "Abonelik Ekle" row
                              itemBuilder: (context, index) {
                                if (index < otherTitleList.length) {
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            flex: 2,
                                            fit: FlexFit.tight,
                                            child: Text(
                                              otherTitleList[index],
                                              style: GoogleFonts.montserrat(fontSize: 20),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Flexible(
                                            flex: 2,
                                            fit: FlexFit.tight,
                                            child: Text(
                                              textAlign: TextAlign.right,
                                              otherPriceList[index],
                                              style: GoogleFonts.montserrat(fontSize: 20),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          SizedBox(width: 20),
                                          IconButton(
                                            splashRadius: 0.0001,
                                            padding: EdgeInsets.zero,
                                            constraints: const BoxConstraints(minWidth: 23, maxWidth: 23),
                                            icon: Icon(Icons.edit, size: 21),
                                            onPressed: () {
                                              _showEditDialog(context, index, 3, 5); // Show the edit dialog
                                            },
                                          ),
                                        ],
                                      ),
                                      Divider(color: Color(0xffc6c6c7), thickness: 2, height: 20),
                                    ],
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                        if(!isOthersAddActive)
                          SizedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Diğer Gider Ekle", style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w600)),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isOthersAddActive = true;
                                    });
                                  },
                                  icon: Icon(Icons.add_circle),
                                ),
                              ],
                            ),
                          ),
                        if(isOthersAddActive)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  child:DropdownButton(
                                    value: dropdownvalueothers,
                                    icon:Icon(Icons.keyboard_arrow_down),
                                    items: othersItems.map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Text(items),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownvalueothers= newValue!;
                                      });
                                    },
                                  )
                              ),
                              Wrap(
                                children: [
                                  if(!hasOthersCategorySelected)
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isOthersAddActive = true;
                                        hasOthersCategorySelected = true;
                                      });
                                    },
                                    icon: Icon(Icons.arrow_downward, size: 26),
                                  ),
                                  if(!hasOthersCategorySelected)
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isOthersAddActive = false;
                                        hasOthersCategorySelected = false;
                                      });
                                    },
                                    icon: Icon(Icons.cancel, size: 26),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        if(hasOthersCategorySelected)
                          Container(
                            padding: EdgeInsets.only(top:10, bottom:10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: textController,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'ABA',
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: TextFormField(
                                    controller: platformPriceController,
                                    keyboardType: TextInputType.number, // Show numeric keyboard
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'GAG',
                                    ),
                                  ),
                                ),
                                Wrap(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        final text = textController.text.trim();
                                        final priceText = platformPriceController.text.trim();
                                        if (text.isNotEmpty && priceText.isNotEmpty && dropdownvalueothers == "Kira") {
                                          double dprice = double.tryParse(priceText) ?? 0.0;
                                          String price = dprice.toStringAsFixed(2);
                                          setState(() {
                                            //isEditingList = false; // Add a corresponding entry for the new item
                                            textController.clear();
                                            platformPriceController.clear();
                                            //isTextFormFieldVisible = false;
                                            isOthersAddActive = false;
                                            hasOthersCategorySelected = false;
                                          });
                                        } else if (text.isNotEmpty && priceText.isNotEmpty && dropdownvalueothers == "Mutfak") {
                                          double dprice = double.tryParse(priceText) ?? 0.0;
                                          String price = dprice.toStringAsFixed(2);
                                          setState(() {
                                            //isEditingList = false; // Add a corresponding entry for the new item
                                            textController.clear();
                                            platformPriceController.clear();
                                            //isTextFormFieldVisible = false;
                                            isOthersAddActive = false;
                                            hasOthersCategorySelected = false;
                                          });
                                        } else if (text.isNotEmpty && priceText.isNotEmpty && dropdownvalueothers == "Yeme İçme") {
                                          double dprice = double.tryParse(priceText) ?? 0.0;
                                          String price = dprice.toStringAsFixed(2);
                                          setState(() {
                                            //isEditingList = false; // Add a corresponding entry for the new item
                                            textController.clear();
                                            platformPriceController.clear();
                                            //isTextFormFieldVisible = false;
                                            isOthersAddActive = false;
                                            hasOthersCategorySelected = false;
                                          });
                                        } else if (text.isNotEmpty && priceText.isNotEmpty && dropdownvalueothers == "Eğlence") {
                                          double dprice = double.tryParse(priceText) ?? 0.0;
                                          String price = dprice.toStringAsFixed(2);
                                          setState(() {
                                            //isEditingList = false; // Add a corresponding entry for the new item
                                            textController.clear();
                                            platformPriceController.clear();
                                            //isTextFormFieldVisible = false;
                                            isOthersAddActive = false;
                                            hasOthersCategorySelected = false;
                                          });
                                        } else if (text.isNotEmpty && priceText.isNotEmpty && dropdownvalueothers == "Diğer") {
                                          double dprice = double.tryParse(priceText) ?? 0.0;
                                          String price = dprice.toStringAsFixed(2);
                                          setState(() {
                                            //isEditingList = false; // Add a corresponding entry for the new item
                                            textController.clear();
                                            platformPriceController.clear();
                                            //isTextFormFieldVisible = false;
                                            isOthersAddActive = false;
                                            hasOthersCategorySelected = false;
                                          });
                                        }
                                      },
                                      icon: Icon(Icons.check_circle, size: 26),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          //isTextFormFieldVisible = false;
                                          isOthersAddActive = false;
                                          hasOthersCategorySelected = false;
                                          textController.clear();
                                          platformPriceController.clear();
                                        });
                                      },
                                      icon: Icon(Icons.cancel, size: 26),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 5,
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
            currentIndex: 2,
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
                  Navigator.pushNamed(context, 'wishes-page');
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
  }
}


