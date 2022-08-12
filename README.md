# remove-attribute-from-json
Remove attribute from JSON object if key exists and return resulting JSON (Custom Variable Template for Server-Side Google Tag Manager).

### Purpose
To remove PII from JSON objects and deduplicate/format.

## Using the Variable Template
Create a new variable with this template. Choose a variable as input that holds an array or JSON object like "items" from event data or an extracted JSON string from a request parameter. Then type in the name of the attribute that you would like to remove from the JSON object. 

The variable will remove the attribute (if it exists) and returns the altered JSON object. 

### Parameters
Name | Description
------------ | -------------
JSON Object | Variable containing JSON object or valid JSON string.
Name of attribute to remove | If attribute with this name is found in the JSON object, it will be removed and a new JSON object without the specified attribute will be returned. 

## General Example
If the input consists of the following object or the corresponding JSON string:

```
{
  name: "keane",
  features-and-qualities: [
    "brown-eyes",
    "brown-hair",
    "20-years-old"
  ],
  height: [5, 10]
  age: 20
}
```
... then the following key variables will remove the corresponding properties:

Key | Removed 
------------ | -------------
name | name: "keane"
features-and-qualities | features-and-qualities: ["brown-eyes","brown-hair","20-years-old"]
height | height: [5, 10]
age | age: 20

# Example I
JSON Object: *JSON object from previous example*

Name of attribute to remove: *features-and-qualities*

Expected JSON object returned:
```
{
  name: "keane",
  height: [5, 10],
  age: 20
}
```

# Example II
JSON Object: *JSON object from previous example*

Name of attribute to remove: *name*

Expected JSON object returned:
```
{
  features-and-qualities: [
    "brown-eyes",
    "brown-hair",
    "20-years-old"
  ],
  height: [5, 10],
  age: 20
}
```

# Example III
JSON Object: *JSON object from previous example*

Name of attribute to remove: *name*

Expected JSON object returned:
```
{
  name: "keane",
  features-and-qualities: [
    "brown-eyes",
    "brown-hair",
    "20-years-old"
  ],
  height: [5, 10]
}
```
