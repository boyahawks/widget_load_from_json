import 'dart:convert';

LoadWidgetModel loadWidgetModelFromJson(String str) =>
    LoadWidgetModel.fromJson(json.decode(str));

String loadWidgetModelToJson(LoadWidgetModel data) =>
    json.encode(data.toJson());

class LoadWidgetModel {
  String title;
  String widgetName;
  List<Panel> panels;

  LoadWidgetModel({
    required this.title,
    required this.widgetName,
    required this.panels,
  });

  factory LoadWidgetModel.fromJson(Map<String, dynamic> json) =>
      LoadWidgetModel(
        title: json["Title"],
        widgetName: json["WidgetName"],
        panels: List<Panel>.from(json["Panels"].map((x) => Panel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Title": title,
        "WidgetName": widgetName,
        "Panels": List<dynamic>.from(panels.map((x) => x.toJson())),
      };
}

class Panel {
  String panelName;
  String layoutFormat;
  List<Field> fields;
  List<Button>? buttons;
  List<List<String>>? rowsTable;

  Panel({
    required this.panelName,
    required this.layoutFormat,
    required this.fields,
    this.buttons,
    this.rowsTable,
  });

  factory Panel.fromJson(Map<String, dynamic> json) => Panel(
        panelName: json["PanelName"],
        layoutFormat: json["LayoutFormat"],
        fields: List<Field>.from(json["Fields"].map((x) => Field.fromJson(x))),
        buttons: json["Buttons"] == null
            ? []
            : List<Button>.from(
                json["Buttons"]!.map((x) => Button.fromJson(x))),
        rowsTable: json["RowsTable"],
      );

  Map<String, dynamic> toJson() => {
        "PanelName": panelName,
        "LayoutFormat": layoutFormat,
        "Fields": List<dynamic>.from(fields.map((x) => x.toJson())),
        "Buttons": buttons == null
            ? []
            : List<dynamic>.from(buttons!.map((x) => x.toJson())),
      };
}

class Button {
  String buttonName;
  String buttonLabel;
  int buttonWidth;
  String buttonAlignment;

  Button({
    required this.buttonName,
    required this.buttonLabel,
    required this.buttonWidth,
    required this.buttonAlignment,
  });

  factory Button.fromJson(Map<String, dynamic> json) => Button(
        buttonName: json["ButtonName"],
        buttonLabel: json["ButtonLabel"],
        buttonWidth: json["ButtonWidth"],
        buttonAlignment: json["ButtonAlignment"],
      );

  Map<String, dynamic> toJson() => {
        "ButtonName": buttonName,
        "ButtonLabel": buttonLabel,
        "ButtonWidth": buttonWidth,
        "ButtonAlignment": buttonAlignment,
      };
}

class Field {
  String fieldName;
  String fieldLabel;
  String? inputType;
  String? displayPosition;
  List<ListOfValue>? listOfValues;

  Field({
    required this.fieldName,
    required this.fieldLabel,
    this.inputType,
    this.displayPosition,
    this.listOfValues,
  });

  factory Field.fromJson(Map<String, dynamic> json) => Field(
        fieldName: json["FieldName"],
        fieldLabel: json["FieldLabel"],
        inputType: json["InputType"],
        displayPosition: json["DisplayPosition"],
        listOfValues: json["ListOfValues"] == null
            ? []
            : List<ListOfValue>.from(
                json["ListOfValues"]!.map((x) => ListOfValue.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "FieldName": fieldName,
        "FieldLabel": fieldLabel,
        "InputType": inputType,
        "DisplayPosition": displayPosition,
        "ListOfValues": listOfValues == null
            ? []
            : List<dynamic>.from(listOfValues!.map((x) => x.toJson())),
      };
}

class ListOfValue {
  String value;
  String text;

  ListOfValue({
    required this.value,
    required this.text,
  });

  factory ListOfValue.fromJson(Map<String, dynamic> json) => ListOfValue(
        value: json["Value"],
        text: json["Text"],
      );

  Map<String, dynamic> toJson() => {
        "Value": value,
        "Text": text,
      };
}
