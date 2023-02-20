abstract class EndeavorBlock {
  String? endeavorId;
  EndeavorBlockType? type;

  EndeavorBlock({this.type, this.endeavorId});

  bool validate();
}

enum EndeavorBlockType { single, repeating }
