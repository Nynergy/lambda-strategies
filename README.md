# lambda-strategies

![alt text](https://github.com/Nynergy/lambda-strategies/blob/master/showcase.jpg?raw=true)

A simple TUI program written in Haskell with the [brick](https://github.com/jtdaugherty/brick) library. All it does is present the user with a single line of text in a bordered box. The line is randomly chosen from a text file provided to the program on the command line.

Inspired by the famous _[Oblique Strategies](https://en.wikipedia.org/wiki/Oblique_Strategies)_ cards created by Brian Eno and Peter Schmidt. The repo includes an example text file of strategies to use, which contains lines from the original _Oblique Strategies_ deck.

---------------------------------------------------------------------------------

## Installation

Use `stack` to install. The following code should be sufficient as long as your `~/.local/bin` directory is in your user `$PATH` variable. If this directory is not in your `$PATH`, you won't be able to run the program unless you give the absolute path every time you want to run it.

```
git clone https://github.com/Nynergy/lambda-strategies.git
cd lambda-strategies
stack build
stack install lambda-strategies
```

---------------------------------------------------------------------------------

## Usage

Using the program is simple. Once the binary has been placed somewhere where you can access it (if you followed the above directions then stack should have automatically placed it in your $PATH for you), you can invoke it with `strategies [FILEPATH]`, where `[FILEPATH]` is a path to the file you wish to draw your lines from.

For example, if you want to use the example file included in the repo, you would invoke the program with `strategies strategies.txt`.
