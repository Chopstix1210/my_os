Uses the **GCC** compiler 

The code we will use, will make use of 

`__attribute__((packed))`

- This attribute allows us to ensure that the compiler uses a memory layout for a struct exactly as we define it in the code
- Due to this attribute, it might be hard to compile C using any other compiler than GCC 
To compile [[Assembly Code]] we will be using NASM as the assembler