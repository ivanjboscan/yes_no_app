import 'package:dio/dio.dart';
import 'package:yes_no_app/infrastructure/models/yes_no_model.dart';

import '../../domain/entities/message.dart';

class GetYesNoAnswer {
  Future<Message> getAnswer() async {
    final dio = Dio();

    final response = await dio.get('https://yesno.wtf/api');

    final yesNoModel = YesNoModel.fromJsonMap(response.data);

    //throw UnimplementedError();

    /*
    Esta es una forma de construir la respuesta del mensaje. Pero se puede lograr que
    de una forma mas elegante devuelva esa respuesta ya construida como se verá mas
    abajo la implementación final.

    return Message(
        text: yesNoModel.answer,
        fromWho: FromWho.hers,
        imageUrl: yesNoModel.image);
    */


    return yesNoModel.toMessageEntity();
  }
}
