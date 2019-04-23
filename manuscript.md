---
author-meta:
- David R. Slochower
- Niel M. Henriksen
- John D. Chodera
- Michael K. Gilson
date-meta: '2019-04-23'
keywords:
- markdown
- publishing
- manubot
lang: en-US
title: Binding thermodynamics of host-guest systems with SMIRNOFF99Frosst from the
  Open Force Field Group
...






<small><em>
This manuscript
([permalink](https://slochower.github.io/smirnoff-host-guest-manuscript/v/ab335ac281fb9359efe40781e6eb85d0a31920e0/))
was automatically generated
from [slochower/smirnoff-host-guest-manuscript@ab335ac](https://github.com/slochower/smirnoff-host-guest-manuscript/tree/ab335ac281fb9359efe40781e6eb85d0a31920e0)
on April 23, 2019.
</em></small>

## Authors



+ **David R. Slochower**<br>
    ![ORCID icon](images/orcid.svg){.inline_icon}
    [0000-0003-3928-5050](https://orcid.org/0000-0003-3928-5050)
    · ![GitHub icon](images/github.svg){.inline_icon}
    [slochower](https://github.com/slochower)
    · ![Twitter icon](images/twitter.svg){.inline_icon}
    [drslochower](https://twitter.com/drslochower)<br>
  <small>
     Skaggs School of Pharmacy and Pharmaceutical Sciences, University of California, San Diego, La Jolla, CA 92093, USA
  </small>

+ **Niel M. Henriksen**<br>
    ![ORCID icon](images/orcid.svg){.inline_icon}
    [0000-0002-7916-0757](https://orcid.org/0000-0002-7916-0757)
    · ![GitHub icon](images/github.svg){.inline_icon}
    [nhenriksen](https://github.com/nhenriksen)<br>
  <small>
     Atomwise, Inc., San Francisco, CA 94105, USA
  </small>

+ **John D. Chodera**<br>
    ![ORCID icon](images/orcid.svg){.inline_icon}
    [0000-0003-0542-119X](https://orcid.org/0000-0003-0542-119X)
    · ![GitHub icon](images/github.svg){.inline_icon}
    [jchodera](https://github.com/jchodera)
    · ![Twitter icon](images/twitter.svg){.inline_icon}
    [jchodera](https://twitter.com/jchodera)<br>
  <small>
     Computational and Systems Biology Program, Sloan Kettering Institute, Memorial Sloan Kettering Cancer Center, New York, NY 10065
  </small>

+ **Michael K. Gilson**<br>
    ![ORCID icon](images/orcid.svg){.inline_icon}
    [0000-0002-3375-1738](https://orcid.org/0000-0002-3375-1738)
    · ![Twitter icon](images/twitter.svg){.inline_icon}
    [michaelkgilson](https://twitter.com/michaelkgilson)<br>
  <small>
     Skaggs School of Pharmacy and Pharmaceutical Sciences, University of California, San Diego, La Jolla, CA 92093, USA
  </small>


[Note, I only added authors who reviewed the outline on Google Docs. We can revisit this.]{.banner .lightgrey}


## Abstract {.page_break_before}

Designing ligands that bind their target with high affinity and specificity is a key step in small-molecule drug discovery. Yet accurate predictions of protein-ligand binding free energies are difficult and errors in the calculations can be traced to challenges adequately sampling conformational space, ambiguous protonation states, and other causes. Noncovalent complexes between a cavity-containing host molecule and drug-like guest molecules have emerged as powerful tools for modeling protein-ligand binding. Due to their small size and extensive experimental characterization, calculations of host-guest binding free energies, enthalpies, and entropies offer an opportunity to directly probe, and ultimately optimize, force fields.

The Open Force Field Initiative aims to create a modern, open software infrastructure for automatically generating and validating force fields using high-quality data sets. The first force field to arise out of this effort, named SMIRNOFF99Frosst, has one tenth the number of parameters of a typical general small molecule force field, such as GAFF, yet predicts binding thermodynamics that are on average, at least as accurate. Here, we report the results of free energy calculations on 43 α and β-cyclodextrin host-guest pairs for which experimental data are available. Our calculations were performed using the attach-pull-release method as implemented in the open source package, `pAPRika`. On binding free energies, the root mean square error of the predictions relative to experiment is 0.82 kcal/mol for SMIRNOFF99Frosst and 1.58 kcal/mol for GAFF version 2.1. These results suggest significant room for improvement in force fields, and will help create a transparent and robust method of evaluating future candidate parameter sets from the Open Force Field Group. Improving the performance of force fields for predicting binding affinities will help reduce the timescale and cost required to generate drug candidates.

## Introduction

Accurate predictions of protein-ligand binding free energies are a key goal of computational chemistry.
Despite this, calculations of protein-ligand binding thermodynamics involve a number of challenging choices, including specifying the protonation state of ionizable residues, adding hydrogens or otherwise adjusting the initial protein structure, and placing the ligand in the binding pocket, for which there is no consensus in the computational chemistry community.
Recently, calculations on the reversible work of ligand binding to bromodomain proteins was completed [@1CuDE1c2r], with deviations from experiment in the 1-2 kcal/mol range and uncertainties on the order of ~0.5 kcal/mol. 
Here, we report the calculation of binding free energies, enthalpies, and entropies of drug-like guest molecules to α- and β-cyclodextrin host molecules, converged to within ~0.1 kcal/mol, using the attach-pull-release method.
These calculations, which are easier to sample and have been experimentally characterized using a variety of methods, offer an opportunity to benchmark---and ultimately optimize---new and existing force fields.
We compare the predictions of three force fields: GAFF v1.7 [@YmRgHfeU], GAFF v2.1, and SMIRNOFF99Frosst [@1HYTTY1PU; @OhpH7vfg].

SMIRNOFF99Frosst, released in late 2018, is the first force field produced by the Open Force Field Initiative.
SMIRNOFF99Frosst is derived from AMBER parm99 [@13wrQoS3l] and Merck's parm@Frosst [@168lWg0SB].
Instead of relying on atom types to assign force field parameters to compounds, which is the procedure followed by the `tleap` program that parameterizes molecules in AmberTools, SMIRNOFF99Frosst and the Open Force Field Toolkit use the local chemical environment of each atom to apply force field parameters using SMIRKS strings [@pOsXFMux].
This process simplifies and effectively uncouples the parameters for each term in the force field.
That is, the addition of a new Lennard-Jones parameter does not require the addition of new bonded, angle, and dihedral parameters involving the same atom. 
These factors lead to a much more lean force field specification; there are over 3000 lines of parameters in GAFF v1.7, over 6000 lines of parameters in GAFF v2.1, and just ~300 parameters in SMIRNOFF99Frosst version 1.0.5.

Thus far, SMIRNOFF99Frosst has been tested on hydration free energies of 642 small molecules, and the densities and dielectric constants of 45 pure organic liquids [@1HYTTY1PU].
Here we benchmark SMIRNOFF99Frosst using noncovalent binding thermodynamics using two flexible host molecules and thirty three guests containing three different functional group moieties.
We first show that SMIRNOFF99Frosst does about as well as the conventional force fields, GAFF v1.7 and GAFF v2.1, predicting experimental binding free energies, enthalpies, and entropies.
We then characterize the conformational differences produced by SMIRNOFF99Frosst compared to the other force fields.

## Methods

### Choice of host-guest systems
In this study, we report the binding thermodynamics of 43 host-guest complexes (@fig:host-guest-pairs and Table @tbl:host-guests) computed using three different force fields. 
The complexes consist of either α- or β-cyclodextrin as host molecules and a series of small molecule guests containing ammonium, carboxylate, or cyclic alcohol functional groups.
Cyclodextrins are cyclic polymers consisting of six (αCD) or seven (βCD) glucose monomers in the shape of a truncated cone.
The equilibrium constants and standard molar enthalpies of binding for these 43 complexes have been measured using isothermal titration calorimetry (ITC) and nuclear magnetic resonance spectroscopy (NMR) [@1236RpaUv] and computationally in [@HVgz5rZq].
As in Henriksen, et al. [@HVgz5rZq], only a single structural isomer was considered for the 1-methylammonium guests.

![Structures of the two cyclodextrin hosts and 33 guest molecules in this study which together comprise 43 unique host-guest pairs.](images/host-guest-pairs.png){#fig:host-guest-pairs}

|  Host-guest ID | Host | Guest[charge] |
| --- | --- | --- |
|  a-bam | αCD | 1-butylamine[+1] |
|  a-nmb | αCD | n-methylbutylamine[+1] |
|  a-mba | αCD | 1-methylbutylamine[+1]^a^ |
|  a-pam | αCD | 1-pentylamine[+1] |
|  a-ham | αCD | 1-hexylamine[+1] |
|  a-nmh | αCD | n-methylhexylamine[+1] |
|  a-mha | αCD | 1-methylhexylamine[+1]^a^ |
|  a-hpa | αCD | 1-heptylamine[+1] |
|  a-mhp | αCD | 1-methylheptylamine[+1]^b^ |
|  a-oam | αCD | 1-octylamine[+1] |
|  b-ham | βCD | 1-hexylamine[+1] |
|  b-mha | βCD | 1-methylhexylamine[+1]^a^ |
|  b-oam | βCD | 1-octylamine[+1] |
|  a-cbu | αCD | cyclobutanol[0] |
|  a-cpe | αCD | cyclopentanol[0] |
|  a-chp | αCD | cycloheptanol[0] |
|  a-coc | αCD | cyclooctanol[0] |
|  b-cbu | βCD | cyclobutanol[0] |
|  b-cpe | βCD | cyclopentanol[0] |
|  b-mch | βCD | 1-methylcyclohexanol[0] |
|  b-m4c | βCD | cis-4-methylcyclohexanol[0] |
|  b-m4t | βCD | trans-4-methylcyclohexanol[0] |
|  b-chp | βCD | cycloheptanol[0] |
|  b-coc | βCD | cyclooctanol[0] |
|  a-but | αCD | butanoate[-1] |
|  a-pnt | αCD | pentanoate[-1] |
|  a-hex | αCD | hexanoate[-1] |
|  a-hx2 | αCD | trans-2-hexenoate[-1] |
|  a-hx3 | αCD | trans-3-hexenoate[-1] |
|  a-hep | αCD | heptanoate[-1] |
|  a-hp6 | αCD | 6-heptenoate[-1] |
|  a-oct | αCD | octanoate[-1] |
|  b-pnt | βCD | pentanoate[-1] |
|  b-hex | βCD | hexanoate[-1] |
|  b-hep | βCD | heptanoate[-1] |
|  b-ben | βCD | benzoate[-1] |
|  b-pha | βCD | phenylacetate[-1] |
|  b-mp3 | βCD | 3-methylphenylacetate[-1] |
|  b-mp4 | βCD | 4-methylphenylacetate[-1] |
|  b-mo3 | βCD | 3-methoxyphenylacetate[-1] |
|  b-mo4 | βCD | 4-methoxyphenylacetate[-1] |
|  b-pb3 | βCD | 3-phenylbutanoate[-1] |
|  b-pb4 | βCD | 4-phenylbutanoate[-1] |

Table: The 43 unique host-guest combinations used in this study. The formal charge of each guest is listed in brackets. The guest names correspond to Tables 1 and 2 in Rekharsky et al. [@1236RpaUv]. ^a^ Only the *R* enantiomer was considered. ^b^ Only the *S* enantiomer was considered. {#tbl:host-guests}

### Application of force field parameters

We sought to compare force fields directly, and as such, attempted to minimize additional differences between the simulations with each force field.
In all simulations, we applied AM1-BCC [@LxrgIkt0; @BkLoOd0N] partial atomic charges to both the host and guest molecules using the `antechamber` program.
The host charges were calculated using a single glucose molecule with methoxy caps on the O1 and O4 alcohols ([ @fig:atom-names]); each glucose monomer in the cyclodextrin polymer has identical charges.
We used TIP3P water [@chrX4HGh] and Joung-Cheatham monovalent ion parameters [@uZnQBwCt] in each simulation set.

<div id="fig:atom-names">
![](images/atom-names-trimer.png){width=3.5in}
![](images/gaff-atom-types.png){width=3.5in}

Atom names (left) and GAFF atom types (right) for a glucose monomer in αCD shown with two flanking monomers. The remaining three glucose monomers are hidden for clarity.
</div>

GAFF v1.7 bond, angle, torsion, and Lennard-Jones parameters were applied using the `tleap` program distributed with AmberTools16. These simulations were performed as part of Henriksen, et al.  [@HVgz5rZq] and are described in additional detail therein.

GAFF v2.1 parameters were applied in an identical manner to the GAFF v1.7 parameters, using the `tleap` program distributed with AmberTools18 and substituting `leaprc.gaff` for `leaprc.gaff2` in the `tleap` input file.
In GAFF v2.1, the bond and angle parameters have been updated to reproduce small molecule geometries obtained from high-level quantum mechanical calculations.
The force constants for the bond and angle parameters were tuned to reproduce the vibrational spectra of over 600 molecules.
The torsion parameters were optimized to reproduce the rotational potential energy surface of 400 model compounds.
Finally, the Lennard-Jones coefficients were redeveloped to reproduce interaction energies and pure liquid properties.
**See [#7](https://github.com/slochower/smirnoff-host-guest-manuscript/issues/7).**

To apply SMIRNOFF99Frosst parameters, we followed a [multistep process](https://github.com/slochower/smirnoff-host-guest/blob/master/02-convert-APR-files.ipynb), beginning with the prepared GAFF v1.7 files.
The host and guest molecules were parameterized with the Open Force Field Toolkit version 0.0.3, SMIRNOFF version 1.0, and SMIRNOFF99Frosst version 1.0.5.
Once parameterized with SMIRNOFF99Frosst, ParmEd [@T7iFp9ei] was used to combine the host and guest with the solvent and ions, which retained their TIP3P water parameters and Joung-Cheatham ion parameters, respectively.
**See [#8](https://github.com/slochower/smirnoff-host-guest-manuscript/issues/8).**

### Thermodynamic calculation
We used the attach-pull-release (APR) method as implemented in the open source package pAPRika version 0.0.3, to calculate absolute binding free energies.
A complete description of the APR method has been characterized in the literature [@1935a9V0d; @W9FLyOZr; @GA1AFcUw; @1HWPx2yMR].
The attachment and release phases consisted of 15 independent windows.
During the attachment phase, the force constants on the host and guest are scaled by a $\lambda$ parameter that goes from $\lambda = 0$, at which point all restraints are turned off, to $\lambda = 1$, at which point all restraints are at their maximum force constant. 
The $\lambda$ windows are more densely spaced where the force constant is smaller to improve sampling along highly curved regions of the potential of mean force.
Conformational restraints were applied between neighboring glucose units of the cyclodextrin to limit the incursion of monomers into the host cavity. 
These restraints were applied along the pseudodihedrals $\ce{{O5}_n-{C1}_n-{O1}_n-{C4}_{n+1}}$ and $\ce{{C1}_n-{O1}_n-{C4}_{n+1}-{C5}_{n+1}}$ to improve convergence and sampling of the bound state ([@fig:atom-names] for atom names). 
To further improve sampling, we applied a hard wall restraint that confined the guest molecule to within a sphere of 12.3 and 13.5 Å of αCD and βCD, respectively, during the bound state.
The release phase is the conceptual reverse of the attach phase, in which the conformational restraints on the host are gradually turned off ($\lambda =1 \rightarrow 0$) in the absence of the guest.
This explicit release phase is performed once for αCD and once for βCD. 
Finally, an analytic correction is performed to compute the work of moving the guest from the restricted volume enforced by the APR restraints to standard state at 1 M concentration. 

The pulling phase consisted of 45 independent, equally spaced windows. 
During the pulling phase, the $\lambda$ parameter represents the target value of a distance restraint with constant force constant.
This target distance is increased uniformly in 45 increments of 0.4 Å, yielding windows that separate the host and guest by 18 Å over the course of the calculation.

Due to the asymmetry of the primary and secondary alcohols of cyclodextrin (@fig:cavity), and the lack of symmetry of the small molecule guests, there are generally two distinct binding poses that do not interconvert during the simulation timescale.
To account for this effect, we separately compute the binding free energy and enthalpy for each orientation [@1935a9V0d] and combine the results to produce a single value for each host-guest combination.
In this manuscript, we refer to calculations whereby the guest is pulled out of the primary face of cyclodextrin with a `-p` suffix and calculations whereby the guest is pulled out of the secondary orientation with a `-s` suffix.

Thermodynamic integration was used to compute the binding free energy (ΔG). 
The binding enthalpy (ΔH) was computed as the difference in mean potential energy of the bound state (in the absence of any restraints) and the unbound state (where the guest is held far away from the host, but the conformational restraints on the host are disabled).
The binding entropy (ΔS) was computed by subtraction using ΔG and ΔH.

### Simulations
Simulations were performed with the `pmemd.cuda` module of AMBER 16 (calculations of the GAFF v1.7 force field) and AMBER 18 (calculations of the GAFF v2.1 and SMIRNOFF99Frosst force fields) molecular dynamics software [@197xzzCJg]. 
Each window for each system was independently solvated and simulated.

Solvation consisted of 2000 TIP3P waters for the αCD systems and 2210 waters for the βCD systems in an orthorhombic box. 
The host and guest were oriented via non-interacting dummy atoms along the simulation box $z$ axis to minimize the amount of solvent required. 
Each simulation contained enough Na^+^ or Cl^-^ ions to neutralize the host-guest complex and an additional 50 mM NaCl to match the experimental conditions in [@1236RpaUv]. 
In the GAFF simulations, hydrogen mass repartitioning [@IGZ99oJ8] was used to adjust the mass of hydrogen atoms to 3.024 Da by transferring mass from bonded heavy atoms, enabling a simulation timestep of 4 fs. 
Equilibration consisted of 50,000 steps of energy minimization, 100 ps of heating from 0 to 300 K, followed by 2000 ps of additional NPT simulations. 
A Langevin thermostat, the Monte Carlo barostat, a nonbonded cutoff of 9 Å and default PME parameters, were used for the NPT simulations.
Production NPT simulations were run for a minimum of 5 ns and maximum of 50 ns per window, except for the windows used to calculate the enthalpy, which were simulated for 1 μs. 
In the GAFF v1.7 and GAFF v2.1 simulations, the exact length of each window's simulation was determined by the restraint coordinate uncertainty. 
For restraint energy $U$ in $\lambda$ window $i$, each window (except for the windows used to calculate ΔH) was simulated until the value $w(\lambda_i)$:

\begin{equation}
    w(\lambda_i) = 
    \begin{cases}
    \left\langle \frac{\partial U}{\partial \lambda_i} \right\rangle_\text{SEM} \cdot \frac{\lambda_{i+1}}{2} & i = 0 \\
    \left\langle \frac{\partial U}{\partial \lambda_i} \right\rangle_\text{SEM} \cdot \frac{\lambda_{i+1} - \lambda_{i-1}}{2} & i \in [1, N-1] \\
    \left\langle \frac{\partial U}{\partial \lambda_i} \right\rangle_\text{SEM} \cdot \frac{1 - \lambda_{i-1}}{2} & i = N \\
    \end{cases}
\end{equation}

fell below a threshold of 0.02 kcal/mol during the attach phase and 0.1 kcal/mol during the pull phase.
In contrast, SMIRNOFF99Frosst production NPT simulations were run for 10 ns per window, except for the first and last window which ran for 1 μs to calculate ΔH.

### Statistics
The uncertainty in each simulation window was estimated using blocking analysis [@htck51Lp] and propagated into an uncertainty for ΔG after integrating 100,000 curves and an uncertainty for ΔH by adding in quadrature.

For each force field, we computed the root mean squared error (RMSE), mean signed error (MSE), the coefficient of determination (R^2^), Kendall's rank correlation coefficient (τ), and the slope and intercept of the computed properties relative to the experimental values.
We also test how the force fields compare to each other using these statistics.
Comparisons with experiment have 43 data points, for the 43 unique host-guest complexes listed in Table @tbl:host-guests; comparisons between force fields have 86 data points, representing the two separate calculations performed for each host-guest pair.

The overall RMSE and R^2^ values for each comparison are reported as the mean with the 95% confidence interval in brackets.
These values are estimated by using the uncertanties assigned to each data point to create 100,000 hypothetical graphs through resampling with replacement.
The R^2^ values for each functional group subset is also reported in the bottom right corner in each graph.


## Results

This results section is organized as follows. We first present a comparison of SMIRNOFF99Frosst and two iterations of the General AMBER Force Field (GAFF [@YmRgHfeU]) on predicting binding free energies (ΔG) and binding enthalpies (ΔH) of small molecule guests to α-cyclodextrin (αCD) and β-cyclodextrin (βCD). 
We then detail how the conformational preferences of guest molecules changes between force fields and finally we summarize the parameter differences between SMIRNOFF99Frosst and GAFF along with the effects of the parameter differences. 

### Comparison with experimental binding free energies, enthalpies, and entropies

Despite having far fewer numerical parameters, SMIRNOFF99Frosst does about as well as, or even better than, GAFF v1.7 on predicting ΔG and ΔH, compared to experimental values measured using ITC or NMR.
SMIRNOFF99Frosst has an overall deviation from experiment under 1 kcal/mol on binding free energies and under 2 kcal/mol on binding enthalpies and entropies across the 43 host-guest systems (@fig:dG-dH, @fig:TdS, Table @tbl:statistics, Table @tbl:dG-combined, Table @tbl:dH-combined, and Table @tbl:TdS-combined).

GAFF v1.7 agrees well with SMIRNOFF99Frosst (@fig:dG-by-orientation); the overall root mean squared error (RMSE) between the methods is 0.88 kcal/mol.
Compared to experiment, GAFF v1.7 has RMSE values of 0.88 kcal/mol, 2.54 kcal/mol, and 2.21 kcal/mol on ΔG, ΔH, and −TΔS.
Both SMIRNOFF99Frosst and GAFF v1.7 systematically underestimate the ΔG and ΔH for cyclic alcohols.
In some cases, GAFF v1.7 underestimates ΔH by over 3 kcal/mol and up to 5 kcal/mol (b-chp).

The predictions made by GAFF v2.1 exhibit significant differences from those of SMIRNOFF99Frosst (RMSE=1.90 kcal/mol @fig:dG-by-orientation) or GAFF v1.7 (RMSE=2.1 kcal/mol, @fig:dG-by-orientation). 
GAFF v2.1 has a large negative systematic deviation from the experimental values in both ΔG and ΔH, yet strikingly strong correlations with the experimental values across all three functional group classes.
Furthermore, GAFF v2.1 has the lowest −TΔS RMSE of any force field (@fig:TdS).
Compared to SMIRNOFF99Frosst and GAFF v1.7, GAFF v2.1 uniformly overestimates both the binding free energy and binding enthalpy, with slopes > 1 in both cases (Table @tbl:statistics).

[I'm thinking it might be cleaner and more palatable to separate the comparisions out by ΔG first, then ΔH, and then −TΔS to break things up a bit. I'm made a mush of the results, trying to touch upon the key differences without covering everything, for example, the second paragraph in this section begins by implicitly using ΔG for "agrees well" but then discusses ΔH in the final sentence.]{.banner .lightgrey} 

<div id="fig:dG-dH">
![](images/SMIRNOFF99Frosst-vs-Experiment-dG.png){ width=3.5in}
![](images/SMIRNOFF99Frosst-vs-Experiment-dH.png){width=3.5in}

![](images/GAFF-v1.7-vs-Experiment-dG.png){width=3.5in}
![](images/GAFF-v1.7-vs-Experiment-dH.png){width=3.5in}

![](images/GAFF-v2.1-vs-Experiment-dG.png){width=3.5in}
![](images/GAFF-v2.1-vs-Experiment-dH.png){width=3.5in}

Comparison of calculated absolute binding free energies (ΔG) and binding enthalpies (ΔH) with experiment with SMIRNOFF99Frosst parameters (top), GAFF v1.7 parameters (middle), or GAFF v2.1 parameters (bottom) applied to both host and guest. The orange, blue, and purple coloring distinguish the functional group of the guest as an ammonium, alcohol, or carboxylate, respectively.
</div>

|   |  | RMSE (kcal/mol) |  | MSE (kcal/mol) |  | R² |  | Slope |  | Intercept (kcal/mol) |  |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|   |  | Mean | SEM | Mean | SEM | Mean | SEM | Mean | SEM | Mean | SEM |
|  ΔG | SMIRNOFF99Frosst | 0.91 | 0.11 | **-0.01** | **0.14** | 0.34 | 0.11 | 0.49 | 0.12 | -1.55 | 0.38 |
|  ΔG | GAFF v1.7 | **0.88** | **0.09** | 0.46 | 0.12 | 0.54 | 0.10 | 0.69 | 0.11 | **-0.48** | **0.35** |
|  ΔG | GAFF v2.1 | 1.68 | 0.09 | -1.56 | 0.10 | **0.82** | **0.08** | **1.19** | **0.09** | -1.00 | 0.28 |
|   |  |  |  |  |  |  |  |  |  |  |  |
|  ΔH | SMIRNOFF99Frosst | **1.85** | **0.23** | **0.77** | **0.26** | 0.44 | 0.12 | **0.85** | **0.17** | **0.41** | **0.52** |
|  ΔH | GAFF v1.7 | 2.54 | 0.24 | 1.84 | 0.27 | 0.39 | 0.12 | 0.80 | 0.18 | 1.36 | 0.60 |
|  ΔH | GAFF v2.1 | 2.21 | 0.23 | -1.64 | 0.23 | **0.75** | **0.08** | 1.38 | 0.12 | -0.69 | 0.40 |
|   |  |  |  |  |  |  |  |  |  |  |  |
|  -TΔS | SMIRNOFF99Frosst | 1.90 | 0.21 | -0.78 | 0.27 | 0.40 | 0.13 | 0.90 | 0.20 | -0.83 | 0.25 |
|  -TΔS | GAFF v1.7 | 2.21 | 0.24 | -1.38 | 0.27 | 0.43 | 0.13 | **0.96** | **0.21** | -1.41 | 0.24 |
|  -TΔS | GAFF v2.1 | **1.47** | **0.24** | **0.08** | **0.23** | **0.60** | **0.14** | 1.14 | 0.18 | **0.15** | **0.21** |

Table: Predicted thermodynamic properties for each force field relative to experiment. {#tbl:statistics}


### Guest preferences for binding in the primary or secondary cyclodextrin cavity

The asymmetry of the hosts and the guests leads to two distinct bound states for each host-guest pair: one where the primary functional group of the guest interacts with the primary alcohols of the host and a second conformation where the primary functional group of the guest interacts with the secondary alcohols (@fig:cavity).
In most cases, the guest molecules do not sample both conformations during a typical simulation.
Therefore, we compute ΔG for each orientation separately (@fig:by-orientation-comparison, @fig:by-orientation-highlight and @fig:dG-by-orientation) and combine the results using the following equation:

\begin{equation}
\Delta G = -RT \ln(\exp(-\beta \Delta G_\text{primary}) + \exp(-\beta \Delta G_\text{secondary})).
\end{equation}

The difference in binding free energy between either orientation (ΔΔG<sub>orientation</sub>) can be large, around ~2 kcal/mol for SMIRNOFF99Frosst and GAFF v1.7 and ~5 kcal/mol for GAFF v2.1.
SMIRNOFF99Frosst predicts the largest ΔΔG<sub>orientation</sub> for the ammonium-containing butylamine and pentylamine with αCD (@fig:by-orientation), with the primary orientation being more favorable.
GAFF v1.7 predicts a large ΔΔG<sub>orientation</sub> for the cyclic alcohols cyclooctanol and  cycloheptanol, with the secondary orientation having a more favorable ΔG.
This effect is even more apparent with GAFF v2.1 where the ΔΔG<sub>orientation</sub> for a-chp and a-coc is greater than 4 kcal/mol.
This effect is due, in part, to poor sampling during the bound state (@fig:by-orientation, bottom right).

<div id="fig:by-orientation">
![](images/SMIRNOFF99Frosst-dG-by-orientation-all.png){width=3.5in}
![](images/GAFF-v1.7-dG-by-orientation-all.png){width=3.5in}
![](images/GAFF-v2.1-dG-by-orientation-all.png){width=3.5in}
![](images/a-chp-p-overlay.png){width=3.5in}

The differences in binding free energy (ΔG) between guests in either the primary or secondary orientation of αCD or βCD. Arrows point from ΔG for the secondary to ΔG for the primary cavity. The systems are arranged in descending order by greatest difference in ΔG between orientations.
Bottom right: An overlay of cycloheptanol bound state positions (400 snapshots over 1 μs) with αCD. **This is actually the SMIRNOFF99Frosst picture, but I want to make the case for GAFF v2.1, so this needs to be updated.**
</div>

### Guest preferences for αCD and βCD

Ten guests in the data set bind both αCD and βCD.
These ten guests show different patterns of binding between the two host molecules.
For example, SMIRNOFF99Frosts underestimates the binding free energy of cyclooctanol both orientations by the same amount (@fig:by-cyclodextrin).
However, despite underestimating the binding free energy of cyclobutanol for αCD by ~0.7 kcal/mol,  the binding affinity prediction for βCD is very slightly overestimated by ~0.3 kcal/mol (Table @tbl:dG-combined).
Very similar patterns are observed for GAFF v1.7 and both force fields appear to perform better overall on binding affinities to αCD compared to βCD (@fig:dG-dH-by-cyclodextrin).

As is the case with the difference in binding free energy between guest orientations, the difference in binding free energy between host molecules using GAFF v2.1 is large.
There does not appear to be a clear difference in the accuracy of the predictions for αCD versus βCD (@fig:dG-dH-by-cyclodextrin).

<div id="fig:by-cyclodextrin">
![](images/SMIRNOFF99Frosst-vs-Experiment-dG-by-cyclodextrin.png){width=3.5in}
![](images/GAFF-v1.7-vs-Experiment-dG-by-cyclodextrin.png){width=3.5in}
![](images/GAFF-v2.1-vs-Experiment-dG-by-cyclodextrin.png){width=3.5in}

The differences in binding free energy between the same guest for either αCD or βCD. The binding affinity for αCD is circled in black. Thin colored lines connect data points for the same guest. Color is used purely to distinguish among the guests.
</div>

### Trends by guest functional group

SMIRNOFF99Frosst does a good job (MSE = -0.10 kcal/mol and RMSE = 0.76 kcal/mol) estimating the binding free energy of ammonium-containing guests to both αCD and βCD (@fig:ammonium).
Shorter chain molecules bind less strongly and the same guest will bind more strongly to αCD than βCD.

[I need to include the functional group tables here. I will put the SMIRNOFF99Frosst vs. Experimental tables here and the others in the SI.]{.banner .lightgrey}

<div id="fig:ammonium">
![](images/SMIRNOFF99Frosst-vs-Experiment-dG-highlight-alpha-ammonium.png){width=3.5in}
![](images/SMIRNOFF99Frosst-vs-Experiment-dG-highlight-beta-ammonium.png){width=3.5in}

Binding free energy (ΔG) comparisons showing ammonium guests in color and highlighted. Darker colors indicate shorter chain molecules.
</div>

[This figure makes it look like SMIRNOFF99Frosst nails the prediction, but it is potentially very misleading because this is not *all* of the ammonium containing guests because not all of them follow the trend of increasing chain length. So, for example, 1-methylheptylamine is missing. This point also applies to the graphs below.]{.banner .lightgrey}

SMIRNOFF99Frosst performs reasonably on cyclic alcohols (MSE = 0.70 kcal/mol and RMSE = 1.07 kcal/mol) (@fig:alcohols).
The predictions for αCD are uniformly underestimated while those for βCD are equally under- and over-predicted.

[Should say something here about cylooctanol predictions *and* experiment being poor because it does not fit well, especially in αCD]{.banner .lightgrey}

<div id="fig:alcohols">
![](images/SMIRNOFF99Frosst-vs-Experiment-dG-highlight-alpha-alcohols.png){width=3.5in}
![](images/SMIRNOFF99Frosst-vs-Experiment-dG-highlight-beta-alcohols.png){width=3.5in}

Binding free energy (ΔG) comparisons showing alcohols guests in color and highlighted. Darker colors indicate smaller molecules.
</div>

The binding affinity of carboxylate guests to both αCD and βCD is well characterized by SMIRNOFF99Frosst (MSE = -0.36 kcal/mol and RMSE = 0.87 kcal/mol) (@fig:carboxylates).

<div id="fig:carboxylates">
![](images/SMIRNOFF99Frosst-vs-Experiment-dG-highlight-alpha-carboxylates.png){width=3.5in}
![](images/SMIRNOFF99Frosst-vs-Experiment-dG-highlight-beta-carboxylates.png){width=3.5in}

Binding free energy (ΔG) comparisons showing alcohols guests in color and highlighted. Darker colors indicates smaller molecules.
</div>

In all cases, GAFF v1.7 tends to predict slightly weaker binding than SMIRNOFF99Frosst whereas GAFF v2.1 predicts much stronger binding for these compounds (@fig:additional-highlights-ammonium, @fig:additional-highlights-alcohols, and @fig:additional-highlights-carboxylates).

### Differences in force field parameters between SMIRNOFF99Frosst and GAFF

Next, we summarize the parameter differences between SMIRNOFF99Frosst, a decendent of parm99 and GAFF v1.7 (released circa March 2015 according to `gaff.dat` distributed with AMBER16) and GAFF v2.1 (which is under active development) on the parameters applied to αCD.

The σ and ε parameters are identical between SMIRNOFF99Frosst and GAFF v1.7.
Compared to GAFF v2.1, SMIRNOFF99Frosst has deeper well depths for oxygens and decreased σ values for the hydroxyl hydrogens (@fig:LJ).

#### Lennard-Jones
<div id="fig:LJ">
![](images/SMIRNOFF99Frosst-vs-GAFF-v2.1-sigma.png){width=3.5in}
![](images/SMIRNOFF99Frosst-vs-GAFF-v2.1-epsilon.png){width=3.5in}

A comparison of Lennard-Jones nonbonded parameters for SMIRNOFF99Frosst and GAFF v2.1. Values that differ by more than 10% are labeled in red. Atom names refer to [@fig:atom-names]. 
</div>

#### Bonded parameters

Compared to GAFF v1.7, SMIRNOFF99Frosst tends to have slightly larger bond force constants, except for the O--H hydroxyl bond force constant, which is much stronger.
In GAFF v2.1, the O--H hydroxyl bond force constant is consistent with SMIRNOFF99Frosst, but the carbon-oxygen bond constants are weaker.
Equilibrium bond lengths are very similar ([@fig:bond-req]).

<div id="fig:bonds">
![](images/SMIRNOFF99Frosst-vs-GAFF-v1.7-bond-k.png){width=3.5in}
![](images/SMIRNOFF99Frosst-vs-GAFF-v2.1-bond-k.png){width=3.5in}

A comparison of bonded parameters for SMIRNOFF99Frosst, GAFF v1.7, and GAFF v2.1. Values that differ by more than 10% are labeled in red. Atom names refer to [@fig:atom-names]. 
</div>

#### Angle parameters

Relative to GAFF v1.7 and GAFF v2.1, SMIRNOFF99Frosst has fewer unique angle parameters applied to αCD; several distinct parameters appear to be compressed into a single force constant, around 50 kcal/mol/rad^2^ (@fig:ang).
These parameters correspond to $\ce{C-C-C}$, $\ce{C-O-C}$, and $\ce{O-C-O}$ angles.
The $\ce{C-C-C}$ angles are primarily around the ring of the glucose monomer.
The $\ce{C-O-C}$ angles are both around the ring and between monomers (e.g., $\ce{C1-O1-C4}$ and $\ce{C1-O5-C5}$).
Weaker force constants for these parameters may lead to increased flexibility.

<div id="fig:ang">
![](images/SMIRNOFF99Frosst-vs-GAFF-v1.7-ang-k.png){width=3.5in}
![](images/SMIRNOFF99Frosst-vs-GAFF-v2.1-ang-k.png){width=3.5in}

![](images/SMIRNOFF99Frosst-vs-GAFF-v1.7-ang-theta.png){width=3.5in}
![](images/SMIRNOFF99Frosst-vs-GAFF-v2.1-ang-theta.png){width=3.5in}

A comparison of angle parameters for SMIRNOFF99Frosst, GAFF v1.7, and GAFF v2.1. Values that differ by more than 10% are labeled in red. Precise atom names have been omitted to compress multiple angles with the same parameter values into a single label.
</div>

#### Dihedral parameters

The dihedral parameters between SMIRNOFF99Frosst and GAFF v1.7 are extremely similar (where differences occur, they are in the second or third decimal place), with the exception of the $\ce{H1-C1-C2-O2}$ parameter, for which SMIRNOFF99Frosst applies a dihedral with periodicity = 1 and GAFF v1.7 applies a dihedral with a periodicity of 3 (Table @tbl:S99-vs-GAFF-v1.7 and @fig:dihedral).

|   |  |  |  |  |  | SMIRNOFF99Frosst | GAFF v1.7 |
| --- | --- | --- | --- | --- | --- | --- | --- |
|  Atom 1 | Atom 2 | Atom 3 | Atom 4 | Per | Phase | Height (kcal/mol) | Height (kcal/mol) |
|  H1 | C1 | C2 | O2 | 1 | 0 | 0.25 | -- |
|  H1 | C1 | C2 | O2 | 3 | 0 | 0.00 | 0.16 |

Table: Dihedral parameter differences between SMIRNOFF99Frosst and GAFF v1.7. {#tbl:S99-vs-GAFF-v1.7}

![The dihedral energy term applied to H1-C1-C2-O2 in SMIRNOFF99Frosst and GAFF v1.7. Atom names refer to [@fig:atom-names].](images/SMIRNOFF99Frosst-vs-GAFF-v1.7-H1-C2-C2-O2.png){#fig:dihedral width=3.5in}

The dihedral parameters in GAFF v2.1 differ from those in SMIRNOFF99Frosst, in a number of ways.
There are several dihedrals that have a different number of terms in either force field (Table @tbl:S99-vs-GAFF-v2.1-missing).

[While this table is accurate, it might not be the best representation because some missing terms happen to correspond to a 0.00 kcal/mol force constant in GAFF v2.1. It might be more useful to exclude those.]{.banner .lightgrey}

|   |  |  |  |  |  | SMIRNOFF99Frosst | GAFF v2.1 |
| --- | --- | --- | --- | --- | --- | --- | --- |
|  Atom 1 | Atom 2 | Atom 3 | Atom 4 | Per | Phase | Height (kcal/mol) | Height (kcal/mol) |
|  C1 | C2 | O2 | HO2 | 1 | 0 | 0.25 | -- |
|  C1 | C2 | O2 | HO2 | 3 | 0 | 0.16 | 0.00 |
|  C1 | O5 | C5 | C4 | 1 | 0 | -- | 0.00 |
|  C1 | O5 | C5 | C4 | 2 | 0 | 0.10 | 0.16 |
|  C1 | O5 | C5 | C4 | 3 | 0 | 0.38 | 0.24 |
|  C1 | O5 | C5 | C6 | 1 | 0 | -- | 0.00 |
|  C1 | O5 | C5 | C6 | 2 | 0 | 0.10 | 0.16 |
|  C1 | O5 | C5 | C6 | 3 | 0 | 0.38 | 0.24 |
|  C2 | C1 | O5 | C5 | 1 | 0 | -- | 0.00 |
|  C2 | C1 | O5 | C5 | 2 | 0 | 0.10 | 0.16 |
|  C2 | C1 | O5 | C5 | 3 | 0 | 0.38 | 0.24 |
|  C2 | C3 | O3 | HO3 | 1 | 0 | 0.25 | -- |
|  C2 | C3 | O3 | HO3 | 3 | 0 | 0.16 | 0.00 |
|  C5 | C6 | O6 | HO6 | 1 | 0 | 0.25 | -- |
|  C5 | C6 | O6 | HO6 | 3 | 0 | 0.16 | 0.00 |
|  H1 | C1 | C2 | O2 | 1 | 0 | 0.25 | -- |
|  H1 | C1 | C2 | O2 | 3 | 0 | 0.00 | 0.16 |
|  O1 | C1 | C2 | O2 | 1 | 0 | -- | 0.02 |
|  O1 | C1 | C2 | O2 | 2 | 0 | 1.18 | 0.00 |
|  O1 | C1 | C2 | O2 | 3 | 0 | 0.14 | 1.01 |
|  O2 | C2 | C1 | O5 | 1 | 0 | -- | 0.02 |
|  O2 | C2 | C1 | O5 | 2 | 0 | 1.18 | 0.00 |
|  O2 | C2 | C1 | O5 | 3 | 0 | 0.14 | 1.01 |
|  O5 | C5 | C6 | O6 | 1 | 0 | -- | 0.02 |
|  O5 | C5 | C6 | O6 | 2 | 0 | 1.18 | 0.00 |
|  O5 | C5 | C6 | O6 | 3 | 0 | 0.14 | 1.01 |
|  HO2 | O2 | C2 | C3 | 1 | 0 | 0.25 | -- |
|  HO2 | O2 | C2 | C3 | 3 | 0 | 0.16 | 0.00 |
|  HO3 | O3 | C3 | C4 | 1 | 0 | 0.25 | -- |
|  HO3 | O3 | C3 | C4 | 3 | 0 | 0.16 | 0.00 |

Table: Dihedral parameter differences between SMIRNOFF99Frosst and GAFF v2.1, where one dihedral has fewer or more periodicity terms than the corresponding term in the other force field. {#tbl:S99-vs-GAFF-v2.1-missing}

In other cases, SMIRNOFF99Frosst and GAFF v2.1 have disagreements on the barrier height after matching the periodicity and phase for a given dihedrals.
It is notable that GAFF v2.1 does not have drastically higher force constants for any of the dihedrals, yet GAFF v2.1 produces much more rigid structures (Table @tbl:S99-vs-GAFF-v2.1).
The dihedral differences between neighboring glucose monomers demonstrate that SMIRNOFF99Frosst, not GAFF v2.1 has higher force constants (Table @tbl:S99-vs-GAFF-v2.1-inter).

|   |  |  |  |  |  | SMIRNOFF99Frosst | GAFF v2.1 |
| --- | --- | --- | --- | --- | --- | --- | --- |
|  Atom 1 | Atom 2 | Atom 3 | Atom 4 | Per | Phase | Height (kcal/mol) | Height (kcal/mol) |
|  C1 | C2 | C3 | C4 | 1 | 0 | 0.20 | 0.11 |
|  C1 | C2 | C3 | C4 | 2 | 0 | 0.25 | 0.29 |
|  C1 | C2 | C3 | C4 | 3 | 0 | 0.18 | 0.13 |
|  C1 | C2 | C3 | O3 | 3 | 0 | 0.16 | 0.21 |
|  C1 | O5 | C5 | H5 | 3 | 0 | 0.38 | 0.34 |
|  C2 | C3 | C4 | C5 | 1 | 0 | 0.20 | 0.11 |
|  C2 | C3 | C4 | C5 | 2 | 0 | 0.25 | 0.29 |
|  C2 | C3 | C4 | C5 | 3 | 0 | 0.18 | 0.13 |
|  C3 | C4 | C5 | C6 | 1 | 0 | 0.20 | 0.11 |
|  C3 | C4 | C5 | C6 | 2 | 0 | 0.25 | 0.29 |
|  C3 | C4 | C5 | C6 | 3 | 0 | 0.18 | 0.13 |
|  C4 | C5 | C6 | O6 | 3 | 0 | 0.16 | 0.21 |
|  H1 | C1 | C2 | H2 | 3 | 0 | 0.15 | 0.16 |
|  H2 | C2 | C3 | H3 | 3 | 0 | 0.15 | 0.16 |
|  H2 | C2 | O2 | HO2 | 3 | 0 | 0.17 | 0.11 |
|  H3 | C3 | C4 | H4 | 3 | 0 | 0.15 | 0.16 |
|  H3 | C3 | O3 | HO3 | 3 | 0 | 0.17 | 0.11 |
|  H4 | C4 | C5 | H5 | 3 | 0 | 0.15 | 0.16 |
|  H5 | C5 | C6 | H61 | 3 | 0 | 0.15 | 0.16 |
|  H5 | C5 | C6 | H62 | 3 | 0 | 0.15 | 0.16 |
|  O1 | C1 | O5 | C5 | 1 | 0 | 1.35 | 0.97 |
|  O1 | C1 | O5 | C5 | 2 | 0 | 0.85 | 1.24 |
|  O1 | C1 | O5 | C5 | 3 | 0 | 0.10 | 0.00 |
|  O2 | C2 | C3 | C4 | 3 | 0 | 0.16 | 0.21 |
|  O2 | C2 | C3 | O3 | 2 | 0 | 1.18 | 1.13 |
|  O2 | C2 | C3 | O3 | 3 | 0 | 0.14 | 0.90 |
|  O3 | C3 | C4 | C5 | 3 | 0 | 0.16 | 0.21 |
|  H61 | C6 | O6 | HO6 | 3 | 0 | 0.17 | 0.11 |
|  H62 | C6 | O6 | HO6 | 3 | 0 | 0.17 | 0.11 |

Table: Dihedral parameter differences between SMIRNOFF99Frosst and GAFF v2.1, only height differences. {#tbl:S99-vs-GAFF-v2.1}


|   |  |  |  |  |  |  |  |  |  |  | SMIRNOFF99Frosst | GAFF v2.1 |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|  ID | Atom 1 | Res 1 | Atom 2 | Res 2 | Atom 3 | Res 3 | Atom 4 | Res 4 | Per | Phase | Height (kcal/mol) | Height (kcal/mol) |
|  1 | C1 | *n* | O1 | *n* | C4 | *n+1* | C3 | *n+1* | 1 | 0 | -- | 0.00 |
|   | C1 | *n* | O1 | *n* | C4 | *n+1* | C3 | *n+1* | 2 | 0 | 0.10 | 0.16 |
|   | C1 | *n* | O1 | *n* | C4 | *n+1* | C3 | *n+1* | 3 | 0 | 0.38 | 0.24 |
|  2 | C1 | *n* | O1 | *n* | C4 | *n+1* | C5 | *n+1* | 1 | 0 | -- | 0.00 |
|   | C1 | *n* | O1 | *n* | C4 | *n+1* | C5 | *n+1* | 2 | 0 | 0.10 | 0.16 |
|   | C1 | *n* | O1 | *n* | C4 | *n+1* | C5 | *n+1* | 3 | 0 | 0.38 | 0.24 |
|  3 | C2 | *n* | C1 | *n+1* | O1 | *n+1* | C4 | *n+1* | 1 | 0 | -- | 0.00 |
|   | C2 | *n* | C1 | *n+1* | O1 | *n+1* | C4 | *n+1* | 2 | 0 | 0.10 | 0.16 |
|   | C2 | *n* | C1 | *n+1* | O1 | *n+1* | C4 | *n+1* | 3 | 0 | 0.38 | 0.24 |
|  4 | O1 | *n* | C4 | *n+1* | C3 | *n+1* | O3 | *n+1* | 1 | 0 | -- | 0.02 |
|   | O1 | *n* | C4 | *n+1* | C3 | *n+1* | O3 | *n+1* | 2 | 0 | 1.18 | 0.00 |
|   | O1 | *n* | C4 | *n+1* | C3 | *n+1* | O3 | *n+1* | 3 | 0 | 0.14 | 1.01 |
|  5 | O1 | *n* | C4 | *n+1* | C5 | *n+1* | O5 | *n+1* | 1 | 0 | -- | 0.17 |
|   | O1 | *n* | C4 | *n+1* | C5 | *n+1* | O5 | *n+1* | 2 | 0 | 1.18 | 0.00 |
|   | O1 | *n* | C4 | *n+1* | C5 | *n+1* | O5 | *n+1* | 3 | 0 | 0.14 | 0.00 |

Table: Inter-residue dihedral parameter differences between SMIRNOFF99Frosst and GAFF v2.1. {#tbl:S99-vs-GAFF-v2.1-inter}

<div id="fig:interdihedrals">
![](images/SMIRNOFF99Frosst-vs-GAFF-v2.1-C1-O1-C4-C3.png){width=3.5in}
![](images/SMIRNOFF99Frosst-vs-GAFF-v2.1-O1-C4-C3-O3.png){width=3.5in}
![](images/SMIRNOFF99Frosst-vs-GAFF-v2.1-O1-C4-C5-O5.png){width=3.5in}


The dihedral energy term applied to three inter-residue dihedrals in SMIRNOFF99Frosst and GAFF v2.1. The dihedral acting on atoms O1<sub>n</sub>--C4<sub>n+1</sub>--C5<sub>n+1</sub>--O5<sub>n+1</sub> is quite significantly different, with multiple minima and and barrier heights. This dihedral partially controls the rotation of glucose monomers towards or away from the interior of the cyclodextrin cavity. Surprisingly, glucose monomers in GAFF v2.1 penetrate the open cavity much less frequently than in SMIRNOFF99Frosst, despite the lower and broader dihedral energy in GAFF v2.1. Atom names refer to [@fig:atom-names]. 
</div>

### Structural consequences of the force field parameter differences

In both SMIRNOFF99Frosst and GAFF v1.7, the average RMSD of βCD is between 2 and 2.5 Å over 43 μs of simulation. GAFF v2.1 is significanly more rigid, with an average RMSD less than 1.0 Å from the initial structure ([@fig:flexibility]).

![Top: Root mean square deviation (RMSD) of free βCD in the three force fields, all relative to the same initial structure. A 1000 frame moving average is plotted in red. Middle: to-view of the open cavity of βCD with no guest (200 snapshots over 1 μs). Bottom: side-view of the open cavity. The carbons are colored blue in SMIRNOFF99Frosst, green in GAFF v1.7, and purple in GAFF v2.1. Hydrogen atoms have been hidden for clarity.](images/cyclodextrin-flexibility.png){#fig:flexibility width=100%}

## Discussion

[TBD]{.banner .lightgrey}

- Include brief discussion of SMIRNOFF99Frosst developement.
- It is not surprising that it behaves like GAFF v1.7.

- How are we going to take this work forward?

## Supporting Information {.page_break_before #SI}

<div id="fig:TdS">
![](images/SMIRNOFF99Frosst-vs-Experiment-TdS.png){width=3.5in}
![](images/GAFF-v1.7-vs-Experiment-TdS.png){width=3.5in}
![](images/GAFF-v2.1-vs-Experiment-TdS.png){width=3.5in}

Comparison of calculated absolute binding entropies (−TΔS) with experiment with SMIRNOFF99Frosst parameters (top), GAFF v1.7 parameters (middle), or GAFF v2.1 parameters (bottom) applied to both host and guest. The orange, blue, and purple coloring distinguish the functional group of the guest as an ammonium, alcohol, or carboxylate, respectively.
</div>

![The primary (left) and secondary (right) cavity of αCD.](images/alphaCD-structure.png){#fig:cavity width=3.5in}


<div id="fig:by-orientation-comparison">
![](images/SMIRNOFF99Frosst-vs-GAFF-v1.7-dG-color-by-orientation.png){width=3.5in}
![](images/SMIRNOFF99Frosst-vs-GAFF-v2.1-dG-color-by-orientation.png){width=3.5in}

Binding free energies (ΔG) with the primary orientation results colored in blue and secondary orientation results colored in green.
</div>

<div id="fig:by-orientation-highlight">
![](images/SMIRNOFF99Frosst-vs-GAFF-v1.7-dG-by-orientation-highlight.png){width=3.5in}
![](images/SMIRNOFF99Frosst-vs-GAFF-v2.1-dG-by-orientation-highlight.png){width=3.5in}

Binding free energies (ΔG) replotted from [@fig:by-orientation-comparison] with points whose difference in binding free energy along either axis is greater than 2 kcal/mol shown in color. Arrows point from primary to secondary. **The arrow direction should match @fig:by-orientation, but it doesn't.**
</div>

<div id="fig:dG-by-orientation">
![](images/SMIRNOFF99Frosst-vs-GAFF-v1.7-dG-by-orientation.png){width=3.5in}
![](images/SMIRNOFF99Frosst-vs-GAFF-v2.1-dG-by-orientation.png){width=3.5in}
![](images/GAFF-v2.1-vs-GAFF-v1.7-dG-by-orientation.png){width=3.5in}

Comparison of calculated absolute binding free energies (ΔG) between force field combinations. The orange, blue, and purple coloring distinguish the functional group of the guest as an ammonium, alcohol, or carboxylate, respectively.
</div>

<div id="fig:dH-by-orientation">
![](images/SMIRNOFF99Frosst-vs-GAFF-v1.7-dH-by-orientation.png){width=3.5in}
![](images/SMIRNOFF99Frosst-vs-GAFF-v2.1-dH-by-orientation.png){width=3.5in}
![](images/GAFF-v2.1-vs-GAFF-v1.7-dH-by-orientation.png){width=3.5in}

Comparison of calculated absolute binding free enthalpies (ΔH) between force field combinations. The orange, blue, and purple coloring distinguish the functional group of the guest as an ammonium, alcohol, or carboxylate, respectively.
</div>

<div id="fig:TdS-by-orientation">
![](images/SMIRNOFF99Frosst-vs-GAFF-v1.7-TdS-by-orientation.png){width=3.5in}
![](images/SMIRNOFF99Frosst-vs-GAFF-v2.1-TdS-by-orientation.png){width=3.5in}
![](images/GAFF-v2.1-vs-GAFF-v1.7-TdS-by-orientation.png){width=3.5in}

Comparison of calculated absolute binding free entropies (-TΔS) between force field combinations. The orange, blue, and purple coloring distinguish the functional group of the guest as an ammonium, alcohol, or carboxylate, respectively.
</div>


<div id="fig:dG-dH-by-cyclodextrin">
![](images/SMIRNOFF99Frosst-vs-Experiment-dG-alpha.png){width=3.5in}
![](images/SMIRNOFF99Frosst-vs-Experiment-dG-beta.png){width=3.5in}

![](images/GAFF-v1.7-vs-Experiment-dG-alpha.png){width=3.5in}
![](images/GAFF-v1.7-vs-Experiment-dG-beta.png){width=3.5in}

![](images/GAFF-v2.1-vs-Experiment-dG-alpha.png){width=3.5in}
![](images/GAFF-v2.1-vs-Experiment-dG-beta.png){width=3.5in}

Binding free energies (ΔG) replotted from [@fig:dG-dH], with αCD points colored in blue and βCD points in grey (left) or αCD points in grey with βCD points colored in green (right).
</div>

<div id="fig:additional-highlights-ammonium">
![](images/SMIRNOFF99Frosst-vs-GAFF-v1.7-dG-highlight-alpha-ammonium-by-orientation.png){width=3.5in}
![](images/SMIRNOFF99Frosst-vs-GAFF-v2.1-dG-highlight-alpha-ammonium-by-orientation.png){width=3.5in}

![](images/SMIRNOFF99Frosst-vs-GAFF-v1.7-dG-highlight-beta-ammonium-by-orientation.png){width=3.5in}
![](images/SMIRNOFF99Frosst-vs-GAFF-v2.1-dG-highlight-beta-ammonium-by-orientation.png){width=3.5in}

Binding free energy (ΔG) comparisons showing ammonium guests in color and highlighted.
</div>

<div id="fig:additional-highlights-alcohols">
![](images/SMIRNOFF99Frosst-vs-GAFF-v1.7-dG-highlight-alpha-alcohols-by-orientation.png){width=3.5in}
![](images/SMIRNOFF99Frosst-vs-GAFF-v2.1-dG-highlight-alpha-alcohols-by-orientation.png){width=3.5in}

![](images/SMIRNOFF99Frosst-vs-GAFF-v1.7-dG-highlight-beta-alcohols-by-orientation.png){width=3.5in}
![](images/SMIRNOFF99Frosst-vs-GAFF-v2.1-dG-highlight-beta-alcohols-by-orientation.png){width=3.5in}

Binding free energy (ΔG) comparisons showing alcohols guests in color and highlighted.
</div>

<div id="fig:additional-highlights-carboxylates">
![](images/SMIRNOFF99Frosst-vs-GAFF-v1.7-dG-highlight-alpha-carboxylates-by-orientation.png){width=3.5in}
![](images/SMIRNOFF99Frosst-vs-GAFF-v2.1-dG-highlight-alpha-carboxylates-by-orientation.png){width=3.5in}

![](images/SMIRNOFF99Frosst-vs-GAFF-v1.7-dG-highlight-beta-carboxylates-by-orientation.png){width=3.5in}
![](images/SMIRNOFF99Frosst-vs-GAFF-v2.1-dG-highlight-beta-carboxylates-by-orientation.png){width=3.5in}

Binding free energy (ΔG) comparisons showing carboxylates guests in color and highlighted.
</div>

<div id="fig:bond-req">
![](images/SMIRNOFF99Frosst-vs-GAFF-v1.7-bond-req.png){width=3.5in}
![](images/SMIRNOFF99Frosst-vs-GAFF-v2.1-bond-req.png){width=3.5in}

A comparison of bond equilibrium lengths for SMIRNOFF99Frosst, GAFF v1.7, and GAFF v2.1. Atom names refer to [@fig:atom-names]. 
</div>

|  System | Experimental |  | SMIRNOFF99Frosst |  | GAFF v1.7 |  | GAFF v2.1 |  |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
|   | Mean | SEM | Mean | SEM | Mean | SEM | Mean | SEM |
|  a-bam | -1.58 | 0.02 | -3.25 | 0.44 | -0.82 | 0.21 | -2.93 | 0.23 |
|  a-but | -1.51 | 0.04 | -1.49 | 0.27 | -1.09 | 0.20 | -3.14 | 0.22 |
|  a-cbu | -2.02 | 0.02 | -1.33 | 0.19 | -0.89 | 0.22 | -3.73 | 0.21 |
|  a-chp | -2.51 | 0.06 | -2.38 | 0.28 | -1.69 | 0.24 | -4.11 | 0.23 |
|  a-coc | -3.23 | 1.14 | -1.78 | 0.29 | -1.86 | 0.24 | -3.35 | 0.24 |
|  a-cpe | -2.13 | 0.02 | -1.59 | 0.25 | -1.50 | 0.29 | -3.79 | 0.22 |
|  a-ham | -3.53 | 0.00 | -3.43 | 0.30 | -3.02 | 0.19 | -5.99 | 0.17 |
|  a-hep | -3.99 | 0.01 | -3.95 | 0.21 | -3.93 | 0.20 | -6.23 | 0.17 |
|  a-hex | -3.38 | 0.01 | -2.70 | 0.21 | -2.92 | 0.21 | -5.27 | 0.20 |
|  a-hp6 | -3.60 | 0.00 | -3.32 | 0.23 | -3.37 | 0.18 | -5.41 | 0.18 |
|  a-hpa | -4.14 | 0.00 | -3.02 | 0.32 | -3.16 | 0.22 | -6.03 | 0.22 |
|  a-hx2 | -3.34 | 0.01 | -2.74 | 0.20 | -2.60 | 0.19 | -4.79 | 0.18 |
|  a-hx3 | -3.01 | 0.01 | -2.39 | 0.25 | -1.58 | 0.23 | -3.94 | 0.23 |
|  a-mba | -1.76 | 0.02 | -1.22 | 0.30 | -0.89 | 0.25 | -3.17 | 0.23 |
|  a-mha | -3.60 | 0.00 | -3.60 | 0.29 | -2.89 | 0.17 | -5.55 | 0.22 |
|  a-mhp | -4.17 | 0.00 | -3.98 | 0.29 | -3.82 | 0.19 | -6.23 | 0.21 |
|  a-nmb | -1.69 | 0.02 | -1.95 | 0.42 | -0.83 | 0.18 | -2.74 | 0.21 |
|  a-nmh | -3.52 | 0.01 | -4.15 | 0.59 | -2.92 | 0.18 | -5.56 | 0.19 |
|  a-oam | -4.61 | 0.01 | -4.68 | 0.49 | -4.33 | 0.17 | -6.99 | 0.19 |
|  a-oct | -4.62 | 0.02 | -4.64 | 0.30 | -4.85 | 0.24 | -6.81 | 0.19 |
|  a-pam | -2.72 | 0.00 | -2.66 | 0.77 | -1.53 | 0.18 | -4.00 | 0.23 |
|  a-pnt | -2.60 | 0.01 | -2.56 | 0.23 | -1.74 | 0.19 | -4.14 | 0.19 |
|  b-ben | -1.64 | 0.02 | -2.85 | 0.62 | -1.83 | 0.29 | -2.45 | 0.17 |
|  b-cbu | -1.55 | 0.17 | -1.88 | 0.20 | -1.64 | 0.36 | -2.77 | 0.17 |
|  b-chp | -4.56 | 0.01 | -3.08 | 0.25 | -2.79 | 0.34 | -6.27 | 0.23 |
|  b-coc | -4.97 | 0.04 | -3.28 | 0.23 | -3.36 | 0.26 | -7.13 | 0.22 |
|  b-cpe | -3.05 | 0.01 | -3.57 | 0.34 | -3.55 | 0.31 | -5.93 | 0.27 |
|  b-ham | -2.49 | 0.08 | -2.52 | 0.20 | -2.01 | 0.26 | -4.14 | 0.19 |
|  b-hep | -3.39 | 0.18 | -3.41 | 0.28 | -3.34 | 0.35 | -4.15 | 0.23 |
|  b-hex | -2.28 | 0.03 | -2.93 | 0.25 | -2.47 | 0.27 | -3.59 | 0.17 |
|  b-m4c | -4.32 | 0.01 | -2.89 | 0.24 | -2.68 | 0.29 | -5.64 | 0.22 |
|  b-m4t | -4.54 | 0.01 | -3.82 | 0.19 | -3.50 | 0.26 | -6.33 | 0.17 |
|  b-mch | -4.18 | 0.01 | -3.69 | 0.22 | -3.31 | 0.26 | -6.07 | 0.17 |
|  b-mha | -2.56 | 0.07 | -3.46 | 0.24 | -2.14 | 0.28 | -4.66 | 0.18 |
|  b-mo3 | -2.16 | 0.01 | -2.87 | 0.38 | -2.73 | 0.41 | -2.79 | 0.20 |
|  b-mo4 | -2.51 | 0.01 | -4.19 | 0.41 | -3.10 | 0.31 | -3.49 | 0.21 |
|  b-mp3 | -1.46 | 0.04 | -3.03 | 0.27 | -2.48 | 0.28 | -3.00 | 0.19 |
|  b-mp4 | -2.19 | 0.01 | -3.02 | 0.32 | -2.77 | 0.34 | -3.06 | 0.21 |
|  b-oam | -3.59 | 0.12 | -3.35 | 0.28 | -2.60 | 0.30 | -5.25 | 0.23 |
|  b-pb3 | -3.52 | 0.01 | -3.49 | 0.32 | -2.87 | 0.30 | -4.58 | 0.17 |
|  b-pb4 | -3.60 | 0.02 | -3.62 | 0.33 | -3.34 | 0.35 | -4.71 | 0.23 |
|  b-pha | -1.70 | 0.05 | -3.24 | 0.31 | -2.55 | 0.29 | -3.98 | 0.19 |
|  b-pnt | -1.27 | 0.32 | -2.22 | 0.25 | -1.73 | 0.29 | -2.00 | 0.16 |

Table: Experimental and predicted binding free energies (ΔG). {#tbl:dG-combined}

|  System | Experimental |  | SMIRNOFF99Frosst |  | GAFF v1.7 |  | GAFF v2.1 |  |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
|   | Mean | SEM | Mean | SEM | Mean | SEM | Mean | SEM |
|  a-bam | -2.17 | 0.05 | -0.43 | 0.28 | -0.84 | 0.59 | -3.05 | 0.38 |
|  a-but | -2.53 | 0.12 | -0.76 | 0.59 | -1.08 | 0.37 | -4.91 | 0.42 |
|  a-cbu | -2.75 | 0.05 | -2.08 | 0.21 | -0.71 | 0.49 | -4.94 | 0.29 |
|  a-chp | -2.99 | 0.23 | -3.42 | 0.39 | -2.33 | 0.28 | -5.27 | 0.35 |
|  a-coc | -0.93 | 0.32 | -3.80 | 0.45 | -2.93 | 0.32 | -6.17 | 0.32 |
|  a-cpe | -2.74 | 0.02 | -1.93 | 0.30 | -1.06 | 0.42 | -4.86 | 0.29 |
|  a-ham | -4.19 | 0.02 | -4.02 | 0.33 | -2.33 | 0.30 | -6.91 | 0.29 |
|  a-hep | -4.19 | 0.09 | -4.72 | 0.33 | -4.05 | 0.36 | -8.68 | 0.24 |
|  a-hex | -3.40 | 0.02 | -4.33 | 0.30 | -2.95 | 0.30 | -7.43 | 0.31 |
|  a-hp6 | -4.48 | 0.02 | -4.86 | 0.31 | -3.73 | 0.21 | -8.24 | 0.31 |
|  a-hpa | -4.66 | 0.02 | -4.47 | 0.36 | -2.65 | 0.30 | -7.38 | 0.26 |
|  a-hx2 | -4.12 | 0.06 | -4.24 | 0.31 | -2.35 | 0.32 | -6.56 | 0.30 |
|  a-hx3 | -3.36 | 0.05 | -2.25 | 0.55 | -2.80 | 0.32 | -5.51 | 0.28 |
|  a-mba | -2.68 | 0.07 | -0.95 | 0.41 | -0.32 | 0.37 | -3.11 | 0.36 |
|  a-mha | -4.28 | 0.02 | -3.31 | 0.50 | -2.16 | 0.25 | -6.40 | 0.34 |
|  a-mhp | -4.74 | 0.02 | -4.89 | 0.23 | -3.41 | 0.23 | -8.12 | 0.28 |
|  a-nmb | -2.57 | 0.06 | -1.10 | 0.28 | 0.03 | 0.23 | -3.34 | 0.27 |
|  a-nmh | -4.20 | 0.08 | -4.20 | 0.48 | -2.54 | 0.24 | -6.74 | 0.30 |
|  a-oam | -5.46 | 0.03 | -4.93 | 0.28 | -3.73 | 0.33 | -8.02 | 0.28 |
|  a-oct | -4.89 | 0.03 | -6.08 | 0.21 | -4.69 | 0.29 | -9.53 | 0.30 |
|  a-pam | -3.28 | 0.02 | -1.72 | 0.61 | -0.84 | 0.28 | -4.45 | 0.33 |
|  a-pnt | -2.75 | 0.01 | -2.05 | 0.37 | -1.62 | 0.33 | -5.99 | 0.30 |
|  b-ben | -2.51 | 0.08 | -0.45 | 0.56 | -0.76 | 0.82 | -1.30 | 0.26 |
|  b-cbu | 0.88 | 0.17 | 0.05 | 0.83 | -0.19 | 0.46 | 0.87 | 0.29 |
|  b-chp | -2.96 | 0.01 | 0.88 | 0.40 | 1.82 | 0.61 | -4.39 | 0.31 |
|  b-coc | -3.92 | 0.06 | 0.80 | 0.47 | 0.45 | 0.98 | -5.57 | 0.44 |
|  b-cpe | -1.09 | 0.01 | 1.86 | 0.37 | 3.62 | 0.65 | -1.32 | 0.30 |
|  b-ham | 0.60 | 0.05 | 1.66 | 0.68 | 2.29 | 0.78 | 0.42 | 0.33 |
|  b-hep | 0.42 | 0.04 | -0.05 | 0.38 | 1.91 | 0.29 | -0.92 | 0.27 |
|  b-hex | 1.31 | 0.04 | 0.41 | 0.65 | 1.30 | 0.60 | -0.21 | 0.27 |
|  b-m4c | -2.27 | 0.01 | 2.18 | 0.48 | 2.62 | 0.55 | -3.13 | 0.30 |
|  b-m4t | -2.17 | 0.02 | 1.26 | 0.45 | 2.49 | 0.51 | -3.11 | 0.29 |
|  b-mch | -2.29 | 0.03 | -0.79 | 1.08 | 2.27 | 0.73 | -3.37 | 0.34 |
|  b-mha | 0.47 | 0.03 | 0.53 | 0.55 | 2.48 | 0.64 | 0.28 | 0.29 |
|  b-mo3 | -2.93 | 0.03 | -2.66 | 0.46 | -0.59 | 0.45 | -2.50 | 0.28 |
|  b-mo4 | -1.96 | 0.01 | -2.69 | 0.58 | -0.91 | 0.33 | -3.05 | 0.29 |
|  b-mp3 | -2.75 | 0.13 | -1.09 | 0.68 | 0.68 | 0.48 | -2.64 | 0.31 |
|  b-mp4 | -2.89 | 0.05 | -2.84 | 0.76 | 0.78 | 0.60 | -2.34 | 0.28 |
|  b-oam | -0.48 | 0.03 | 0.98 | 0.41 | 2.66 | 0.43 | -0.52 | 0.34 |
|  b-pb3 | -2.25 | 0.01 | -1.59 | 0.94 | 1.78 | 0.36 | -2.24 | 0.30 |
|  b-pb4 | -2.82 | 0.01 | -0.02 | 0.62 | -1.44 | 0.78 | -3.70 | 0.29 |
|  b-pha | -1.79 | 0.11 | -1.10 | 0.69 | -1.34 | 0.97 | -3.45 | 0.36 |
|  b-pnt | 1.89 | 0.53 | -0.79 | 1.01 | -0.51 | 0.84 | 0.40 | 0.31 |

Table: Experimental and predicted binding enthalpies (ΔH). {#tbl:dH-combined}

|  System | Experimental |  | SMIRNOFF99Frosst |  | GAFF v1.7 |  | GAFF v2.1 |  |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
|   | Mean | SEM | Mean | SEM | Mean | SEM | Mean | SEM |
|  a-bam | 0.59 | 0.05 | -2.82 | 0.53 | 0.02 | 0.63 | 0.11 | 0.45 |
|  a-but | 1.02 | 0.13 | -0.73 | 0.65 | -0.01 | 0.42 | 1.77 | 0.47 |
|  a-cbu | 0.73 | 0.05 | 0.75 | 0.28 | -0.17 | 0.54 | 1.21 | 0.36 |
|  a-chp | 0.48 | 0.24 | 1.04 | 0.48 | 0.63 | 0.37 | 1.16 | 0.41 |
|  a-coc | -2.30 | 1.18 | 2.02 | 0.53 | 1.07 | 0.40 | 2.82 | 0.40 |
|  a-cpe | 0.61 | 0.03 | 0.33 | 0.39 | -0.44 | 0.51 | 1.07 | 0.37 |
|  a-ham | 0.66 | 0.02 | 0.59 | 0.44 | -0.68 | 0.36 | 0.92 | 0.34 |
|  a-hep | 0.20 | 0.09 | 0.77 | 0.39 | 0.12 | 0.41 | 2.45 | 0.29 |
|  a-hex | 0.02 | 0.02 | 1.62 | 0.37 | 0.03 | 0.36 | 2.17 | 0.37 |
|  a-hp6 | 0.88 | 0.02 | 1.54 | 0.38 | 0.37 | 0.27 | 2.84 | 0.36 |
|  a-hpa | 0.52 | 0.02 | 1.45 | 0.48 | -0.50 | 0.37 | 1.35 | 0.34 |
|  a-hx2 | 0.78 | 0.06 | 1.49 | 0.37 | -0.25 | 0.37 | 1.77 | 0.35 |
|  a-hx3 | 0.35 | 0.05 | -0.13 | 0.61 | 1.23 | 0.40 | 1.58 | 0.36 |
|  a-mba | 0.92 | 0.07 | -0.27 | 0.51 | -0.57 | 0.44 | -0.06 | 0.43 |
|  a-mha | 0.68 | 0.02 | -0.29 | 0.58 | -0.73 | 0.30 | 0.85 | 0.40 |
|  a-mhp | 0.57 | 0.02 | 0.92 | 0.37 | -0.41 | 0.30 | 1.89 | 0.35 |
|  a-nmb | 0.88 | 0.06 | -0.85 | 0.50 | -0.86 | 0.29 | 0.61 | 0.35 |
|  a-nmh | 0.68 | 0.08 | 0.05 | 0.76 | -0.38 | 0.30 | 1.18 | 0.36 |
|  a-oam | 0.85 | 0.03 | 0.25 | 0.57 | -0.60 | 0.37 | 1.02 | 0.34 |
|  a-oct | 0.27 | 0.04 | 1.44 | 0.37 | -0.16 | 0.38 | 2.72 | 0.36 |
|  a-pam | 0.56 | 0.02 | -0.94 | 0.98 | -0.68 | 0.34 | 0.45 | 0.40 |
|  a-pnt | 0.15 | 0.01 | -0.51 | 0.43 | -0.12 | 0.38 | 1.84 | 0.36 |
|  b-ben | 0.87 | 0.08 | -2.40 | 0.83 | -1.07 | 0.87 | -1.15 | 0.31 |
|  b-cbu | -2.43 | 0.24 | -1.93 | 0.85 | -1.45 | 0.58 | -3.64 | 0.34 |
|  b-chp | -1.60 | 0.01 | -3.96 | 0.47 | -4.61 | 0.69 | -1.87 | 0.39 |
|  b-coc | -1.05 | 0.07 | -4.08 | 0.53 | -3.81 | 1.02 | -1.56 | 0.49 |
|  b-cpe | -1.96 | 0.01 | -5.43 | 0.51 | -7.17 | 0.72 | -4.60 | 0.40 |
|  b-ham | -3.09 | 0.09 | -4.19 | 0.71 | -4.29 | 0.82 | -4.56 | 0.38 |
|  b-hep | -3.81 | 0.18 | -3.36 | 0.47 | -5.25 | 0.45 | -3.23 | 0.35 |
|  b-hex | -3.59 | 0.05 | -3.34 | 0.70 | -3.77 | 0.66 | -3.38 | 0.32 |
|  b-m4c | -2.05 | 0.01 | -5.07 | 0.54 | -5.29 | 0.62 | -2.51 | 0.37 |
|  b-m4t | -2.37 | 0.02 | -5.08 | 0.49 | -5.99 | 0.57 | -3.22 | 0.33 |
|  b-mch | -1.89 | 0.03 | -2.90 | 1.10 | -5.58 | 0.78 | -2.70 | 0.38 |
|  b-mha | -3.03 | 0.08 | -4.00 | 0.60 | -4.62 | 0.69 | -4.94 | 0.34 |
|  b-mo3 | 0.77 | 0.03 | -0.20 | 0.60 | -2.14 | 0.61 | -0.29 | 0.34 |
|  b-mo4 | -0.55 | 0.01 | -1.50 | 0.71 | -2.19 | 0.46 | -0.45 | 0.36 |
|  b-mp3 | 1.29 | 0.14 | -1.94 | 0.74 | -3.16 | 0.56 | -0.35 | 0.37 |
|  b-mp4 | 0.70 | 0.05 | -0.19 | 0.83 | -3.55 | 0.69 | -0.72 | 0.35 |
|  b-oam | -3.11 | 0.12 | -4.33 | 0.50 | -5.26 | 0.53 | -4.73 | 0.41 |
|  b-pb3 | -1.27 | 0.01 | -1.90 | 0.99 | -4.64 | 0.47 | -2.34 | 0.34 |
|  b-pb4 | -0.78 | 0.02 | -3.60 | 0.71 | -1.90 | 0.85 | -1.01 | 0.37 |
|  b-pha | 0.09 | 0.12 | -2.14 | 0.76 | -1.21 | 1.01 | -0.52 | 0.41 |
|  b-pnt | -3.16 | 0.62 | -1.43 | 1.04 | -1.22 | 0.89 | -2.40 | 0.35 |

Table: Experimental and predicted binding entropies (−TΔS). {#tbl:TdS-combined}

## References {.page_break_before}

<!-- Explicitly insert bibliography here -->
<div id="refs"></div>
