import 'package:equatable/equatable.dart'; 


class Client extends Equatable  {

  Client (
      this.rag_sociale,
      this.num_contratti,
      );

  String rag_sociale;
  int num_contratti;

  @override
  // TODO: implement props
  List<Object> get props => [ rag_sociale ];

}