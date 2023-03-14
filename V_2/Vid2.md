# Video 2

## Create dart project

- Use `dart create -t console [name]` in the space that your want to create the dart project in.

### What is in the dart project?

- bin(binary for some reasons): where the source file resides
- lib(library): library resources folder
- test: default test precreated

### Running the .dart file

- Option 1: Using `dart [file path]`
- Option 2 (with fswatch): `fswatch -o bin/ | xargs -n1 -I{} sh -c 'clear; dart [file path]'`

## Data Variables and Data Types

### Keywords

- **`const`**: is a keyword for a variable that cannot be changed. You can't make any modification to the const variable anywhere else in the code. In doing so would cause a Compiler Error.
- **`final`**: is a keyword for a variable that cannot be reassigned. Different to **`const`**, you can make alterations to the variable as long as it is not being reassigned.
- **`var`**: is a keyword for a variable that can be modified iternally and can be reassigned.

#### *To note*

- **`const`** value can be assigned to final variables. However, not the other way around.
- **`const`** can only be assigned a constant value.
- **`late`**: is a keyword used along side other dynamic keywords in the format `late [dynamic keyword]`. Variables with this keyword will only be initialized when used. (Initialization will only happens once)

- You will need to have a convention when initializing data such as using `[dynamic keyword] [static data type]` or `[static data type]` or `[dynamic keyword]`

- dart can warn you when you are not adhering to the convention that you are using in the code by setting:
`linter:
        rules:
        - always_specify_types`
in analysis_options.yaml file.

- Data Type Promotion happens when you are casting a variable of a higher level over a variable of a lower level such as double to int. You cannot directly demote variables.

- Naming Convention: lowercase word connecting with next word through uppercasing the first letter of the next word (`yourName`)

### Commenting

`///` will automatically comment out the next line when ascending
`//` does not
`//` at the start of the file will notify the coder of the special ignoring configuration of the file.

### Data Types

Dart can dynamically detect the data type of the variable created via keywords (const, final, var). However, you can also assign the data type yourself and have it as static. When you assign a statically set variable to a variable created through dynamic keywords, dart will assign the static data type to the variable.

You can also specify both data type and variable constraint when initialling variables.

- **`int`**: whole number with no percision value
- **`double`** : whole number with precision value
- **`String`** : text value
- **`bool`**: `true` or `false` value. You can use `!` at the beginning to flip the value (`true` to `false`)
- **`List<Data Type> name = []`**: a collection of values of the assigned data type.
- **`Map<Data Type, Data Type> name = {}`**: a key:value collection (dictionary in Python, HashMap)
- **`Set<Data Type> name = {}`**: a collection of values of the assigned data type that does not allows duplicate values.
- **`dynamic`**: dynamically detect the assigned data type.
- **`Symbol`**: refer to another variable or function and extract it as its own data type.
