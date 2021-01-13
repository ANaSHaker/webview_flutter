import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:webview/webview.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
//import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:launch_review/launch_review.dart';
import 'package:share/share.dart';
import 'package:webview/webview.dart';


import 'constants.dart';






class Draweer extends StatefulWidget {
  Draweer({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DraweerState createState() => _DraweerState();
}

class _DraweerState extends State<Draweer>   {
  KFDrawerController _drawerController;


 /* MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    nonPersonalizedAds: true,
    keywords: <String>['Game', 'Development', 'Programming'],
  );

  BannerAd _bannerAd;
  InterstitialAd _interstitialAd;

  BannerAd createBannerAd() {
    return BannerAd(
        adUnitId: "ca-app-pub-2711555852304302/4818473994",
        //Change BannerAd adUnitId with Admob ID
        size: AdSize.banner,
        targetingInfo: targetingInfo,
        listener: (MobileAdEvent event) {
          print("BannerAd $event");
        });
  }

  InterstitialAd createInterstitialAd() {
    return InterstitialAd(
        adUnitId: "ca-app-pub-2711555852304302/8995739766",
        //Change Interstitial AdUnitId with Admob ID
        targetingInfo: targetingInfo,
        listener: (MobileAdEvent event) {});
  }

  @override
  void dispose() {
    _bannerAd.dispose();
    _interstitialAd.dispose();
    super.dispose();
  }


  @override
  void initState() {
    super.initState();
    FirebaseAdMob.instance
        .initialize(appId: "ca-app-pub-2711555852304302~5784264821");
    //Change appId With Admob Id
    _bannerAd = createBannerAd()
      ..load()
      ..show(
          anchorType: AnchorType.bottom,
          horizontalCenterOffset: 0,
          anchorOffset: 0);
  }

*/



  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: WillPopScope(
          onWillPop: () {
            return  AwesomeDialog(
              context: context,

              headerAnimationLoop: false,
              dialogType: DialogType.ERROR,
              animType: AnimType.BOTTOMSLIDE,
              body: ListTile(
                title: Padding(
                  padding: const EdgeInsets.only(bottom:15.0),
                  child: Text("هل تود اغلاق التطبيق",textAlign: TextAlign.center,),
                ),

                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FlatButton(

                      color: Colors.green,
                      child: Text("نعم"),
                      onPressed: () {
                        /*createInterstitialAd()
                          ..load()
                          ..show();*/
                        SystemNavigator.pop();
                      },
                    ),
                    FlatButton(
                      color: Colors.red,
                      child: Text("لا"),
                      onPressed: () {
                      /*createInterstitialAd()
                      ..load()
                      ..show();*/
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                ),
              ),
            )
                .show();


          },
          child: KFDrawer(

            controller: KFDrawerController(
              initialPage : MyHomePage(),
              items: [
                KFDrawerItem.initWithPage(
                  text: Text("الوضع الليلي", style: TextStyle(color: Colors.white)),
                  onPressed: changeBrightness,
                  icon:Icon(FontAwesomeIcons.moon,color:Colors.white),
                ),
                KFDrawerItem.initWithPage(
                  text: Text("مشاركة التطبيق", style: TextStyle(color: Colors.white)),
                  icon:Icon(FontAwesomeIcons.share,color:Colors.white),
                  onPressed: () {
                    /*createInterstitialAd()
                      ..load()
                      ..show();*/
                    Share.share(
                        "Hey! Check out this app on Playstore. Coupons app for all offers from different places. If you love the app please review the app on playstore and share it with your friends. https://play.google.com/store/apps/details?id=com.thqq.omnyati");
                  },

                ),
                KFDrawerItem.initWithPage(
                  text: Text("تقييم التطبيق", style: TextStyle(color: Colors.white)),
                  icon:Icon(FontAwesomeIcons.star,color:Colors.white),
                  onPressed: () {
                /*  createInterstitialAd()
                      ..load()
                      ..show();*/
                    LaunchReview.launch();

                  },

                ),





              ],
            ),
            footer: Container(),
            header: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 19.0),
                width: MediaQuery.of(context).size.width * 0.5,
                child: Image.asset(
                  'assets/logo.png',
                  alignment: Alignment.centerLeft,
                ),
              ),
            ),


            decoration: Theme.of(context).brightness == Brightness.dark
                ? BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [gradientDarkStart, gradientDarkEnd],
                tileMode: TileMode.repeated,
              ),
            ) : BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [gradientLightStart, gradientLightEnd],
                tileMode: TileMode.repeated,
              ),
            ),
          ),
        )


    );
  }
  void changeBrightness() {
    DynamicTheme.of(context).setBrightness(
        Theme.of(context).brightness == Brightness.dark
            ? Brightness.light
            : Brightness.dark);
  }
}