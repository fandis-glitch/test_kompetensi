import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 40, right: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(padding: EdgeInsets.only(top: 20)),
                Text("Fandi Sujatmiko"),
                Padding(padding: EdgeInsets.only(top: 20)),
                Container(
                  alignment: Alignment.center,
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage("https://z-p4-instagram.fcgk7-2.fna.fbcdn.net/v/t51.2885-19/s150x150/120134469_268799064164468_2244993524882196391_n.jpg?tp=1&_nc_ht=z-p4-instagram.fcgk7-2.fna.fbcdn.net&_nc_cat=108&_nc_ohc=NrMqyslKcQ8AX_X9VfC&ccb=7-4&oh=8609fd36a511eef4aca9c589af7030bc&oe=60841C7F&_nc_sid=7bff83"),
                          fit: BoxFit.cover
                      ),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 20)),
                Row(
                  children: [
                    Icon(Icons.mail_outline, size: 24,),
                    Padding(padding: EdgeInsets.only(left: 30)),
                    Expanded(
                      flex: 3,
                      child: Text("fandi260193@gmail.com")
                    ),

                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                Row(
                  children: [
                    Image.asset('assets/git_hub.png', width: 24,),
                    Padding(padding: EdgeInsets.only(left: 30)),
                    Expanded(
                        flex: 3,
                        child: GestureDetector(
                          onTap: (){
                            _toUrl('https://github.com/fandis-glitch/my_flutter.git');
                          },
                          child: Text("https://github.com/fandis-glitch/my_flutter.git"),
                        )
                    ),

                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                Row(
                  children: [
                    Image.asset('assets/linked_in.jpg', width: 24,),
                    Padding(padding: EdgeInsets.only(left: 30)),
                    Expanded(
                        flex: 3,
                        child: GestureDetector(
                          onTap: (){
                            _toUrl('https://www.linkedin.com/in/fandi-sujatmiko-86a3581bb/');
                          },
                          child: Text("https://www.linkedin.com/in/fandi-sujatmiko-86a3581bb/"),
                        )
                    ),

                  ],
                )
              ],
          ),
        ),
      ),
    );
  }

  void _toUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
