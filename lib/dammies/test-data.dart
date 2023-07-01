import 'package:flutter/material.dart';

List sections = [
  // Livestock
  {
    "name": "Livestock",
    "description": "Management of all livestock information",
    "icon": Icons.fence,
    "subsections": [
      {
        "name": "Feed Record",
        "description": "Management of all animal feeds",
        "subsections": [
          {"name": "Feed management"},
          {"name": "Livestock Management"},
          {"name": "Reporting"},
          {"name": "Alerts and Notifications"}
        ]
      },
      {
        "name": "Health Management",
        "description": "Tracking, monitoring and recording animal health",
        "subsections": [
          {"name": "Livestock management"},
          {"name": "Health Records"},
          {"name": "Health Monitoring"},
          {"name": "Reporting"},
          {"name": "Alerts and Notifications"}
        ]
      },
      {
        "name": "Breeding",
        "description": "Management of animal breed records",
        "subsections": [
          {"name": "Animal record"},
          {"name": "Breeding management"},
          {"name": "Reporting"},
          {"name": "Alerts and Notifications"}
        ]
      },
      {
        "name": "Animal Weight",
        "description": "Tracking and Recording of Animal weight",
        "subsections": [
          {"name": "Animal Record"},
          {"name": "Weight management"},
          {"name": "Analytics"},
          {"name": "Reporting"},
          {"name": "Alerts and Notifications"}
        ]
      },
    ]
  },
// Crops
  {
    "name": "Crops",
    "description": "Management of all crops information",
    "icon": Icons.forest,
    "subsections": [
      {
        "name": "Planning",
        "description": "Planning of crops for the whole process of planting",
        "subsections": [
          {"name": "Crop Management"},
          {"name": "Field Management"},
          {"name": "Weather Tracking"},
          {"name": "Reporting"},
          {"name": "Alerts and notifications"}
        ]
      },
      {
        "name": "Harvesting",
        "description": "All harvesting Events",
        "subsections": [
          {"name": "Planning"},
          {"name": "Crop Tracking"},
          {"name": "Equipment management"},
          {"name": "Labor Management"},
          {"name": "Reporting"},
          {"name": "Alerts and Notifications"}
        ]
      },
      {
        "name": "Irrigation",
        "description": "All irrigation activities and events",
        "subsections": [
          {"name": "Scheduling"},
          {"name": "Water tracking"},
          {"name": "Reporting"},
          {'name': "Alerts and Notifications"}
        ]
      }
    ]
  },
// Inventory
  {
    "name": "Inventory",
    "description":
        "Management of all inventory information regarding everything in the farm",
    "icon": Icons.inventory,
    "subsections": [
      {
        "name": "Seed",
        "description": "Inventory for seeds",
        "subsections": [
          {"name": "Seed record"},
          {"name": "Ordering and Purchasing"},
          {"name": "Inventory Management"},
          {"name": "Reporting"},
          {"name": "Alerts and notifications"}
        ]
      },
      {
        "name": "Fertilizer",
        "description": "Inventory for fertilizer",
        "subsections": [
          {"name": "Fertilizer Record"},
          {"name": "Inventory Management"},
          {"name": "Ordering and Purchasing"},
          {"name": "Reporting"},
          {"name": "Alerts and Notifications"}
        ]
      },
      {
        "name": "Equipments",
        "description": "Inventory for equipmennts",
        "subsections": [
          {"name": "Equipments record"},
          {"name": "Inventory management"},
          {"name": "Ordering and purchasing"},
          {"name": "Maintenance and repair"},
          {"name": "Reporting"},
          {"name": "Alerts and notifications"}
        ]
      }
    ]
  },
// Finance
  {
    "name": "Finance",
    "description": "Management of all financial information in the farm",
    "icon": Icons.credit_card,
    "subsections": [
      {
        "name": "Expenses",
        "description": "Tracking of expenses and more calculations",
        "subsections": [
          {"name": "Expense record"},
          {"name": "Expense tracking"},
          {"name": "Payment management"},
          {"name": "Reporting and analysis"},
          {"name": "Alerts and notifications"}
        ]
      },
      {
        "name": "Revenue",
        "description": "Tracking of revenue and more other calculations",
        "subsections": [
          {'name': "Sales record"},
          {"name": "Revenue tracking"},
          {"name": "Payment management"},
          {"name": "Reporting and analysis"},
          {"name": "Alerts and notifications"}
        ]
      },
      {
        "name": "Profit",
        "description": "Tracking of profits made over time",
        "subsections": [
          {"name": "Revenue tracking"},
          {"name": "Expense tracking"},
          {"name": "Profit calculation"},
          {"name": "Reporting and analysis"},
          {"name": "Alerts and notitfications"}
        ]
      }
    ]
  },
// Pest and Disease
  {
    "name": "Pest and Disease",
    "description":
        "Tracking pest and diseases and more information on both plants and livestock",
    "icon": Icons.mouse,
    "subsections": [
      {
        "name": "Tracking",
        "description": "Tracking of pest and diseases",
        "subsections": [
          {"name": "Pest and Diseases"},
          {"name": "Identification tools"},
          {"name": "Monitoring and Tracking"},
          {"name": "Response and control"},
          {"name": "Reporting and analysis"},
          {"name": "Alerts and notifications"}
        ]
      },
      {
        "name": "Prevention and Treatment",
        "description":
            "Detailed information of prevention and treatment of pest and diseases",
        "subsections": [
          {"name": "Education and Training"},
          {"name": "Prevention and Biosecurity"},
          {"name": "Eraly Detection"},
          {"name": "Record Keeping"},
          {"name": "Pest and Disease management"},
          {"name": "Reporting and Analysis"},
          {"name": "Alerts and Notifications"}
        ]
      }
    ]
  },
// Equipments
  {
    "name": "Equipments",
    "description": "Management of information regarding all farm equipments",
    "icon": Icons.settings,
    "subsections": [
      {
        "name": "Maintenance",
        "description": "Maintenance of all farm equipments",
        "subsections": [
          {"name": "Equipment list"},
          {"name": "Maintenance schedule"},
          {"name": "Maintenance record"},
          {"name": "Equipment Inspections"},
          {"name": "Parts inventory"},
          {"name": "Work orders"},
          {"name": "Equipment tracking"},
          {"name": "Reporting"},
          {"name": "Alerts and notifications"}
        ]
      },
      {
        "name": "Usage",
        "description": "Information about usage of the famr equipments",
        "subsections": [
          {"name": "Equipment Tracking"},
          {"name": "Reservation"},
          {"name": "Utilization"},
          {"name": "Reporting"},
          {"name": "Alerts and notification"},
          {"name": "Cost tracking"},
          {"name": "GPS tracking"},
        ]
      },
    ]
  },
// Yield analysis and forecasting
  {
    "name": "Yield analysis and Forecasting",
    "description": "Analysing and forecasting yields on all farm products",
    "icon": Icons.analytics,
    "subsections": [
      {
        "name": "Data collection",
        "description": "Collection of yields data",
        "subsections": []
      },
      {
        "name": "Analysis and Visualization",
        "description": "Analysis of the yields",
        "subsections": []
      },
      {
        "name": "Historical data",
        "description": "History of the yields",
        "subsections": []
      },
      {
        "name": "Yield Forecasting",
        "description": "Forecasting the yield based on given information",
        "subsections": []
      },
      {
        "name": "Risk assessment",
        "description": "Assessing the risks encounter... crop yields ",
        "subsections": []
      },
      {
        "name": "Reporting",
        "description": "Yields reports generated as pdf, csv or excel",
        "subsections": []
      }
    ]
  },
//User management
  {
    "name": "User Management",
    "description": "Management of all users of the system",
    "icon": Icons.people,
    "subsections": [
      {
        "name": "Users",
        "description":
            "The user list is the main view of the user management component, where users can be viewed, searched, and filtered based on different criteria such as name, email, or role. The user list should be presented in a table format and allow users to perform basic actions like sorting, filtering, and paging.",
        "subsections": []
      },
      {
        "name": "User Details",
        "description":
            "When a user is selected from the user list, the user details page should provide more information about the user, including their personal information, permissions, and access levels. This page should also allow administrators to modify user details, such as their name, email address, and password.",
        "subsections": []
      },
      {
        "name": "Role management",
        "descripton":
            "Many applications use roles to manage user permissions and access levels. The role management section should allow administrators to create, edit, and delete roles, as well as assign roles to users.",
        "subsections": []
      },
  
      {
        "name": "User creation",
        "description":
            "The user creation page should allow administrators to create new user accounts, including entering personal information and assigning roles and permission",
        "subsections": []
      },
      {
        "name": "Activity Logs",
        "descripton":
            "An activity log can be included to track user activity and changes made to user accounts by administrators.",
        "subsections": []
      }
    ]
  },
];
