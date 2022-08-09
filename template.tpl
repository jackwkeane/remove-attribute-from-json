___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Remove Attribute from JSON",
  "categories": [
    "UTILITY"
  ],
  "description": "Removes JSON property that matches the value of the specified key and returns JSON. Only works for JSON objects that properties only contain arrays or strings.",
  "containerContexts": [
    "SERVER"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "obj",
    "displayName": "JSON Object",
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ],
    "alwaysInSummary": true,
    "help": "Variable containing JSON object or valid JSON string."
  },
  {
    "type": "TEXT",
    "name": "exclude",
    "displayName": "Name of attribute to remove",
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ],
    "help": "If attribute with this name is found in the JSON object, it will be removed and a new JSON object without the specified attribute will be returned.",
    "alwaysInSummary": true
  }
]


___SANDBOXED_JS_FOR_SERVER___

const JSON = require('JSON');

var obj = data.obj|| {};
const exclude = data.exclude || ""; 

if (typeof(obj) != "string") obj = JSON.stringify(obj);

var keyToRemove = obj.charAt(obj.indexOf(exclude) -1) + exclude + obj.charAt(obj.indexOf(exclude) + exclude.length);
var keyStartIndex = obj.indexOf(keyToRemove);

var charBeforeSubstringToRemove = "";
var charAfterSubstringToRemove = "";
var substringToRemove = "";

if (keyStartIndex != -1) {
  var keyLength = keyToRemove.length;
  var valueStartIndex = keyStartIndex + keyLength + 1;
  
  if (obj.charAt(valueStartIndex) == '[') {
    
    var valueEndIndex = 
        keyStartIndex + keyLength + obj.substring(keyStartIndex + keyLength + 1).indexOf(']') + 2;
   
  } else if (obj.charAt(valueStartIndex) == '{') {
    
    var valueEndIndex = 
        keyStartIndex + keyLength + obj.substring(keyStartIndex + keyLength + 1).indexOf('}') + 2;

  } else if (obj.charAt(valueStartIndex) == '\"') {
    
    var valueEndIndex = 
        keyStartIndex + keyLength + obj.substring(keyStartIndex + keyLength + 3).indexOf('\"') + 4;

  } else if (!(obj.charAt(valueStartIndex)).isNaN()) {
    
    var valueEndIndex = valueStartIndex;

    while (!(obj.charAt(valueEndIndex)).isNaN() || obj.charAt(valueEndIndex) == '.' ) valueEndIndex++;

  }
  
  substringToRemove = obj.substring(keyStartIndex, valueEndIndex);
  
  charBeforeSubstringToRemove = obj.charAt(obj.indexOf(substringToRemove) - 1);
  charAfterSubstringToRemove = obj.charAt(obj.indexOf(substringToRemove) + substringToRemove.length);
  
  if (charBeforeSubstringToRemove == "," && charAfterSubstringToRemove == "," || 
      charBeforeSubstringToRemove == "," && charAfterSubstringToRemove == "}") {
    obj = obj.replace(',' + substringToRemove, '');
  } else if (charBeforeSubstringToRemove == "{" && charAfterSubstringToRemove == ",") {
    obj = obj.replace(substringToRemove + ",", '');
  }
}

obj = JSON.parse(obj);
return obj;


___TESTS___

scenarios: []


___NOTES___

Created on 19.9.2021, 00:58:59


