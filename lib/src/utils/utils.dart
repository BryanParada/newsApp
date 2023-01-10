import 'package:flutter/material.dart'; 
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart'; 
import 'package:flutter_share/flutter_share.dart';
 
void launchURL(BuildContext context , String url) async { 
  
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url )) throw 'Could not launch $url'; //_url,mode: LaunchMode.externalApplication
    print('HTTP!!!!!'); 
}


void shareUrl(BuildContext context, String url) async {
 
    await FlutterShare.share(
      title: 'Sharing News',
      text: 'Hey check this news!: $url ',
      linkUrl: url,
      chooserTitle: 'Share URL with:',
    );
}