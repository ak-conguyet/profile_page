import 'package:flutter/material.dart';
import 'package:profile_page/MyColors.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: color1,
      body: Center(
        child: ListView(
          children: [
            Column(
              children: [
                _avatar(),
                _name(),
                ConstrainedBox(
                  constraints:const BoxConstraints(
                    maxWidth: 800,
                  ),
                  child: Container(
                    margin: const EdgeInsets.only(top: 20,left: 20,right: 20),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: color2,
                      borderRadius:const BorderRadius.all(Radius.circular(25))
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Giới thiệu',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        const SizedBox(height: 10,),
                        _item(icon: 'images/icons/github.png', uri: 'https://github.com/ak-conguyet'),
                        _item(icon: 'images/icons/facebook.png', uri: 'https://www.facebook.com/Anh.Kiet201'),
                        _item(icon: 'images/icons/instagram.png', uri: 'https://www.instagram.com/anh_kiet_hk'),
                        _item(icon: 'images/icons/tiktok.png', uri: 'https://www.tiktok.com/@ak_conguyet'),
                        _item(icon: 'images/icons/telegram.png', uri: 'https://t.me/ak_conguyet'),
                        _item(icon: 'images/icons/gmail.png', uri: 'mailto:igg.anhkiet1@gmail.com'),
                      ],
                    )
                  ),
                )
              ],
            )
          ],
        )
      )
    );
  }

  Widget _item({required String icon, required String uri, String? text}){
    Uri u = Uri.parse(uri);
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          Image.asset(
            icon,
            height: 20,
            width: 20,
          ),
          const SizedBox(width: 20,),
          Hyberlink(
            text: text ?? u.path,
            onClick: () async{
              if(await canLaunchUrl(u)){
                launchUrl(u);
              }
            },
          )
        ],
      ),
    );
  }

  Container _name() {
    return Container(
                child: Column(
                  children:const [
                    Text(
                      'Anh Kiệt',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      '(ak-conguyet)',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                      ),
                    ),
                  ],
                ),
              );
  }

  Container _avatar() {
    return Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 5,
              ),borderRadius: const BorderRadius.all(Radius.circular(200))
            ),
            child: ClipRRect(
              borderRadius:const BorderRadius.all(Radius.circular(150)),
              child: Image.asset(
                  'images/avt.jpg',
                width: 300,
              ),
            ),
          );
  }
}

class Hyberlink extends StatefulWidget {
  const Hyberlink({Key? key,required this.text, this.size:16, this.onClick}) : super(key: key);
  final String text;
  final double size;
  final Function()? onClick;
  @override
  State<Hyberlink> createState() => _HyberlinkState();
}

class _HyberlinkState extends State<Hyberlink> {

  bool _isHover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onHover: (e)=>setState(()=>_isHover=true),
      onExit: (e)=>setState(()=>_isHover=false),
      child: GestureDetector(
        child: Text(
          widget.text,
          style: TextStyle(
            color: Colors.white,
            fontSize: widget.size,
            decoration: _isHover ? TextDecoration.underline : TextDecoration.none
          ),
        ),
        onTap: ()=> widget.onClick?.call(),
      ),
    );
  }
}

