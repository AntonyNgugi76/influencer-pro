
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:influencer_pro/ui/common/app_colors.dart';

import '../../common/ui_helpers.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        child: Container(
          // height: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: CircleAvatar(
                      radius: 45,
                      child: Image.asset('assets/icons/user.png'),
                      // backgroundColor: kcBackgroundColor,
                    )),
                horizontalSpaceSmall,
                Expanded(
                    flex: 4,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          verticalSpaceSmall,
                          Row(
                            children: [
                              horizontalSpaceSmall,
                              Text(
                                'Antony Ngugi Nyaga',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: kcPrimaryColor
                                ),
                              )
                            ],
                          ),
                          verticalSpaceSmall,
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/svgs/call.svg',
                                color: kcPrimaryColorDark,
                              ),
                              horizontalSpaceSmall,
                              Text(
                                '+254 707424334',
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14,
                                ),
                              )
                            ],
                          ),
                          verticalSpaceSmall,
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/svgs/sms.svg',
                                color: kcPrimaryColorDark,
                              ),
                              horizontalSpaceSmall,
                              Text(
                                'antonyngugi1276@gmail.com',
                                style: TextStyle(
                                    fontWeight: FontWeight.w300, fontSize: 14),
                              )
                            ],
                          ),
                          verticalSpaceSmall,
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/svgs/location.svg',
                                color: kcPrimaryColorDark,
                              ),
                              horizontalSpaceSmall,
                              Text(
                                'Nairobi, Kenya',
                                style: TextStyle(
                                    fontWeight: FontWeight.w300, fontSize: 14),
                              )
                            ],
                          ),
                          verticalSpaceSmall,
                        ])),
                verticalSpaceSmall,
                const Expanded(
                    flex: 1,
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Icon(
                        Icons.edit,
                        color: kcPrimaryColorDark,
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
