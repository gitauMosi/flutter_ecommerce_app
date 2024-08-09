import 'package:flutter/material.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});


  @override
  Widget build(BuildContext context) {


    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ProfileHeader(
            coverImage: const AssetImage("assets/images/deepOrange.jpg"),
             avatar: const AssetImage("assets/logo/profile.png"), 
             title: "Mosi git",
             subtitle: "Customer",
             actions: <Widget> [
              MaterialButton(
                onPressed: (){},
                color: Colors.white,
                shape: const CircleBorder(),
                elevation: 0,
                child: const Icon(Icons.edit),
                )

             ],
             ),
          const SizedBox(height: 10.0,),
          const UserInfo(),
          const AccountInfo(),
        ],
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          child: const Text(
            "User Information",
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        Card(
          child: Container(alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              ...ListTile.divideTiles(
                color: Colors.grey,
                tiles: [
                  const ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12, vertical: 4
                    ),
                    leading: Icon(Icons.my_location),
                    title: Text("Location"),
                    subtitle: Text("Kamwangi"),
                  ),
                  const ListTile(
                    leading: Icon(Icons.email),
                    title: Text("Email"),
                    subtitle: Text("mosi@gmail.com"),
                  ),
                  const ListTile(
                    leading: Icon(Icons.phone),
                    title: Text("Phone"),
                    subtitle: Text("254115088899"),
                  ),
                  const ListTile(
                    leading: Icon(Icons.person),
                    title: Text("About me"),
                    subtitle: Text("This is abount melink and you can know about me in this section"),
                  ),
                  
                ]
              )
            ],
          ),),
        )

      ],
    );
  }
}

class AccountInfo extends StatefulWidget {
  const AccountInfo({super.key});

  @override
  State<AccountInfo> createState() => _AccountInfoState();
}

class _AccountInfoState extends State<AccountInfo> {
    bool _obscureText = true;
  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          child: const Text(
            "Account Information",
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        Card(
          child: Container(alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              ...ListTile.divideTiles(
                color: Colors.grey,
                tiles: [
                   ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 4
                    ),
                    leading: const Icon(Icons.wallet),
                    title: const Text("Account Balance"),
                    subtitle: Text(_obscureText ? "Ksh. 0.00" : '' ),
                    trailing: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: _togglePasswordVisibility,
        ),
                  ),
                  const ListTile(
                    leading: Icon(Icons.settings),
                    title: Text("Settings"),
                    subtitle: Text(""),
                  ),
                  const ListTile(
                    leading: Icon(Icons.logout),
                    title: Text("Logout"),
                    subtitle: Text(""),
                  ),
                 
                  
                ]
              )
            ],
          ),),
        )

      ],
    );
  }
}


class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key,
  required this.coverImage,
  required this.avatar,
  required this.title,
  this.subtitle,
  this.actions
  });

  final ImageProvider<dynamic> coverImage;
  final ImageProvider<dynamic> avatar;
  final String title;
  final String? subtitle;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Ink(
          height: 150,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: coverImage as ImageProvider<Object>, fit: BoxFit.cover
              ),
          ),
        ),
        Ink(
            height: 150,
            decoration: const BoxDecoration(
              color: Colors.black38
            ),
          ),
        if (actions != null)
           Container(
            width: double.infinity,
            height: 200,
            padding: const EdgeInsets.only(
              bottom: 0.0, right: 0.0
            ),
            alignment: Alignment.bottomRight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: actions!,
            ),
           ),
      Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 100),
        child: Column(
          children: <Widget>[
            Avatar(
              image: avatar,
              radius: 40,
              backgroundColor: Colors.white,
              borderColor: Colors.grey.shade300,
              borderWidth: 4.0,
            ),
            Text(title,
            style: Theme.of(context).textTheme.titleLarge,
            ),
            if(subtitle != null)
               const SizedBox(height: 5.0,),
               Text(
                subtitle!,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Colors.grey
                ),
               )
          ],
        ),

      )
      ],
    );
  }
}

class Avatar extends StatelessWidget {
  const Avatar({super.key,
  required this.image,
  this.borderColor = Colors.grey,
  this.backgroundColor,
  this.radius = 30,
  this.borderWidth = 5
  });

  final ImageProvider<dynamic> image;
  final Color borderColor;
  final Color? backgroundColor;
  final double radius;
  final double borderWidth;

  

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius + borderWidth,
      backgroundColor: borderColor,
      child: CircleAvatar(
        radius: radius,
        backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
        child: CircleAvatar(
          radius: radius - borderWidth,
          backgroundImage: image as ImageProvider<Object>?,),
      ),
    );
  }
}