import 'package:flutter/material.dart';
import 'package:shop_app/app/constans.dart';

class IconBtnWithCounter extends StatelessWidget {
  const IconBtnWithCounter({
    Key? key,
    required this.icon,
    this.numOfitem = 0,
    required this.press,
  }) : super(key: key);

  final IconData icon;
  final int numOfitem;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8,top: 8,right: 5),
      child: InkWell(
        borderRadius: BorderRadius.circular(100),
        onTap: press,
        child: Stack(
          clipBehavior: Clip.none, children: [
            Container(
              padding: EdgeInsets.all(8),
              height: 46,
              width: 46,
              decoration: BoxDecoration(
                color: kSecondaryColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon,color: Colors.black45,),
            ),
            if (numOfitem != 0)
              Positioned(
                top: -3,
                right: 0,
                child: Container(
                  height: 16,
                  width: 16,
                  decoration: BoxDecoration(
                    color: Color(0xFFFF4848),
                    shape: BoxShape.circle,
                    border: Border.all(width: 1.5, color: Colors.white),
                  ),
                  child: Center(
                    child: Text(
                      '$numOfitem',
                      style: TextStyle(
                        fontSize: 10,
                        height: 1,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}