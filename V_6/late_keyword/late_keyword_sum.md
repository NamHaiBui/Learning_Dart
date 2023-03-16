# Late Keyword

## Overview

- `late` variables are initialized when it is first used.
- `late` variables can be left empty and be assigned later on.
- Format: `late [Data Type] [name]`
- The keyword tells dart that the variable will definitely be assigned a value before using it.
- throw Exception: LateInitializationError
- When adhering to the contract, the `late` variable seems to act  similar to any type other keyword

![Code](![image.png])
![Result](image.png)
## Why do we use the `late` keyword?

- For normal variables, when you assign the value to the variables, they will grab the content of the value and place it inside of them.
- However, for `late` variables, they resolve themselves, the values that is placed in them only when they are used.

## When using in a class

- Won't cause any error if it is not being given any value.
- `late` properties are not resolved even at the point of constructing an instance of the class.
- `late` variables will only resolved when they are first used.
- There exist some exception to this cases.

## Note

- Initialization of a `late` variable will only happen the first time the variable is used.
- You cannot have non-late properties be dependent on properties with the late keyword `late`

## `late final` variable

- Has to follow the format `late final`
- You can only assign a value to the `late final` variable once
- If failed to oblige, LateInitializationError will be thrown.

## Common pitfall

- Note that late variables are not resolved until they are first used. Hence, you can have late variables be dependent on other late variables making a late hierarchy. However, when you use such variables, the `late` variables that they are dependant on will also be called. Hence, if not assigned any value will cause an error (LateInitialization Error)
- You should not write code that based on a contract that it is unknown whether it will be fulfilled

## Initializing late variable

- try to avoid using try and catch. Make sure that the late variables are assigned and not be in any mental gymnastic. If you are in one, then `late` variables are not the right choice.

## Assigning late variables to non-late variable

- Non-late variables are required to be assigned a value immediately after creation while it is not required for `late` variable.
- Hence, you can assign late variable to non-late variable of which is equivalent to using the late variable, resolving it.

## Avoiding Constructor Initialization of Late Variables

- When you assign late variable a value in the constructor, they will be resolved immediately upon construction of the class even if you are not using them.

![CorrectFormat](image.png)
![WrongFormat](image.png)

### If you are feeling like you are doing mental gymnastic with late variables then don't avoid using them and use nullable values, or try to learn to understand it fully
