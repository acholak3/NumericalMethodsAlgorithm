# FalsePosition

This file contains the matlab script that finds
the roots of a function using the false position
technique.

## INPUTS

* func - the function being evaluated
* xl - the upper guess
* xu - the upper guess
* es - the desired relative error (default is 0.0001%)
* maxiter - the number of iterations desired (default is 200)
## OUTPUTS

* root - the estimated root location
* fx - the function evaluated at the root location
* ea - the approximate relative error (%)
* iter - how many iterations were performed

