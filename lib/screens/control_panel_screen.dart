import 'package:flutter/material.dart';
import '../widgets/profile_card.dart';
import '../utilities/styles.dart';

class ControlPanelScreen extends StatefulWidget {
  const ControlPanelScreen({Key? key}) : super(key: key);

  @override
  _ControlPanelScreenState createState() => _ControlPanelScreenState();
}

class _ControlPanelScreenState extends State<ControlPanelScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color.fromRGBO(0, 8, 63, 100), Color.fromRGBO(0, 43, 123, 100)])
      ),
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0 ,top: 10),
              child: GestureDetector(
                child: Text('کنترل پنل' , style: pageTitleTextStyle,),
              ),
            ),
            Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: GestureDetector(
          child: const Icon(Icons.arrow_forward_ios),
            onTap: (){
              Navigator.pop(context);
            },
          ),
        ),
          ],
        ),
        body: ListView(
          children: [
            const ProfileCard(profile_path: 'ddd', name: 'asada',),
            Padding(
              padding: const EdgeInsets.only(right: 13 , top: 1),
              child: Text('امکانات' , style: titleButtonsTextStyle,textAlign: TextAlign.right,),
            ),
            Container(
              padding: const EdgeInsets.only(right: 8 , left: 8 , top: 5),
              height: 60,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromRGBO(255, 255, 255, 100),
                  ),
                  onPressed: () {  },
                   icon: Container(child: Text('خرید اشتراک',style: buttonsTextStyle,), alignment: Alignment.centerRight, width: 300,),
                   label: Container(child: const Icon(Icons.shopping_cart) , alignment: Alignment.centerRight,),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 13 , top: 12),
              child: Text('ویژگی ها' , style: titleButtonsTextStyle,textAlign: TextAlign.right,),
            ),
            Container(
              padding: const EdgeInsets.only(right: 8 , left: 8 , top: 5),
              height: 60,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromRGBO(255, 255, 255, 100),
                  ),
                  onPressed: () {  },
                  icon: Container(child: Text('معرفی کردن به دوستان',style: buttonsTextStyle,), alignment: Alignment.centerRight, width: 310,),
                  label: Container(child: const Icon(Icons.share) , alignment: Alignment.centerRight,width: 20,),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 8 , left: 8 , top: 5),
              height: 60,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromRGBO(255, 255, 255, 100),
                  ),
                  onPressed: () {  },
                  icon: Container(child: Text('ثبت نظر در گوگل پلی',style: buttonsTextStyle,), alignment: Alignment.centerRight, width: 310,),
                  label: Container(child: const Icon(Icons.comment) , alignment: Alignment.centerRight, width: 15,),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 13 , top: 12),
              child: Text('اطلاعات حساب کاربری' , style: titleButtonsTextStyle,textAlign: TextAlign.right,),
            ),
            Container(
              padding: const EdgeInsets.only(right: 8 , left: 8 , top: 5),
              height: 60,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromRGBO(255, 255, 255, 100),
                  ),
                  onPressed: () {  },
                  icon: Container(child: Text('تغییر رمز عبور',style: buttonsTextStyle,), alignment: Alignment.centerRight, width: 310,),
                  label: Container(child: const Icon(Icons.vpn_key_sharp) , alignment: Alignment.centerRight, width: 20,),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 8 , left: 8 , top: 5),
              height: 60,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromRGBO(255, 255, 255, 100),
                  ),
                  onPressed: () {  },
                  icon: Container(child: Text('خروج از حساب کاربری',style: buttonsTextStyle,), alignment: Alignment.centerRight, width: 290,),
                  label: Container(child: const Icon(Icons.logout) , alignment: Alignment.centerRight,),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

