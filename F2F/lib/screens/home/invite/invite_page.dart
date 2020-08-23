import 'package:F2F/utils/colors.dart';
import 'package:flutter/material.dart';

class InvitePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Invite Friend",
          style: TextStyle(
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: LightColor.lightTeal,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                flex: 40,
                child: Container(
                    height: double.infinity,
                    child: Image.asset(
                        "assets/drawable-xxhdpi/invite_friend.png")),
              ),
              Flexible(
                flex: 10,
                child: Container(
                  height: double.infinity,
                  width: 180.0,
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Invite your friends Reward yourself",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: LightColor.lightTeal,
                          fontFamily: "Montserrat",
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 10,
                child: Container(
                  height: double.infinity,
                  width: 225.0,
                  child: Text(
                    "For every friend who joins ReferUp we will give you 10",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontFamily: "Montserrat",
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 45,
                child: Container(
                  width: 280.0,
                  child: FlatButton(
                    color: LightColor.lightTeal,
                    textColor: Colors.white,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    padding: EdgeInsets.all(8.0),
                    splashColor: Colors.teal,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => InviteFriend()));
                    },
                    child: Text(
                      "INVITE FRIENDS",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class InviteFriend extends StatefulWidget {
  @override
  _InviteFriendState createState() => _InviteFriendState();
}

class _InviteFriendState extends State<InviteFriend> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Invite Friend",
          style: TextStyle(
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: LightColor.lightTeal,
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 30.0,
          ),
          for (int i = 0; i < 5; i++)
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Image.asset(
                        "assets/drawable-xxhdpi/user2.png",
                        height: 60.0,
                        width: 60.0,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Container(
                          height: 40.0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Monica",
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text(
                                "8234719239",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    width: 100.0,
                    child: FlatButton(
                      color: LightColor.lightTeal,
                      textColor: Colors.white,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      padding: EdgeInsets.all(8.0),
                      splashColor: Colors.teal,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => InviteFriend()));
                      },
                      child: Text(
                        "INVITE",
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 14.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}
