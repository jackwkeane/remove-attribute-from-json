# remove-attribute-from-json
Remove key from JSON object if key exists and return resulting JSON (Custom Variable Template for Server-Side Google Tag Manager).

## using the variable template
Create a new variable with this template. Choose a variable as input that holds an array or JSON object like "items" from event data or an extracted JSON string from a request parameter. Then type in the key that you would like to remove from the JSON object. 

The variable will remove the key input (if neccessary) and returns the (changed) JSON object. 

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
  age: [20]
}
```
... then the following key variables will remove the corresponding properties:

Key | Removed 
------------ | -------------
name | name: "keane"
features-and-qualities | features-and-qualities: ["brown-eyes","brown-hair","20-years-old"]
age | age: [20]

# Example I
JSON Input: *JSON object from previous example*

Key: *features-and-qualities*

Expected JSON object returned:
```
{
  name: "keane",
  age: [20]
}
```

# Example II
JSON Input: *JSON object from previous example*

Key: *name*

Expected JSON object returned:
```
{
  features-and-qualities: [
    "brown-eyes",
    "brown-hair",
    "20-years-old"
  ],
  age: [20]
}
```

# Example III
JSON Input: *JSON object from previous example*

Key: *name*

Expected JSON object returned:
```
{
  name: "keane",
  features-and-qualities: [
    "brown-eyes",
    "brown-hair",
    "20-years-old"
  ]
}
```
