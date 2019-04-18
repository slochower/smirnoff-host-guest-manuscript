---
author-meta:
- David R. Slochower
- Niel M. Henriksen
- John D. Chodera
- Michael K. Gilson
date-meta: '2019-04-18'
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
([permalink](https://slochower.github.io/smirnoff-host-guest-manuscript/v/81da787f585ba6e056236b020606ab5f4844fd45/))
was automatically generated
from [slochower/smirnoff-host-guest-manuscript@81da787](https://github.com/slochower/smirnoff-host-guest-manuscript/tree/81da787f585ba6e056236b020606ab5f4844fd45)
on April 18, 2019.
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



## Abstract {.page_break_before}


Designing ligands that bind their target with high affinity and specificity is a key step in small-molecule drug discovery. Yet accurate predictions of protein-ligand binding free energies are difficult and errors in the calculations can be traced to challenges adequately sampling conformational space, ambiguous protonation states, and other causes. Noncovalent complexes between a cavity-containing host molecule and drug-like guest molecules have emerged as powerful tools for modeling protein-ligand binding. Due to their small size and extensive experimental characterization, calculations of host-guest binding free energies, enthalpies, and entropies offer an opportunity to directly probe, and ultimately optimize, force fields.

The Open Force Field Initiative aims to create a modern, open software infrastructure for automatically generating and validating force fields using high-quality data sets. The first force field to arise out of this effort, named SMIRNOFF99Frosst, has one tenth the number of parameters of a typical general small molecule force field, such as GAFF, yet predicts binding thermodynamics that are on average, at least as accurate. Here, we report the results of free energy calculations on 43 $\alpha$ and $\beta$-cyclodextrin host-guest pairs for which experimental data are available. Our calculations were performed using the attach-pull-release method as implemented in the open source package, `pAPRika`. On binding free energies, the root mean square error of the predictions relative to experiment is 0.82 kcal/mol for SMIRNOFF99Frosst and 1.58 kcal/mol for GAFF version 2.1. These results suggest significant room for improvement in force fields, and will help create a transparent and robust method of evaluating future candidate parameter sets from the Open Force Field Group. Improving the performance of force fields for predicting binding affinities will help reduce the timescale and cost required to generate drug candidates.

## Introduction

## Methods

### Choice of host-guest system
In this study, we report the binding thermodynamics of 43 host-guest complexes (@fig:host-guest-pairs and Table @tbl:host-guests) computed using three different force fields. 
The complexes consist of either α- or β-cyclodextrin as host molecules and a series of small molecule guests containing ammonium, carboxylate, or cyclic alcohol functional groups.
Cyclodextrins are cyclic polymers consisting of six (αCD) or seven (βCD) glucose monomers in the shape of a truncated cone.
The equilibrium constants and standard molar enthalpies of binding for these 43 complexes have been measured using isothermal titration calorimetry [@1236RpaUv] and computationally in [@HVgz5rZq].
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

GAFF v2.1 parameters were applied in an identical manner to the GAFF v1.7 parameters, using the `tleap` program distributed with AmberTools18 and substituting `leaprc.gaff` for `leaprc.gaff2`in the `tleap` input file.
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


## Results and discussion

This results section is organized as follows. We first present a comparison of SMIRNOFF99Frosst and two iterations of the General AMBER Force Field (GAFF [@YmRgHfeU]) on predicting binding free energies (ΔG) and binding enthalpies (ΔH) of small molecule guests to α-cyclodextrin (αCD) and β-cyclodextrin (βCD). 
We then detail how the behaviors of guest molecules changes between force fields and finally we summarize the parameter differences between SMIRNOFF99Frosst and GAFF along with the effects of the parameter differences. 

### Binding free energies and enthalpies

SMIRNOFF99Frosst does about as well as, or even better than GAFF v1.7, depsite have far fewer numerical parameters on predicted ΔG and ΔH compared to the values measured with isothermal titration calorimetry. 
SMIRNOFF99Frosst has an overall agreement of under 1 kcal/mol on binding free energies and under 2 kcal/mol on binding enthalpies across the 43 host-guest systems ([@fig:dG-dH]).
Overall, the correlation between SMIRNOFF99Frosst and experiment is mediocre, ranging from an R$^2$ value of 0.34 to 0.54 for ΔG.
The results are more varied for ΔH with R$^2$ ranging from 0.09 to 0.54.
In particular, SMIRNOFF99Frosst underestimates the binding free energy and binding enthalpy of cyclic alcohols and mostly underestimates the binding entropy ([@fig:TdS]).
Guests containing ammonium or carboxylate functional groups appear to be equally over- and under-estimated for binding free energy.

Notably, SMIRNOFF99Frosst does better on αCD than βCD ([@fig:dG-dH-by-cyclodextrin]).

<div id="fig:dG-dH">
![](images/SMIRNOFF99Frosst-vs-Experiment-dG.png){#fig:somethingA width=3.5in}
![](images/SMIRNOFF99Frosst-vs-Experiment-dH.png){#fig:somethingB width=3.5in}

![](images/GAFF-v1.7-vs-Experiment-dG.png){width=3.5in}
![](images/GAFF-v1.7-vs-Experiment-dH.png){width=3.5in}

![](images/GAFF-v2.1-vs-Experiment-dG.png){width=3.5in}
![](images/GAFF-v2.1-vs-Experiment-dH.png){width=3.5in}

Comparison of calculated absolute binding free energies (ΔG) and binding enthalpies (ΔH) with experiment with SMIRNOFF99Frosst parameters (top), GAFF v1.7 parameters (middle), or GAFF v2.1 parameters (bottom) applied to both host and guest. The orange, blue, and purple coloring distinguish the functional group of the guest as an ammonium, alcohol, or carboxylate, respectively.
</div>

Likewise, GAFF v1.7 has very similar properties with an RMSE for ΔG of 0.88 kcal/mol and RMSE for ΔH of 2.54 kcal/mol.
Both SMIRNOFF99Frosst and GAFF v1.7 systematically underestimate the binding free energy for cyclic alcohols except for beta-cyclodextrin with cyclopentanol (b-cpe).

Overall, GAFF v2.1 has a larger RMSE than either SMIRNOFF99Frosst or GAFF v1.7 on binding free energies, but strikingly strong correlations with the experimental values across all three functional group classes.
Compared to SMIRNOFF99Frosst and GAFF v1.7, GAFF v2.1 uniformly overestimates both the binding free energy and binding enthalpy.

SMIRNOFF99Frosst does a great job predicting the binding free energy of αCD with alcohols, with four of the five points nearly falling on the line of identity.

[Show highlights here]{.banner .lightgrey}

Likewise, SMIRNOFF99Frosst does a great job with amines (?) with three of the four points falling nearly on the line of identity.

With βCD, on teh other hand, things are a little different: two of the three carboxylates are overestimated, ammoniums are great, but the alcohols are all over the place (two overestimated, two understimated.)

This difference is likely because... (?) of flexibility? (Is alpha more flexible than beta?)

### Guest preferences for primary and secondary binding

There are two orientations for binding: one where the primary functional group is interacting with the more narrow opening primary alcohols and one with the polar group oriented out of the wider, secondary opening.

The experimental data is a Boltzmann weighted ensemble of these two orientations.

<div id="fig:by-orientation-comparison">
![](images/SMIRNOFF99Frosst-vs-GAFF-v1.7-dG-color-by-orientation.png){width=3.5in}
![](images/SMIRNOFF99Frosst-vs-GAFF-v2.1-dG-color-by-orientation.png){width=3.5in}

Binding free energies (ΔG) with the primary orientation results colored in blue and secondary orientation results colored in green.
</div>

<div id="fig:by-orientation-highlight">
![](images/SMIRNOFF99Frosst-vs-GAFF-v1.7-dG-by-orientation-highlight.png){width=3.5in}
![](images/SMIRNOFF99Frosst-vs-GAFF-v2.1-dG-by-orientation-highlight.png){width=3.5in}

Binding free energies (ΔG) replotted from [@fig:by-orientation-comparison] with points whose difference in binding free energy along either axis is greater than 2 kcal/mol shown in color. Arrows point from primary to secondary. `This is backwards of the next plot.`
</div>

<div id="fig:by-orientation">
![](images/SMIRNOFF99Frosst-dG-by-orientation-all.png){width=3.5in}
![](images/GAFF-v1.7-dG-by-orientation-all.png){width=3.5in}
![](images/GAFF-v2.1-dG-by-orientation-all.png){width=3.5in}


The differences in binding free energy (ΔG) between guests leaving through either the primary or secondary face of αCD or βCD. Arrows point from the binding affinity for the secondary to the binding affinity for     the primary cavity. The systems with the largest ΔG difference are placed at the top.
</div>

### Guest preferences for αCD and βCD

<div id="fig:by-cyclodextrin">
![](images/SMIRNOFF99Frosst-vs-Experiment-dG-by-cyclodextrin.png){width=3.5in}
![](images/GAFF-v1.7-vs-Experiment-dG-by-cyclodextrin.png){width=3.5in}
![](images/GAFF-v2.1-vs-Experiment-dG-by-cyclodextrin.png){width=3.5in}


The differences in binding free energy (ΔG) between the same guest binding to either αCD or βCD. The binding affinity for αCD is circled in black.
</div>

### Functional group interactions

<div id="fig:ammonium">
![](images/SMIRNOFF99Frosst-vs-Experiment-dG-highlight-alpha-ammonium.png){width=3.5in}
![](images/SMIRNOFF99Frosst-vs-Experiment-dG-highlight-beta-ammonium.png){width=3.5in}

Binding free energy (ΔG) comparisons showing ammonium guests in color and highlighted. Darker colors indicate... 
</div>

<div id="fig:alcohols">
![](images/SMIRNOFF99Frosst-vs-Experiment-dG-highlight-alpha-alcohols.png){width=3.5in}
![](images/SMIRNOFF99Frosst-vs-Experiment-dG-highlight-beta-alcohols.png){width=3.5in}

Binding free energy (ΔG) comparisons showing alcohols guests in color and highlighted. Darker colors indicate... 
</div>

<div id="fig:carboxylates">
![](images/SMIRNOFF99Frosst-vs-Experiment-dG-highlight-alpha-carboxylates.png){width=3.5in}
![](images/SMIRNOFF99Frosst-vs-Experiment-dG-highlight-beta-carboxylates.png){width=3.5in}

Binding free energy (ΔG) comparisons showing alcohols guests in color and highlighted. Darker colors indicate... 
</div>

### Differences in force field parameters between SMIRNOFF99Frosst and GAFF

Next, we summarize the parameter differences between SMIRNOFF99Frosst, a decendent of parm@Frosst and GAFF v1.7 (released circa March 2015 according to `gaff.dat` distributed with AMBER16) and GAFF v2.1 (under active development).

The σ and ε parameters are identical between SMIRNOFF99Frosst and GAFF v1.7
Compared to GAFF v2.1, SMIRNOFF99Frosst has deeper well depths for oxygens and decreased σ values for the hydroxyl hydrogens.

<div id="fig:LJ">
![](images/SMIRNOFF99Frosst-vs-GAFF-v2.1-sigma.png){width=3.5in}
![](images/SMIRNOFF99Frosst-vs-GAFF-v2.1-epsilon.png){width=3.5in}

A comparison of Lennard-Jones nonbonded parameters for SMIRNOFF99Frosst and GAFF v2.1. Values that differ by more than 10% are labeled in red. Atom names refer to [@fig:atom-names]. 
</div>

Compared to GAFF v1.7, SMIRNOFF99Frosst tends to have slightly larger bond force constants, except for the $\ce{O-H}$ hydroxyl bond force constant, which is much stronger.
In GAFF v2.1, the $\ce{O-H}$ hydroxyl bond force constant is consistent with SMIRNOFF99Frosst, but the carbon-oxygen bond constants are weaker.
Equilibrium bond lengths are very similar ([@fig:bond-req]).

<div id="fig:bonds">
![](images/SMIRNOFF99Frosst-vs-GAFF-v1.7-bond-k.png){width=3.5in}
![](images/SMIRNOFF99Frosst-vs-GAFF-v2.1-bond-k.png){width=3.5in}

A comparison of bonded parameters for SMIRNOFF99Frosst, GAFF v1.7, and GAFF v2.1. Values that differ by more than 10% are labeled in red. Atom names refer to [@fig:atom-names]. 
</div>

Relative to GAFF v1.7 and GAFF v2.1, SMIRNOFF99Frosst has fewer unique angle parameters applied to αCD; several distinct parameters appear to be compressed into a single force constant, around 50 kcal/mol/rad^2^.
These parameters correspond to $\ce{C-C-C}$, $\ce{C-O-C}$, and $\ce{O-C-O}$ angles.
The $\ce{C-C-C}$ angles are primarily around the ring of the glucose monomer.
The $\ce{C-O-C}$ angles are both around the ring and between monomers (e.g., $\ce{C1-O1-C4}$ and $\ce{C1-O5-C5}$).
Weaker force constants for these parameters may  lead to increased flexibility.

<div id="fig:ang">
![](images/SMIRNOFF99Frosst-vs-GAFF-v1.7-ang-k.png){width=3.5in}
![](images/SMIRNOFF99Frosst-vs-GAFF-v2.1-ang-k.png){width=3.5in}

![](images/SMIRNOFF99Frosst-vs-GAFF-v1.7-ang-theta.png){width=3.5in}
![](images/SMIRNOFF99Frosst-vs-GAFF-v2.1-ang-theta.png){width=3.5in}

A comparison of angle parameters for SMIRNOFF99Frosst, GAFF v1.7, and GAFF v2.1. Values that differ by more than 10% are labeled in red. Precise atom names have been omitted to compress multiple angles with the same parameter values into a single label.
</div>

#### Dihedrals

[Include the table of dihedral differences here.]{.banner .lightgrey}

The dihedral parameters between SMIRNOFF99Frosst and GAFF v1.7 are very similar, with hte expceiton of... (Table @tbl:S99-vs-GAFF-v1.7).

|   |  |  |  |  |  | SMIRNOFF99Frosst | GAFF v1.7 |
| --- | --- | --- | --- | --- | --- | --- | --- |
|  Atom 1 | Atom 2 | Atom 3 | Atom 4 | Per | Phase | Height (kcal/mol) | Height (kcal/mol) |
|  H1 | C1 | C2 | O2 | 1 | 0 | 0.25 | -- |
|  H1 | C1 | C2 | O2 | 3 | 0 | 0.00 | 0.16 |

Table: Dihedral parameter differences between SMIRNOFF99Frosst and GAFF v1.7. {#tbl:S99-vs-GAFF-v1.7}

![The dihedral energy term applied to H1-C1-C2-O2 in SMIRNOFF99Frosst and GAFF v1.7. Atom names refer to [@fig:atom-names].](images/SMIRNOFF99Frosst-vs-GAFF-v1.7-H1-C2-C2-O2.png){#fig:dihedral width=3.5in}


The dihedral parameters in GAFF v2.1 differ significantly from those in SMIRNOFF99Frosst.

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

Table: Dihedral parameter differences between SMIRNOFF99Frosst and GAFF v2.1, where one dihedral has fewer or more periodicity terms than the correspeonding term in the other force field. {#tbl:S99-vs-GAFF-v2.1-missing}

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


...Inter-residue dihedrals...

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
![](images/SMIRNOFF99Frosst-vs-GAFF-v2.1-O1-C4-C3-O3.png){width=3.5in}
![](images/SMIRNOFF99Frosst-vs-GAFF-v2.1-O1-C4-C5-O5.png){width=3.5in}
![](images/SMIRNOFF99Frosst-vs-GAFF-v2.1-C1-O1-C4-C3.png){width=3.5in}

The dihedral energy term applied to three inter-residue dihedrals in SMIRNOFF99Frosst and GAFF v2.1. The third dihedral, affecting atoms O1<sub>n</sub>--C4<sub>n+1</sub>--C5<sub>n+1</sub>--O5<sub>n+1</sub> is quite significantly different, with multiple minima and and barrier heights. This dihedral partially controls the rotation of glucose monomers towards or away from the interior of the cyclodextrin cavity. Surprisingly, glucose monomers in GAFF v2.1 penetrate the open cavity much less frequently than in SMIRNOFF99Frosst, despite the lower and broader dihedral energy in GAFF v2.1. Atom names refer to [@fig:atom-names]. 
</div>


### Structural consequences of the force field parameter differences

In both SMIRNOFF99Frosst and GAFF v1.7, the average RMSD of βCD is between 2 and 2.5 Å over 43 μs of simulation. GAFF v2.1 is significanly more rigid, with an average RMSD less than 1.0 Å from the initial structure ([@fig:flexibility]).

![Top: Root mean square deviation (RMSD) of free βCD in the three force fields, all relative to the same initial structure. A 1000 frame moving average is plotted in red. Middle: to-view of the open cavity of βCD with no guest (200 snapshots over 1 μs). Bottom: side-view of the open cavity. The carbons are colored blue in SMIRNOFF99Frosst, green in GAFF v1.7, and purple in GAFF v2.1. Hydrogen atoms have been hidden for clarity.](images/cyclodextrin-flexibility.png){#fig:flexibility width=100%}

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">
 [<i class="fas fa-star"></i> Update font size in RMSD plots.]{.banner .lightgrey}

## Supporting Information {.page_break_before #SI}

![The primary (left) and secondary (right) cavity of αCD.](images/alphaCD-structure.png){#fig:cavity width=3.5in}

<div id="fig:TdS">
![](images/SMIRNOFF99Frosst-vs-Experiment-TdS.png){width=3.5in}
![](images/GAFF-v1.7-vs-Experiment-TdS.png){width=3.5in}
![](images/GAFF-v2.1-vs-Experiment-TdS.png){width=3.5in}

Comparison of calculated absolute binding entropies (−TΔS) with experiment with SMIRNOFF99Frosst parameters (top), GAFF v1.7 parameters (middle), or GAFF v2.1 parameters (bottom) applied to both host and guest. The orange, blue, and purple coloring distinguish the functional group of the guest as an ammonium, alcohol, or carboxylate, respectively.
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
![](images/SMIRNOFF99Frosst-vs-Experiment-dG-alpha.svg){width=3.5in}
![](images/SMIRNOFF99Frosst-vs-Experiment-dG-beta.svg){width=3.5in}

![](images/GAFF-v1.7-vs-Experiment-dG-alpha.svg){width=3.5in}
![](images/GAFF-v1.7-vs-Experiment-dG-beta.svg){width=3.5in}

![](images/GAFF-v2.1-vs-Experiment-dG-alpha.svg){width=3.5in}
![](images/GAFF-v2.1-vs-Experiment-dG-beta.svg){width=3.5in}

Binding free energies (ΔG) replotted from [@fig:dG-dH], with αCD points colored in blue and βCD points in grey (left) or αCD points in grey with βCD points colored in green (right).
</div>

![A minimized structure of αCD in the SMIRNOFF99Frosst force field.](images/cyclodextrin-snapshot.png){#fig:cyclodextrin-snapshot width=3.5in}

<div id="fig:bond-req">
![](images/SMIRNOFF99Frosst-vs-GAFF-v1.7-bond-req.png){width=3.5in}
![](images/SMIRNOFF99Frosst-vs-GAFF-v2.1-bond-req.png){width=3.5in}

A comparison of bond equilibrium lengths for SMIRNOFF99Frosst, GAFF v1.7, and GAFF v2.1. Atom names refer to [@fig:atom-names]. 
</div>

<div id="fig:additional-highlights-alcohols">
![](images/SMIRNOFF99Frosst-vs-GAFF-v1.7-dG-highlight-alpha-alcohols-by-orientation.png){width=3.5in}
![](images/SMIRNOFF99Frosst-vs-GAFF-v2.1-dG-highlight-alpha-alcohols-by-orientation.png){width=3.5in}

![](images/SMIRNOFF99Frosst-vs-GAFF-v1.7-dG-highlight-beta-alcohols-by-orientation.png){width=3.5in}
![](images/SMIRNOFF99Frosst-vs-GAFF-v2.1-dG-highlight-beta-alcohols-by-orientation.png){width=3.5in}

Binding free energy (ΔG) comparisons showing alcohols guests in color and highlighted.
</div>

<div id="fig:additional-highlights-ammonium">
![](images/SMIRNOFF99Frosst-vs-GAFF-v1.7-dG-highlight-alpha-ammonium-by-orientation.png){width=3.5in}
![](images/SMIRNOFF99Frosst-vs-GAFF-v2.1-dG-highlight-alpha-ammonium-by-orientation.png){width=3.5in}

![](images/SMIRNOFF99Frosst-vs-GAFF-v1.7-dG-highlight-beta-ammonium-by-orientation.png){width=3.5in}
![](images/SMIRNOFF99Frosst-vs-GAFF-v2.1-dG-highlight-beta-ammonium-by-orientation.png){width=3.5in}

Binding free energy (ΔG) comparisons showing ammonium guests in color and highlighted.
</div>

<div id="fig:additional-highlights-carboxylates">
![](images/SMIRNOFF99Frosst-vs-GAFF-v1.7-dG-highlight-alpha-carboxylates-by-orientation.png){width=3.5in}
![](images/SMIRNOFF99Frosst-vs-GAFF-v2.1-dG-highlight-alpha-carboxylates-by-orientation.png){width=3.5in}

![](images/SMIRNOFF99Frosst-vs-GAFF-v1.7-dG-highlight-beta-carboxylates-by-orientation.png){width=3.5in}
![](images/SMIRNOFF99Frosst-vs-GAFF-v2.1-dG-highlight-beta-carboxylates-by-orientation.png){width=3.5in}

Binding free energy (ΔG) comparisons showing carboxylates guests in color and highlighted.
</div>

## References {.page_break_before}

<!-- Explicitly insert bibliography here -->
<div id="refs"></div>
