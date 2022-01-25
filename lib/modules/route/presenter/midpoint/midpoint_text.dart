// ignore_for_file: constant_identifier_names

class MidpointText {
  static const TITLE = "Ponto intermediário";
  static const DESCRIPTION_PART_1 = "Insira os pontos intermediários na ";
  static const DESCRIPTION_PART_2 = "sequência exata";
  static const DESCRIPTION_PART_3 = " em que você passará por eles";
  static const TEXT_FIELD_1 = "Nome da cidade";
  static const BUTTON = "Confirmar";

  static subDescription(String origin, String destin) {
    return "Usuários que viajam de campo $origin para $destin também passam por:";
  }
}
