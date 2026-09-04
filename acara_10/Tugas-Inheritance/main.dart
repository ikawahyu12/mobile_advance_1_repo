import 'armor_titan.dart';
import 'attack_titan.dart';
import 'beast_titan.dart';
import 'human.dart';

void main() {
  ArmorTitan armor = ArmorTitan();
  AttackTitan attack = AttackTitan();
  BeastTitan beast = BeastTitan();
  Human human = Human();

  armor.powerPoint = 3;
  attack.powerPoint = 8;
  beast.powerPoint = 4;
  human.powerPoint = 10;

  print("Armor Titan Power: ${armor.powerPoint}, Aksi: ${armor.terjang()}");
  print("Attack Titan Power: ${attack.powerPoint}, Aksi: ${attack.punch()}");
  print("Beast Titan Power: ${beast.powerPoint}, Aksi: ${beast.lempar()}");
  print("Human Power: ${human.powerPoint}, Aksi: ${human.killAlltitan()}");
}