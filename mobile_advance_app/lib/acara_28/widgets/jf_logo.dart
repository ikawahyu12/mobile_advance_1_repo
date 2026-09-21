import 'package:flutter/material.dart';
import '../theme.dart';
class JFLogo extends StatelessWidget {
  final double size;
  final Color background;
  final Color textColor;
  const JFLogo({
    super.key,
    this.size = 72,
    this.background = Colors.white,
    this.textColor = AppColors.primaryBlue,});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(size * 0.28),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 12,
            offset: Offset(0, 6),),],),
      alignment: Alignment.center,
      child: Text('JF',
        style: TextStyle(
          fontSize: size * 0.38,
          fontWeight: FontWeight.w800,
          color: textColor,),),
    );
  }
}
class SocialIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  const SocialIconButton(
    {super.key, required this.icon, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(24),
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.inputFill,
          border: Border.all(color: AppColors.divider),),
        alignment: Alignment.center,
        child: Icon(icon, size: 20, color:
         AppColors.primaryBlue),
      ),
    );
  }
}