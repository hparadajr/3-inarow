# 3‑in‑a‑Row

The 3-in-a-Row puzzle is a logic-based color-placement puzzle on an N × N grid (N is even). Some cells are pre-colored blue or white; others are empty. We want to color all empty cells so that:

- Each row and each column has exactly N/2 white cells and N/2 blue cells, and no row or column contains 3 consecutive cells of the same color.

Problem statement
-----------------
Solve the 8×8 puzzle below (gray cells are empty; some cells are pre-colored blue or white). Use AMPL and the provided IP model to find a filling that satisfies the rules.

Recreated input figure (text drawing)
------------------------------------
Legend: B = pre-colored blue cell, W = pre-colored white cell, . = empty (gray)

```
     C1 C2 C3 C4 C5 C6 C7 C8
R1 |  .  W  .  .  B  .  .  .
R2 |  .  W  W  .  .  .  .  W
R3 |  .  .  .  .  B  .  .  .
R4 |  .  .  W  .  .  .  W  .
R5 |  .  .  .  .  B  B  .  .
R6 |  .  .  .  .  .  .  .  .
R7 |  W  W  .  .  .  .  .  W
R8 |  .  .  .  .  .  .  .  .
```

(Where “.” is an initially empty/gray cell, “W” is a pre-colored white cell, and “B” is a pre-colored blue cell.)

How the model works (brief)
--------------------------
- Binary variable x[i,j] indicates color: x = 1 means blue, x = 0 means white.
- Pre-colored blue cells b[i,j] force x[i,j] = 1 
- Pre-colored white cells w[i,j] force x[i,j] = 0 
- Every row and column must contain exactly N/2 blue cells 
- For every run of n consecutive cells in any row or column (n = 3 here), at most n-1 of them can be all blue and at most n-1 can be all white
- Objective is to maximize 0 since this is a feasibility IP.

How to run (AMPL)
------------------
1. Select a solver (I used gurobi) in AMPL:
   ampl: option solver gurobi;

2. Load the model and data and solve:
   ampl: model modelfile.mod;
   ampl: data datafile.dat;
   ampl: solve;

3. Display the solution:
   ampl: display x;

Solution explanation (new section)
---------------------------------
What the solver output means:
- The displayed matrix x[i,j] is the puzzle solved. Each entry is 1 (blue) or 0 (white).
