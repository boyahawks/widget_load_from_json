part of "./widget.dart";

class FormWidget extends StatelessWidget {
  final Panel dataWidget;
  FormWidget({
    Key? key,
    required this.dataWidget,
  }) : super(key: key);

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    List<TextEditingController> controllerTextField =
        dataWidget.fields.map((e) => TextEditingController()).toList();
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          listFormTextField(dataWidget.fields, controllerTextField),
          const SizedBox(
            height: 16.0,
          ),
          dataWidget.buttons == null
              ? const SizedBox()
              : SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: listButtons(dataWidget.buttons!)),
                ),
        ],
      ),
    );
  }

  Widget listFormTextField(
      List<Field> dataTextField, List<TextEditingController> listController) {
    return ListView.builder(
        itemCount: dataTextField.length,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          String keyboardType = dataTextField[index].inputType ?? "";
          String title = dataTextField[index].fieldLabel;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 16.0,
              ),
              keyboardType == "Dropdown"
                  ? _dropDownField(dataTextField[index].listOfValues!)
                  : TextFieldMain(
                      controller: listController[index],
                      hintText: title,
                      keyboardType: keyboardType.isNotEmpty
                          ? checkInputType(keyboardType)
                          : TextInputType.text,
                      colorRadius: Colors.grey,
                      colorRadiusFocus: Colors.grey,
                      horizontalPadContent: 20,
                    ),
              const SizedBox(
                height: 16.0,
              ),
            ],
          );
        });
  }

  TextInputType checkInputType(String type) => type == "InputText"
      ? TextInputType.text
      : type == "InputNumber"
          ? TextInputType.number
          : type == "InputPhone"
              ? TextInputType.phone
              : TextInputType.none;

  Widget _dropDownField(List<ListOfValue> valueDropdown) {
    String selectedValue = valueDropdown.first.value;
    return StatefulBuilder(builder: (context, setState) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: DropdownButton(
            value: selectedValue,
            hint: const Text("Status"),
            isExpanded: true,
            underline: Container(),
            items: valueDropdown.map((value) {
              return DropdownMenuItem<String>(
                value: value.value,
                child: Text(value.text),
              );
            }).toList(),
            onChanged: (String? newValue) {
              if (newValue != null) {
                setState(() => selectedValue = newValue);
              }
            }),
      );
    });
  }

  Widget listButtons(List<Button> dataButton) {
    return ListView.builder(
        itemCount: dataButton.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          String titleButton = dataButton[index].buttonLabel;
          double widthButton = dataButton[index].buttonWidth.toDouble();
          return Container(
            height: 50,
            width: widthButton,
            margin: const EdgeInsets.only(right: 8.0),
            child: TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                  overlayColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.hovered)) {
                        return Colors.blue.withOpacity(0.04);
                      }
                      if (states.contains(MaterialState.focused) ||
                          states.contains(MaterialState.pressed)) {
                        return Colors.blue.withOpacity(0.12);
                      }
                      return null;
                    },
                  ),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                ),
                onPressed: () {},
                child: TextLabel(
                  text: titleButton,
                  color: Colors.white,
                )),
          );
        });
  }
}
