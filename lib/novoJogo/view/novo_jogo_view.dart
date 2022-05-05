import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tres_x_tres_project/novoJogo/controller/novo_jogo_controller.dart';
import 'package:tres_x_tres_project/widgets/custom_container.dart';
import 'package:tres_x_tres_project/widgets/custom_scaffold.dart';

class NovoJogoView extends StatelessWidget {
  NovoJogoView({Key? key}) : super(key: key);

  var ct = Get.put(NovoJogoController());

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Novo Jogo',
      body: SingleChildScrollView(
        child: CustomContainer(
          child: Column(
            children: [
              Obx(
                () => ct.jogadores.isNotEmpty
                    ? DropdownSearch.multiSelection(
                        mode: Mode.DIALOG,
                        showSelectedItems: false,
                        dropdownSearchDecoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x5fee6730),
                              width: 2,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 2,
                            ),
                          ),
                          errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffff1111),
                              width: 2,
                            ),
                          ),
                          focusedErrorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffff1111),
                              width: 2,
                            ),
                          ),
                          label: const Text('Selecione o time 1'),
                          labelStyle: const TextStyle(
                            color: Color(0x5fee6730),
                          ),
                        ),
                        popupBackgroundColor: Color.fromARGB(255, 54, 47, 44),
                        showSearchBox: true,
                        items: ct.jogadores,
                      )
                    : const Center(
                        child: null,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
