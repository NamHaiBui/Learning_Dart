# Extensions

## The magic of extensions

- They make the results very fluid.
- You can add an extension on an existing class to bring in more functionality, enumarations, etc..
- It is a very natural thing to do with existing data.

`
extension [name of the extension] on [type]
`

### Without extensions

- In order to bring in more functionality, you would have to create a class (global) function that takes an instance of the other class and produce something new or do work as an async class.

## Using extensions

### Typing

-For generic typing, you will need to set a name for the extension to initilize the generic type

### Extension Override

- When you have extensions on the same type with the same name, you can set the name for the extension and use the extension of your choice.
`[name of extension]([type that the extension extend on ]).[extension]`
