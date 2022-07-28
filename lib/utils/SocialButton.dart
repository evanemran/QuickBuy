import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final String texto;
  final String? imagem;
  final Color? cor;
  final ElevatedButton? icon;

  const SocialButton({
    Key? key,
    required this.texto,
    this.imagem,
    this.cor,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(8),
          overlayColor: MaterialStateProperty.all(Colors.black12),
          shadowColor: MaterialStateProperty.all(Colors.pink.shade50),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
          backgroundColor: MaterialStateProperty.all(Colors.white),
          // fixedSize: MaterialStateProperty.all(const Size(412, 60)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              imagem.toString(),
              scale: 8,
            ),
            const Spacer(),
            Text(
              texto,
              textAlign: TextAlign.right,
              style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 17,
                  fontWeight: FontWeight.w500),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
