import 'package:flutter/material.dart';
import 'package:uber_clone_app/common/color_extension.dart';
import 'package:uber_clone_app/common_widget/document_row.dart';
import 'package:uber_clone_app/common_widget/round_button.dart';
import 'package:uber_clone_app/view/login/subscription_plan_view.dart';

class VehicleDocumentUploadView extends StatefulWidget {
  const VehicleDocumentUploadView({super.key});

  @override
  State<VehicleDocumentUploadView> createState() =>
      _VehicleDocumentUploadView();
}

class _VehicleDocumentUploadView extends State<VehicleDocumentUploadView> {
  List documentList = [
    {
      "name": "RC Book",
      "detail": "Vihicle  registration",
      "info": "",
      "status": DocumentStatus.uploaded
    },
    {
      "name": "Insurence Policy",
      "detail": "A driving licence  is an official do...",
      "info": "",
      "status": DocumentStatus.uploading
    },
    {
      "name": "Owner certificate",
      "detail": "A passport is a travelling  document",
      "info": "",
      "status": DocumentStatus.upload
    },
    {
      "name": "PUC",
      "detail": "Incorect  document type",
      "info": "",
      "status": DocumentStatus.upload
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Image.asset("assets/img/back.png", width: 20, height: 20),
          color: const Color.fromARGB(255, 163, 163, 163),
        ),
        centerTitle: true,
        title: Text(
          "Vehicle Document",
          style: TextStyle(
              color: TColor.primaryText,
              fontSize: 25,
              letterSpacing: 3.0,
              fontWeight: FontWeight.w800),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var dObj = documentList[index] as Map? ?? {};
                    return DocumentRow(
                        dObj: dObj,
                        onPress: () {},
                        onPressed: () {},
                        onInfo: () {
                          showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (context) {
                                return Container(
                                  width: context.width,
                                  height: context.height - 100,
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 46, horizontal: 20),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 20),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 3),
                                      ]),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "RC Book",
                                        style: TextStyle(
                                            color: TColor.primaryText,
                                            fontSize: 25,
                                            fontWeight: FontWeight.w800),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Expanded(
                                        child: SingleChildScrollView(
                                          child: Text(
                                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tincidunt vitae felis non feugiat.\n\nMauris lectus velit, rhoncus vel est a, eleifend ullamcorper quam. Donec vitae dui pharetra, vestibulum mi a, sollicitudin leo. Sed nec consectetur mauris.\n\nMaecenas non augue diam. Nulla vehicula elit vel dolor feugiat suscipit. Nunc neque risus, blandit eu augue non, tincidunt commodo elit. Nunc ut sodales ex. Ut accumsan scelerisque sem sit amet mattis. Quisque sagittis pellentesque enim eu auctor. Morbi consectetur tempus diam.\n\nSed nec consectetur mauris. Maecenas non augue diam. Nulla vehicula elit vel dolor feugiat suscipit. Nunc neque risus, blandit eu augue non, tincidunt commodo elit. Nunc ut sodales ex. Ut accumsan scelerisque sem sit amet mattis. Quisque sagittis pellentesque enim eu auctor. Morbi consectetur tempus diam.\n\nSed nec consectetur mauris. Maecenas non augue diam. Nulla vehicula elit vel dolor feugiat suscipit. Nunc neque risus, blandit eu augue non, tincidunt commodo elit. Nunc ut sodales ex. Ut accumsan scelerisque sem sit amet mattis. Quisque sagittis pellentesque enim eu auctor. Morbi consectetur tempus diam.",
                                            style: TextStyle(
                                              color: TColor.primaryText,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          TextButton(
                                            onPressed: () {
                                              context.pop();
                                            },
                                            child: Text(
                                              "OK",
                                              style: TextStyle(
                                                color: TColor.primary,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              });
                        },
                        onUpload: () {},
                        onAction: () {},
                        status: dObj["status"] as DocumentStatus? ??
                            DocumentStatus.upload);
                  },
                  itemCount: documentList.length),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "By countinuing, I confirm i  have read and agree withh the",
                    style: TextStyle(
                      color: TColor.primaryText,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Terms and conditions",
                    style: TextStyle(
                      color: TColor.primaryText,
                      fontSize: 11,
                    ),
                  ),
                  Text(
                    " and ",
                    style: TextStyle(
                      color: TColor.primaryText,
                      fontSize: 11,
                    ),
                  ),
                  Text(
                    "Privacy policy",
                    style: TextStyle(
                      color: TColor.primaryText,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              RoundButton(
                title: "NEXT",
                onPress: () {
                  context.push(const SubscriptionPlanView());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
