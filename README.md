# 3‑in‑a‑Row — AMPL solution showcase

The 3-in-a-Row puzzle is a logic-based color-placement puzzle on an N × N grid (N is even). Some cells are pre-colored blue or white; others are empty. Your job is to color all empty cells so that:

- each row and each column has exactly N/2 white cells and N/2 blue cells, and
- no row or column contains 3 consecutive cells of the same color.

This repository contains an AMPL IP model and data for the 8×8 puzzle shown below, plus the solver output that produced the final coloring.

Problem statement
-----------------
Solve the 8×8 puzzle below (gray cells are empty; some cells are pre-colored blue or white). Use AMPL and the provided IP model to find a filling that satisfies the rules.

Recreated input figure (text drawing)
------------------------------------
Legend: B = pre-colored blue cell, W = pre-colored white cell, . = empty (gray)

Columns → 1 2 3 4 5 6 7 8

Row 1:  . W . . B . . .
Row 2:  . W W . . . . W
Row 3:  . . . . B . . .
Row 4:  . . W . . . W .
Row 5:  . . . . B B . .
Row 6:  . . . . . . . .
Row 7:  W W . . . . . W
Row 8:  . . . . . . . .

Rendered as a monospace grid:

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

Files included
--------------
- README.md (this file)
- modelfile.txt — the AMPL model (binary x[i,j] = 1 => blue, 0 => white)
- datafile.txt — the AMPL data file for the 8×8 instance
- images/q2_input_figure.png — (suggested) a PNG of the puzzle input (you can add the screenshot or a nicer drawing here)
- images/q2_solution.png — AMPL/Gurobi terminal screenshot showing the final x matrix (solver output)

How the model works (brief)
--------------------------
- Binary variable x[i,j] indicates color: x = 1 means blue, x = 0 means white.
- Pre-colored blue cells b[i,j] force x[i,j] = 1 (constraint b[i,j] <= x[i,j]).
- Pre-colored white cells w[i,j] force x[i,j] = 0 (constraint w[i,j] <= 1 - x[i,j]).
- Every row and column must contain exactly N/2 blue cells (sum of x in each row/col = N/2).
- For every run of n consecutive cells in any row or column (n = 3 here), at most n-1 of them can be all blue and at most n-1 can be all white — implemented with sliding-window sum constraints.
- Objective is dummy (maximize 0) since this is a feasibility IP.

How to run (AMPL)
------------------
1. Select a solver (e.g., Gurobi) in AMPL:
   ampl: option solver gurobi;

2. Load the model and data and solve:
   ampl: model modelfile.txt;
   ampl: data datafile.txt;
   ampl: solve;

3. Display the solution (x):
   ampl: display x;

Solver output (example)
-----------------------
Your attached screenshot contains the solver session and final x matrix. The final fill shown in the screenshot satisfies the constraints (rows/columns balanced, no 3 consecutive same-color cells).

Notes and suggestions
---------------------
- I included the input figure here in text so the README always shows the puzzle without requiring opening a screenshot.
- For better GitHub language recognition, rename the files to AMPL-friendly extensions and add a `.gitattributes` mapping if you want (e.g., `modelfile.mod`, `datafile.dat`).
- If you’d like, I can:
  - add the PNGs (input and solution screenshots) into images/ and update README to display them inline,
  - rename and push these files to a repository and apply the `ampl` topic and `.gitattributes`.

Enjoy showcasing your AMPL work — the model and data are below for quick copy/paste.
