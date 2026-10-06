# isAutomorphic

## Task:
You have to create a function `isAutomorphic` to check whether the argument passed is an Automorphic Number and return true if it is & false otherwise.

### Description:

`Automorphic Number` - An automorphic number is a number whose square "ends" in the same digits as the number itself.

> The first few Automorphic Numbers are - 1, 5, 6, 25, 76, 376...

### Explanation:
    
      1^2 = 1      // ∴  1 is an Automorphic Number
      5^2 = 25     // ∴  5 is an Automorphic Number
      6^2 = 36     // ∴  6 is an Automorphic Number
     25^2 = 625    // ∴ 25 is an Automorphic Number
     76^2 = 5776   // ∴ 76 is an Automorphic Number
    376^2 = 141376 // ∴ 376 is an Automorphic Number

Example:
- `isAutomorphic(1) == True`

Implement `isAutomorphic(num: int) -> bool`.
