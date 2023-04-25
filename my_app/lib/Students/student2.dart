import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Component/toMarkPage.dart';

class Student2 extends StatelessWidget {
  final String? name;

  const Student2({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name!),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              Text(
                  "Albert Einstein (/ˈaɪnstaɪn/ EYEN-styne;[4] German: [ˈalbɛʁt ˈʔaɪnʃtaɪn] (listen); 14 March 1879 – 18 April 1955) was a German-born theoretical physicist,[5] widely acknowledged to be one of the greatest and most influential physicists of all time."),
              CachedNetworkImage(
                  height: 500,
                  width: 300,
                  imageUrl:
                      "https://t3.gstatic.com/licensed-image?q=tbn:ANd9GcSJKyrj1M_E4zNvs1V3mfNkv13MajxmmotwGgNlb639NJVMdPgVDHv29wgH_SnTO_Ep_SPNM6vm_yslNWc",
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(
                        color: Colors.blue,
                      ),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.error)),
              ToMarkPage(),
              BackButton(),
            ],
          ),
        ),
      ),
    );
  }
}
