import 'package:flutter/material.dart';

class InfoSystem extends StatelessWidget {
  const InfoSystem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 150),
        // title
        const FittedBox(
          child: Text(
            'GItens.',
            style: TextStyle(
              fontFamily: 'Poppins',
              color: Color(0xff28313b),
              fontSize: 50,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              //letterSpacing: 1.5,
            ),
          ),
        ),
        // Description
        RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: 'Sistema de gerenciamento de vendas',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Color(0xff1a345d),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                width: 150,
                height: 57,
                decoration: BoxDecoration(
                    color: const Color(0xff47afc9),
                    borderRadius: BorderRadius.circular(8)),
                child: const Center(
                  child: Text(
                    "Saiba mais",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Color(0xffffffff),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 100,
        )
      ],
    );
  }
}
