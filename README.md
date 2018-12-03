Running the solutions
---------------------

You will need a D compiler.
In Arch Linux,
you can install the package group `dlang-dmd`,
which will give you the `dmd` binary.

Most solutions are written
to be run either like

```
cat input.txt | dmd -run solution.d
```

or like

```
dmd solution.d other.d modules.d
cat input.txt | ./solution
```

for solutions requiring multiple files.

This should print the correct answer on the console.
