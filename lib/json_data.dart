class Jsondata {
  static Map<String, dynamic> dataScreenContact = {
    "Title": "My Contact List",
    "WidgetName": "ContactWidget",
    "Panels": [
      {
        "PanelName": "ContactSearchPanel",
        "LayoutFormat": "Form",
        "Fields": [
          {
            "FieldName": "PHONE_NUMBER",
            "FieldLabel": "Phone Number",
            "InputType": "InputText",
            "DisplayPosition": "0,0"
          },
          {
            "FieldName": "STATUS",
            "FieldLabel": "Status",
            "InputType": "Dropdown",
            "DisplayPosition": "0,1",
            "ListOfValues": [
              {"Value": "ACTIVE", "Text": "Aktif"},
              {"Value": "INACTIVE", "Text": "Non Aktif"}
            ]
          }
        ],
        "Buttons": [
          {
            "ButtonName": "Search",
            "ButtonLabel": "Search",
            "ButtonWidth": 100,
            "ButtonAlignment": "right"
          },
        ]
      },
      {
        "PanelName": "ContactTable",
        "LayoutFormat": "Table",
        "Fields": [
          {"FieldName": "FULL_NAME", "FieldLabel": "Full Name"},
          {"FieldName": "EMAIL", "FieldLabel": "Email"},
          {"FieldName": "PHONE_NUMBER", "FieldLabel": "Phone Number"}
        ],
        "RowsTable": [
          ["name 1", "email 1", "phone 1"],
          ["name 2", "email 2", "phone 2"],
          ["name 3", "email 3", "phone 3"],
          ["name 4", "email 4", "phone 4"],
          ["name 5", "email 5", "phone 5"],
          ["name 6", "email 6", "phone 6"],
          ["name 7", "email 7", "phone 7"],
          ["name 8", "email 8", "phone 8"],
          ["name 9", "email 9", "phone 9"],
          ["name 10", "email 10", "phone 10"],
        ]
      }
    ],
  };
}
