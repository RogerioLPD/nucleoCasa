import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:nucleo/model/enterprise_item.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class EnterpriseController {
  StreamController<List<EnterpriseItem>> dataController =
      StreamController.broadcast();
  StreamController<List<String>> cityController = StreamController.broadcast();
  StreamController<bool> isLoading = StreamController.broadcast();
  StreamController<bool> isLoadingSearch = StreamController.broadcast();
  List<EnterpriseItem> itemSecondary = [];

  EnterpriseController() {
    initValues();
  }
  List<EnterpriseItem> item = [];

  initValues() async {
    await getData();
    isLoadingSearch.sink.add(false);
  }

  getData() async {
    isLoading.sink.add(true);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    //String token = sharedPreferences.getString('token')!;
    var url = Uri.parse(
        "http://nucleocasadecor-production.up.railway.app/api/empresas/");
    Map<String, String> headers = {
      //'Authorization': token,
      'content-type': 'application/json',
    };
    List<String> city = [];
    // Map<String, dynamic> body = {
    //   "username": _emailController.text,
    //   "password": _senhaController.text,
    // };
    city.add("Selecionar");
    try {
      var response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        if (json.decode(response.body) != null) {
          item = (json.decode(mockData()) as List)
              .map((data) => EnterpriseItem.fromJson(data))
              .toList();

          dataController.sink.add(item);

          for (EnterpriseItem data in item) {
            if (!city.contains(data.city)) {
              city.add(data.city!);
            }
          }
          cityController.sink.add(city);
          isLoading.sink.add(false);
          // if (kDebugMode) {
          //   print(response.body);
          // }

        }
      } else {}
    } catch (e) {
      log(e.toString());
    }
  }

  makeSearchBox(value) async {
    itemSecondary.clear();

    if (value == null || value == "Selecionar") {
      dataController.sink.add(item);
    } else {
      for (EnterpriseItem data in item) {
        if (data.city == value) {
          itemSecondary.add(data);
        }
      }
      dataController.sink.add(itemSecondary);
    }
  }

  mockData() {
    return json.encode([
      {
        "nome": "Ambiente Gesso",
        "descricao":
            "A Ambiente Gesso foi constituída em 2015, com o objetivo de prestar serviços para a cidade de Guarapuava e região, na área de gesso acartonado (dry wall), steel frame, molduras, sancas, revestimentos, fachadas externas em cimentícia, xps e eps, isolamentos térmicos e acústicos e designer de ambientes.",
        "imagem":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3dIc7U_-Iyigiimf3WAZjnr0RWr8da4JyHzeKckVRZw&s",
        "cidade": "Guarapuava"
      },
      {
        "nome": "Dallak Home",
        "descricao": "Loja especializada em decoração",
        "imagem":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0nn91S86VLzl8uMUOAS94TNC6XliULDbR2aCT5u_WTg&s",
        "cidade": "Guarapuava"
      },
      {
        "nome": "Espaço Das Tintas",
        "descricao":
            "Somos uma loja tradicionalmente Guarapuavana, que tem como essência o cuidado com a qualidade dos produtos vendidos. Colocamos amor em tudo o que fazemos e demontramos ele através do nosso atendimento, que é personalizado e focado em ajudar com as melhores soluções em tintas. Possuímos uma variedade de cores das melhores marcas, possibilitando liberdade na hora de escolher a cor, deixando sua experiência ainda melhor e mais distinta!",
        "imagem":
            "https://tintasespacodastintas.com.br/wp-content/uploads/2021/08/Group-236.jpg",
        "cidade": "Guarapuava"
      },
      {
        "nome": "Ferropar",
        "descricao": "Ferro, aço telha termoacústica.",
        "imagem":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSiqbo3abIOWZW7ZQNQPD6g8lu4JM_79Q7VzTVKVTwO9w&s",
        "cidade": "Guarapuava"
      },
      {
        "nome": "Construtora Gutierrez",
        "descricao":
            "Somos uma construtora Iratiense, com sede em Guarapuava. Atuamos no desenvolvimento e construção de empreendimentos imobiliários e industriais.",
        "imagem":
            "https://media.licdn.com/dms/image/C4D0BAQFHrzaB5gaDoQ/company-logo_200_200/0/1596114415106?e=2147483647&v=beta&t=UeMZAEhMApJkuxcKyG96CnYDvOu2UQmEFJbJMNSoIkg",
        "cidade": "Guarapuava"
      },
      {
        "nome": "HR Pisos",
        "descricao":
            "Possuimos um amplo Show room de pisos em nossa loja. Faça-nos uma visita e conheça mais os produtos e serviços que oferecemos, temos certeza que aqui irá encontrar o piso perfeito para o seu ambiente.",
        "imagem":
            "https://hrpisos.com.br/wp-content/uploads/2021/06/cropped-cropped-hr_pisos_marca_RPNG-1.png",
        "cidade": "Guarapuava"
      },
      {
        "nome": "Kazza acabamentos",
        "descricao":
            "Loja especializada em materiais de construção e acabamentos",
        "imagem":
            "https://d3p2amk7tvag7f.cloudfront.net/pdvs/8830f6c2fbd41b1673cb33041ab34a1cb3ae030d.jpg",
        "cidade": "Guarapuava"
      },
      {
        "nome": "Montello",
        "descricao":
            "Projetamos o ambiente dos seus sonhos, com fabricação própria dos móveis e a garantia de prazo e qualidade para você!",
        "imagem":
            "https://montelloguarapuava.com/wp-content/uploads/2022/10/Montello-Dourado-1-1.png",
        "cidade": "Guarapuava"
      },
      {
        "nome": "Raltec Energia Solar",
        "descricao":
            "A Raltec desenvolve sistemas conectados a rede pública, permitindo a redução do consumo e do valor pago às distribuidoras. Além disso, a geração excedentepode ser comercializada com a rede.",
        "imagem": "https://i.ytimg.com/vi/or7nVF8pv_Y/hqdefault.jpg",
        "cidade": "Guarapuava"
      },
      {
        "nome": "Splash",
        "descricao": "Splash Piscinas",
        "imagem":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrma_t27QwpVYUBCjt8_PWpORT8DrFldH0qX85VjLjvlv2ms2cNt_Gu0PMecYY12IzTAA&usqp=CAU",
        "cidade": "Guarapuava"
      },
      {
        "nome": "Vidrocor",
        "descricao":
            "A Vidrocor é sinônimo de qualidade, resistência e beleza,Há mais de 8 anos no mercado trazendo o que há melhor e mais moderno do setor vidreiro.Nossas esquadrias possuem um excelente acabamento e são fabricadas sob medida para cada cliente, garantindo assim um resultado exclusivo e personalizado. Com atendimento personalizado, para entender melhor sua necessidade e projeto. Surpreenda-se com a qualidade e o bom atendimento.",
        "imagem": "https://i.ytimg.com/vi/7VMFNej7a3o/mqdefault.jpg",
        "cidade": "Guarapuava"
      }
    ]);
  }
}
