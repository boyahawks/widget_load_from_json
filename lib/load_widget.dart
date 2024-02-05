import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget_from_json/json_data.dart';
import 'package:widget_from_json/model.dart';
import 'package:widget_from_json/widgets/widget.dart';

class LoadWidget extends StatefulWidget {
  const LoadWidget({super.key});

  @override
  _LoadWidgetState createState() => _LoadWidgetState();
}

class LoadWidgetController extends GetxController {
  Rx<LoadWidgetModel> listJsonWidget =
      LoadWidgetModel(title: "", widgetName: "", panels: []).obs;

  Future<void> initData() async {
    listJsonWidget.value = LoadWidgetModel.fromJson(Jsondata.dataScreenContact);
    listJsonWidget.refresh();
  }
}

class _LoadWidgetState extends State<LoadWidget> {
  LoadWidgetController controller = Get.put(LoadWidgetController());

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    controller.initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => MainScaffold(
          type: "appbar",
          avoidButtomInset: true,
          styleAppbar: 4,
          appbarTitle: controller.listJsonWidget.value.title,
          colorBackground: Colors.white,
          returnOnWillpop: false,
          colorSafeArea: Colors.white,
          content: controller.listJsonWidget.value.panels.isNotEmpty
              ? _loadListWidget()
              : const Center(
                  child: TextLabel(text: "Load Widget Proses"),
                )),
    );
  }

  Widget _loadListWidget() {
    return ListView.builder(
        itemCount: controller.listJsonWidget.value.panels.length,
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          String codeWidget =
              controller.listJsonWidget.value.panels[index].layoutFormat;

          return Padding(
              padding: const EdgeInsets.only(
                  top: 16.0, bottom: 30, left: 16.0, right: 16.0),
              child: codeWidget == "Form"
                  ? FormWidget(
                      dataWidget: controller.listJsonWidget.value.panels[index],
                    )
                  : codeWidget == "Table"
                      ? TableWidget(
                          dataWidget:
                              controller.listJsonWidget.value.panels[index],
                        )
                      : const SizedBox());
        });
  }
}
