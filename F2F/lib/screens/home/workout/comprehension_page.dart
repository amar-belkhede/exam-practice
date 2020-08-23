import 'package:F2F/utils/colors.dart';
import 'package:flutter/material.dart';

class ComprehensionPage extends StatefulWidget {
  @override
  _ComprehensionPageState createState() => _ComprehensionPageState();
}

class _ComprehensionPageState extends State<ComprehensionPage> {
  var radio1;
  var radio2;
  var radio3;

  var radioValues1 = ["Blackness", "Darkness", "Whiteness", "Joyfulness"];
  var radioValues2 = [
    "Joy of music",
    "Joy of voice",
    "Joy of sound",
    "Joy of speaking"
  ];
  var radioValues3 = ["in a village", "in a city", "in a town", "in a wood"];

  tabContent() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                    "Read the following passage carefully and answer the questions given below :"),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "I have often thought it would be a blessing if each human being was stricken blind and deaf for a few days at some time during his adult life. Darkness would make him more appreciative of sight, silence would teach him the joy of sound. Now and then I have tested my seeing friends to discover what they see. Recently I asked a friend, who had just returned from a long walk in the woods, what she has observed. \"Nothing in particular,\" she replied.",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Questions:",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "(a) What would make one's blindness more appreciative of sight ?",
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: <Widget>[
                    for (var v in radioValues1) radioTab(v),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "(b) What would silence teach one's deafness ?",
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: <Widget>[
                    for (var v in radioValues2) radioTab(v),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "(c) Where did her friend go ?",
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: <Widget>[
                    for (var v in radioValues3) radioTab(v),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 60.0,
            width: double.infinity,
            color: LightColor.lightTeal,
            child: Center(
              child: Text(
                "SUBMIT",
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }

  radioTab(value) {
    return Container(
      height: 25.0,
      child: Row(
        children: <Widget>[
          Container(
            height: 15.0,
            width: 20.0,
            child: Radio(
              focusColor: Colors.grey,
              value: value,
              groupValue: radio1,
              onChanged: (val) {
                setState(() {
                  radio1 = val;
                });
              },
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    btSheet(context) {
      return showBottomSheet(
        // elevation: 10,
        context: context,
        builder: (context) => Container(
          decoration: new BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  // offset: Offset(0.0, 4.0),
                  blurRadius: 20.0,
                ),
              ],
              borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(20.0),
                  topRight: const Radius.circular(20.0))),

          // color: Colors.white,
          height: 250,
          width: double.infinity,
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Wrap(
                  spacing: 5.0,
                  runSpacing: 3.0,
                  children: <Widget>[
                    filterChipWidget(chipName: 'Chapter 1'),
                    filterChipWidget(chipName: 'Chapter 2'),
                    filterChipWidget(chipName: 'Chapter 3'),
                    filterChipWidget(chipName: 'Chapter 4'),
                    filterChipWidget(chipName: 'Chapter 5'),
                    filterChipWidget(chipName: 'Chapter 6'),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    width: 150.0,
                    height: 40.0,
                    child: RaisedButton(
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                        child: Text("Search"),
                        textColor: Colors.white,
                        color: LightColor.lightTeal,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0))),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            // backgroundColor: Colors.white,
            title: Text(
              "Comprehension",
              // style: TextStyle(
              //   fontFamily: "Montserrat",
              //   fontWeight: FontWeight.w700,
              // ),
            ),
            actions: <Widget>[
              Builder(builder: (context) {
                return IconButton(
                  icon: Icon(
                    Icons.filter_list,
                    color: Colors.white,
                  ),
                  onPressed: () => btSheet(context),
                );
              })
            ],
            backgroundColor: LightColor.lightTeal,
            bottom: TabBar(
              // isScrollable: true,
              labelColor: Colors.white,
              indicatorColor: Colors.white,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width: 2.0, color: Colors.white),
                insets: EdgeInsets.symmetric(horizontal: 30.0),
              ),
              tabs: [
                Tab(text: "Chapters"),
                Tab(text: "Poems"),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              tabContent(),
              tabContent(),
            ],
          ),
        ));
  }
}

class filterChipWidget extends StatefulWidget {
  final String chipName;

  filterChipWidget({Key key, this.chipName}) : super(key: key);

  @override
  _filterChipWidgetState createState() => _filterChipWidgetState();
}

class _filterChipWidgetState extends State<filterChipWidget> {
  var _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(widget.chipName),
      labelStyle: TextStyle(
        color: _isSelected ? Colors.white : Colors.teal,
        fontSize: 16.0,
      ),
      checkmarkColor: Colors.white,
      selected: _isSelected,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      backgroundColor: Color(0xffededed),
      onSelected: (isSelected) {
        setState(() {
          _isSelected = isSelected;
        });
      },
      selectedColor: LightColor.lightTeal,
    );
  }
}
