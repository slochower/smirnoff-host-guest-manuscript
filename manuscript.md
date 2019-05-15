---
author-meta:
- David R. Slochower
- Niel M. Henriksen
- John D. Chodera
- David L. Mobley
- Michael K. Gilson
date-meta: '2019-05-15'
keywords:
- markdown
- publishing
- manubot
lang: en-US
title: Binding thermodynamics of host-guest systems with SMIRNOFF99Frosst 1.0.5 from
  the Open Force Field Initiative
...






<small><em>
This manuscript
([permalink](https://slochower.github.io/smirnoff-host-guest-manuscript/v/d62afc43fcc23000647bbd6aaa04250d361a01a6/))
was automatically generated
from [slochower/smirnoff-host-guest-manuscript@d62afc4](https://github.com/slochower/smirnoff-host-guest-manuscript/tree/d62afc43fcc23000647bbd6aaa04250d361a01a6)
on May 15, 2019.
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

+ **David L. Mobley**<br>
    ![ORCID icon](images/orcid.svg){.inline_icon}
    [0000-0002-1083-5533](https://orcid.org/0000-0002-1083-5533)
    · ![GitHub icon](images/github.svg){.inline_icon}
    [davidlmobley](https://github.com/davidlmobley)
    · ![Twitter icon](images/twitter.svg){.inline_icon}
    [davidlmobley](https://twitter.com/davidlmobley)<br>
  <small>
     Department of Pharmaceutical Sciences and Department of Chemistry, University of California, Irvine, CA 92697, USA
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

The Open Force Field Initiative aims to create a modern, open software infrastructure for automatically generating and validating force fields using high-quality data sets. The first force field to arise out of this effort, named SMIRNOFF99Frosst, has one tenth the number of parameters of a typical general small molecule force field, such as GAFF, yet predicts binding thermodynamics that are on average, at least as accurate. Here, we report the results of free energy calculations on 43 α and β-cyclodextrin host-guest pairs for which experimental data are available. Our calculations were performed using the attach-pull-release method as implemented in the open source package, `pAPRika`. On binding free energies, the root mean square error of the predictions relative to experiment is 0.91 kcal/mol, 95% CI [0.71, 1.13] for SMIRNOFF99Frosst and 1.68 kcal/mol, 95% CI [1.51, 1.84] for GAFF version 2.1. These results suggest significant room for improvement in force fields, and will help create a transparent and robust method of evaluating future candidate parameter sets from the Open Force Field Initiative. Improving the performance of force fields for predicting binding affinities will help reduce the timescale and cost required to generate drug candidates.

## Introduction

Accurate predictions of protein-ligand binding free energies are a key goal of computational chemistry.
Despite this, calculations of protein-ligand binding thermodynamics involve a number of challenging choices, including specifying the protonation state of ionizable residues, adding hydrogens or otherwise adjusting the initial protein structure, and placing the ligand in the binding pocket, for which there is no consensus in the computational chemistry community.
Predictions of protein-ligand absolute binding free energies have achieved root mean square errors around 1-2 kcal/mol for "well-behaved" systems [@9MLPuYAQ; @1CuDE1c2r; @mdqdy96N], with deviations an order of magnitude larger for some protein families [@15iR76Uc].
Relative free energy calculations on a series of congeneric ligands, using proprietary methods, have also achieved root mean square errors ~1 kcal/mol [@HQi6ihVB; @B182mNck].
A variety of techniques for computing absolute binding free energies in host-guest systems have shown accuracy of ~1 kcal/mol, as highlighted in the recent SAMPL5 and SAMPL6 blind challenges [@BGsUYQln; @9MLPuYAQ].
These techniques include both quantum and classical dynamics, employing a range of energy and solvation models, with some techniques having knowledge-based steps, docking, or clustering [@rOVoXhRJ; @Dn1HX5lD; @kj7fJ3fg; @l8KUmyk3; @1935a9V0d; @ku7PPPs; @ScmrI810; @bKuLAjgi].

[The above paragraph is dry and not engaging. It also does not connect with the next paragraph.]{.banner .lightgrey}

Here, we report the calculation of binding free energies, enthalpies, and entropies of drug-like guest molecules to α- and β-cyclodextrin host molecules, converged to within ~0.1 kcal/mol, using the attach-pull-release method.
These calculations, which are easier to sample and have been experimentally characterized using a variety of methods, offer an opportunity to benchmark---and ultimately optimize---new and existing force fields.
We compare the predictions of three force fields: GAFF v1.7 [@YmRgHfeU], GAFF v2.1, and SMIRNOFF99Frosst [@1HYTTY1PU; @OhpH7vfg].

SMIRNOFF99Frosst, released in late 2018, is the first force field produced by the Open Force Field Initiative.
SMIRNOFF99Frosst is derived from AMBER parm99 [@13wrQoS3l] and Merck's parm@Frosst [@168lWg0SB].
Instead of relying on atom types to assign force field parameters to compounds, which is the procedure followed by the `tleap` program that parameterizes molecules in AmberTools, SMIRNOFF99Frosst and the Open Force Field Toolkit use the local chemical environment of each atom to apply force field parameters using SMIRKS strings [@pOsXFMux].
This process simplifies and effectively uncouples the parameters for each term in the force field.
That is, the addition of a new Lennard-Jones parameter does not require the addition of new bonded, angle, and dihedral parameters involving the same atom. 
These factors lead to a much more lean force field specification; there are over 3000 lines of parameters in GAFF v1.7, over 6000 lines of parameters in GAFF v2.1, and just 322 lines of parameters in SMIRNOFF99Frosst version 1.0.5.

Thus far, SMIRNOFF99Frosst has been tested on hydration free energies of 642 small molecules, and the densities and dielectric constants of 45 pure organic liquids [@1HYTTY1PU].
Here we benchmark SMIRNOFF99Frosst using noncovalent binding thermodynamics using two flexible host molecules and thirty three guests containing three different functional group moieties.
We first show that SMIRNOFF99Frosst does about as well as the conventional force fields, GAFF v1.7 (on both absolute errors and correlation) and GAFF v2.1 (on absolute errors), predicting experimental binding free energies, enthalpies, and entropies.
We then characterize the differences in host conformations sampled by SMIRNOFF99Frosst compared to the other force fields.

## Methods

### Choice of host-guest systems
In this study, we report the binding thermodynamics of 43 host-guest complexes (Figure @fig:host-guest-pairs and Table @tbl:host-guests) computed using three different force fields. 
The complexes consist of either α- or β-cyclodextrin as host molecules and a series of small molecule guests containing ammonium, carboxylate, or cyclic alcohol functional groups.
Cyclodextrins are cyclic polymers consisting of six (αCD) or seven (βCD) glucose monomers in the shape of a truncated cone.
The equilibrium constants and standard molar enthalpies of binding for these 43 complexes have been measured using isothermal titration calorimetry (ITC) and nuclear magnetic resonance spectroscopy (NMR) [@1236RpaUv] and computationally in [@HVgz5rZq].
As in Henriksen, *et al.* [@HVgz5rZq], only a single stereoisomer was considered for the 1-methylammonium guests because it was not clear whether a mixture or a pure solution was used in Rekharsky, et al. [@1236RpaUv], and the ΔG difference between each stereoisomer is expected to be < 0.1 kcal/mol [@g7xxBB7m].

![Structures of the two cyclodextrin hosts and 33 guest molecules in this study which together comprise 43 unique host-guest pairs.](images/host-guest-pairs.png){#fig:host-guest-pairs}

|  Host-guest ID | Host | Guest | Charge |
| --- | --- | --- | --- |
|  a-bam | αCD | 1-butylamine | +1 |
|  a-nmb | αCD | n-methylbutylamine| +1 |
|  a-mba | αCD | 1-methylbutylamine^a^ | +1 |
|  a-pam | αCD | 1-pentylamine| +1 |
|  a-ham | αCD | 1-hexylamine| +1 |
|  a-nmh | αCD | n-methylhexylamine | +1 |
|  a-mha | αCD | 1-methylhexylamine^a^ | +1 |
|  a-hpa | αCD | 1-heptylamine | +1 |
|  a-mhp | αCD | 1-methylheptylamine^b^ | +1 |
|  a-oam | αCD | 1-octylamine | +1 |
|  b-ham | βCD | 1-hexylamine | +1 |
|  b-mha | βCD | 1-methylhexylamine^a^ | +1 |
|  b-oam | βCD | 1-octylamine | +1 |
|  a-cbu | αCD | cyclobutanol | 0 |
|  a-cpe | αCD | cyclopentanol | 0 |
|  a-chp | αCD | cycloheptanol | 0 |
|  a-coc | αCD | cyclooctanol | 0 |
|  b-cbu | βCD | cyclobutanol | 0 |
|  b-cpe | βCD | cyclopentanol | 0 |
|  b-mch | βCD | 1-methylcyclohexanol | 0 |
|  b-m4c | βCD | cis-4-methylcyclohexanol | 0 |
|  b-m4t | βCD | trans-4-methylcyclohexanol | 0 |
|  b-chp | βCD | cycloheptanol | 0 |
|  b-coc | βCD | cyclooctanol | 0 |
|  a-but | αCD | butanoate | -1 |
|  a-pnt | αCD | pentanoate | -1 |
|  a-hex | αCD | hexanoate | -1 |
|  a-hx2 | αCD | trans-2-hexenoate | -1 |
|  a-hx3 | αCD | trans-3-hexenoate | -1 |
|  a-hep | αCD | heptanoate | -1 |
|  a-hp6 | αCD | 6-heptenoate | -1 |
|  a-oct | αCD | octanoate | -1 |
|  b-pnt | βCD | pentanoate | -1 |
|  b-hex | βCD | hexanoate | -1 |
|  b-hep | βCD | heptanoate | -1 |
|  b-ben | βCD | benzoate | -1 |
|  b-pha | βCD | phenylacetate | -1 |
|  b-mp3 | βCD | 3-methylphenylacetate | -1 |
|  b-mp4 | βCD | 4-methylphenylacetate | -1 |
|  b-mo3 | βCD | 3-methoxyphenylacetate | -1 |
|  b-mo4 | βCD | 4-methoxyphenylacetate | -1 |
|  b-pb3 | βCD | 3-phenylbutanoate | -1 |
|  b-pb4 | βCD | 4-phenylbutanoate | -1 |

Table: The 43 unique host-guest combinations used in this study. The formal charge of each guest is listed in brackets. The guest names correspond to Tables 1 and 2 in Rekharsky et al. [@1236RpaUv]. ^a^ Only the *R* enantiomer was considered. ^b^ Only the *S* enantiomer was considered. {#tbl:host-guests}

### Application of force field parameters

We sought to compare force fields directly, and as such, attempted to minimize additional differences between the simulations with each force field.
In all simulations, we applied AM1-BCC [@LxrgIkt0; @BkLoOd0N] partial atomic charges to both the host and guest molecules using the `antechamber` program.
The host charges were calculated using a single glucose molecule with methoxy caps on the O1 and O4 alcohols (Figure @fig:atom-names); each glucose monomer in the cyclodextrin polymer has identical charges.
We used TIP3P water [@chrX4HGh] and Joung-Cheatham monovalent ion parameters [@uZnQBwCt] in each simulation set.

![Atom names (left) and GAFF atom types (right) for a glucose monomer in αCD shown with two flanking monomers. The remaining three glucose monomers are hidden for clarity.](images/atom-names.png){width="100%" #fig:atom-names}

GAFF v1.7 bond, angle, torsion, and Lennard-Jones parameters were applied using the `tleap` program distributed with AmberTools16.

GAFF v2.1 parameters were applied in an identical manner to the GAFF v1.7 parameters, using the `tleap` program distributed with AmberTools18 and substituting `leaprc.gaff` for `leaprc.gaff2` in the `tleap` input file.
In GAFF v2.1, the bond and angle parameters have been updated to reproduce small molecule geometries obtained from high-level quantum mechanical calculations.
The force constants for the bond and angle parameters were tuned to reproduce the vibrational spectra of over 600 molecules.
The torsion parameters were optimized to reproduce the rotational potential energy surface of 400 model compounds.
Finally, the Lennard-Jones coefficients were redeveloped to reproduce interaction energies and pure liquid properties.
**See [#7](https://github.com/slochower/smirnoff-host-guest-manuscript/issues/7).**

To apply SMIRNOFF99Frosst parameters, we followed a [multistep process](https://github.com/slochower/smirnoff-host-guest/blob/master/02-convert-APR-files.ipynb), beginning with the prepared GAFF v1.7 files.
The host and guest molecules were parameterized with the Open Force Field Toolkit version 0.0.3, SMIRNOFF version 1.0, and SMIRNOFF99Frosst version 1.0.5.
Once parameterized with SMIRNOFF99Frosst, the toplogy and coordinates for the host-guest complex was combined with the solvent and ions, which retained their TIP3P water parameters and Joung-Cheatham ion parameters, respectively.
This was accomplished by the `ParmEd` program [@T7iFp9ei], which enables saving the OpenMM system created by the Open Force Field Toolkit in AMBER-format `.prmtop` and `.inpcrd` files.
**See [#8](https://github.com/slochower/smirnoff-host-guest-manuscript/issues/8).**

### Thermodynamic calculation
We used the attach-pull-release (APR) method as implemented in the open source package pAPRika version 0.0.3, to calculate absolute binding free energies.
A complete description of the APR method has been provided in the literature [@1935a9V0d; @W9FLyOZr; @GA1AFcUw; @1HWPx2yMR].
The attachment and release phases consisted of 15 independent windows.
During the attachment phase, the force constants on the host and guest are scaled by a $\lambda$ parameter that goes from $\lambda = 0$, at which point all restraints are turned off, to $\lambda = 1$, at which point all restraints are at their maximum force constant. 
The $\lambda$ windows are more densely spaced where the force constant is smaller to improve sampling along highly curved regions of the potential of mean force.
Conformational restraints were applied between neighboring glucose units of the cyclodextrin to limit the incursion of monomers into the host cavity. 
These restraints were applied along the pseudodihedrals $\ce{{O5}_n-{C1}_n-{O1}_n-{C4}_{n+1}}$ and $\ce{{C1}_n-{O1}_n-{C4}_{n+1}-{C5}_{n+1}}$ to improve convergence and sampling of the bound state (Figure @fig:atom-names for atom names). 
To further improve sampling, we applied a hard wall restraint that confined the guest molecule to within a sphere of 12.3 and 13.5 Å of αCD and βCD, respectively, during the bound state.
The release phase is the conceptual reverse of the attach phase, in which the conformational restraints on the host are gradually turned off ($\lambda =1 \rightarrow 0$) in the absence of the guest.
This explicit release phase is performed once for αCD and once for βCD. 
Finally, an analytic correction is performed to compute the work of moving the guest from the restricted volume enforced by the APR restraints to standard state at 1 M concentration. 

The pulling phase consisted of 45 independent, equally spaced windows. 
During the pulling phase, the $\lambda$ parameter represents the target value of a distance restraint with constant force constant.
This target distance is increased uniformly in 45 increments of 0.4 Å, yielding windows that separate the host and guest by 18 Å over the course of the calculation.

Due to the asymmetry of the primary and secondary alcohols of cyclodextrin (Figure @fig:cavity), and the lack of symmetry of the small molecule guests, there are generally two distinct binding poses that do not interconvert during the simulation timescale.
To account for this effect, we separately compute the binding free energy and enthalpy for each orientation [@1935a9V0d] and combine the results to produce a single value for each host-guest combination using the following equation:

\begin{equation}
\Delta G = -RT \ln(\exp(-\beta \Delta G_\text{primary}) + \exp(-\beta \Delta G_\text{secondary})).
\end{equation}

In this manuscript, we refer to calculations whereby the guest is pulled out of the primary face of cyclodextrin with a `-p` suffix and calculations whereby the guest is pulled out of the secondary orientation with a `-s` suffix.

Thermodynamic integration was used to compute the binding free energy (ΔG). 
The binding enthalpy (ΔH) was computed as the difference in mean potential energy of the bound state (in the absence of any restraints) and the unbound state (where the guest is held far away from the host, but the conformational restraints on the host are disabled).
The binding entropy (ΔS) was computed by subtraction using ΔG and ΔH.

### Simulations
Simulations were performed with the `pmemd.cuda` module of AMBER 16 (calculations with the GAFF v1.7 force field) and AMBER 18 (calculations with the GAFF v2.1 and SMIRNOFF99Frosst force fields) molecular dynamics software [@197xzzCJg]. 
Each window for each system was independently solvated and simulated.
The host-guest simulations using GAFF v1.7 were previously published in Henriksen, *et al.*  [@HVgz5rZq] and are described in additional detail therein.
Solvation consisted of 2000 TIP3P waters for the αCD systems and 2210 waters for the βCD systems in an orthorhombic box. 
The host and guest were oriented via non-interacting dummy atoms along the simulation box $z$ axis, to create a rectangular periodic box, reducing the amount of solvent required for the calculation.
Each simulation contained enough Na^+^ or Cl^-^ ions to neutralize the host-guest complex and an additional 50 mM NaCl to match the experimental conditions in [@1236RpaUv]. 
In the GAFF simulations, hydrogen mass repartitioning [@IGZ99oJ8] was used to adjust the mass of hydrogen by a factor of 3, keeping the total molecular weight of each molecule constant, enabling a simulation timestep of 4 fs. 
Equilibration consisted of 50,000 steps of energy minimization, 100 ps of heating from 0 to 300 K, followed by 2000 ps of additional NPT simulations. 
A Langevin thermostat, the Monte Carlo barostat, a nonbonded cutoff of 9 Å and default PME parameters, were used for the NPT simulations.
An isotropic analytic correction to the Lennard-Jones interactions is applied beyond the cutoff distance [@sMVo0eOR].
Production NPT simulations were run for a minimum of 2.5 ns and maximum of 50 ns per window, except for the windows used to calculate the enthalpy, which were simulated for 1 μs. 
In the GAFF v1.7 and GAFF v2.1 simulations, the exact length of each window's simulation was determined by the uncertainty in the work done in each λ window. 
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

Excluding the first and last window, the average window length was 11.8 ns and 5.39 ns for GAFF v1.7 and GAFF v2.1 simulations, respectively.
In the interest of simplicity, SMIRNOFF99Frosst production NPT simulations were run for 10 ns per window, except for the first and last window which ran for 1 μs to calculate ΔH.

### Statistics
The uncertainty in the work done by each restraint in each simulation window, $\left\langle \frac{\partial U}{\partial \lambda_i} \right\rangle_\text{SEM}$, was estimated using blocking analysis [@htck51Lp].
Based on these values, resampling with replacement was used to create 100,000 hypothetical $\frac{\partial U}{\partial \lambda}$ curves.
The standard deviation in the integrated work, $\int \frac{\partial U}{\partial \lambda_i}\,\mathrm{d}\lambda_i$, of the 100,000 curves was used to determine the standard error of the mean of ΔG.
The standard error of the mean of ΔH was computed from the standard error of the mean of the total potential energy in each end point window, estimated using blocking analysis, added in quadrature.
The standard error of the mean −TΔS was calculated using the uncertainties in ΔG and ΔH added in quadrature.

For each force field, we computed the root mean squared error (RMSE), mean signed error (MSE), the coefficient of determination (R^2^), Kendall's rank correlation coefficient (τ), and the slope and intercept of the computed properties relative to the experimental values.
We also test how the force fields compare to each other using these statistics.
Comparisons with experiment have 43 data points, for the 43 unique host-guest complexes listed in Table @tbl:host-guests; comparisons between force fields have 86 data points, representing the two separate calculations performed for each host-guest pair.

The overall RMSE and R^2^ values for each comparison are reported as the mean with the 95% confidence interval in brackets.
These values are estimated by using the uncertainties assigned to each data point to create 100,000 hypothetical graphs through resampling with replacement.
The R^2^ values for each functional group subset is also reported in the bottom right corner in each graph.


## Results

This results section is organized as follows. We first present a comparison of SMIRNOFF99Frosst and two iterations of the General AMBER Force Field (GAFF [@YmRgHfeU]) on predicting binding free energies (ΔG) and binding enthalpies (ΔH) of small molecule guests to α-cyclodextrin (αCD) and β-cyclodextrin (βCD). 
We then detail how the conformational preferences of guest molecules changes between force fields and finally we summarize the parameter differences between SMIRNOFF99Frosst and GAFF along with the effects of the parameter differences. 

### Comparison with experimental binding free energies, enthalpies, and entropies

#### Binding free energies

Despite having far fewer numerical parameters, SMIRNOFF99Frosst does about as well as GAFF v1.7 and better than GAFF v2.1 on predicting ΔG compared to values measured using ITC or NMR.
SMIRNOFF99Frosst has an overall deviation from experiment of 0.91 kcal/mol, 95% CI [0.71, 1.13] on binding free energies across the 43 host-guest systems, compared to 0.88 kcal/mol, 95% CI [0.71, 1.08] for GAFF v1.7 and 1.68 kcal/mol, 95% CI [1.51, 1.85] for GAFF v2.1 (Figures @fig:dG-dH, @fig:TdS, Table @tbl:statistics, Table @tbl:dG-combined, Table @tbl:dH-combined, and Table @tbl:TdS-combined)
On the whole, GAFF v1.7 agrees well with SMIRNOFF99Frosst (Figure @fig:dG-by-orientation); the overall root mean squared error (RMSE) and mean signed error (MSE) between the methods is 0.80 kcal/mol, 95% CI [0.58, 1.04] and -0.47 kcal/mol, 95% CI [-0.67, -0.28], respectively.
Both SMIRNOFF99Frosst and GAFF v1.7 systematically underestimate the ΔG for cyclic alcohols.
GAFF v2.1 significantly overestimates the binding of all compounds by more than 1.5 kcal/mol, with a mean signed error of -1.56 kcal/mol, 95% CI [-1.74, -1.37].
Despite this, GAFF v2.1 has a strikingly strong correlation with experiment across all functional group classes.
This may be traced to differences in host conformations sampled by GAFF v2.1, which indicate a more consistently open cyclodextrin "pocket" for guests to bind (Figure @fig:flexibility).

#### Binding enthalpies and entropies

On both binding enthalpies and entropies, SMIRNOFF99Frosst and GAFF v1.7 agree reasonably well with each other (ΔH RMSE = 1.65 kcal/mol, 95% CI [1.32, 2.02], −TΔS RMSE = 1.59 kcal/mol, 95% CI [1.24, 1.96]) (Figure @fig:dG-by-orientation).
The deviations between SMIRNOFF99Frosst and GAFF v2.1 are higher for ΔH (RMSE = 2.96 kcal/mol, 95% CI [2.52, 3.42]) and lower for −TΔS (RMSE = 1.55 kcal/mol, 95% CI [1.25, 1.85])
On binding enthalpies, SMIRNOFF99Frosst agrees the best with experiment (RMSE = 1.85 kcal/mol, 95% CI [1.40, 2.29]), followed by GAFF v2.1 (RMSE = 2.21 kcal/mol, 95% CI [1.77, 2.66]), and then GAFF v1.7 (RMSE = 2.54 kcal/mol, 95% CI [2.08, 2.99]), 
In some cases, GAFF v1.7 underestimates ΔH by over 3 kcal/mol and up to 5 kcal/mol (`b-chp`).

On binding entropies, GAFF v2.1 has the lowest RMSE compared to experiment (RMSE = 1.47 kcal/mol, 95% CI [1.09, 1.99]), followed by SMIRNOFF99Frosst (RMSE = 1.90 kcal/mol, 95% CI [1.49, 2.32]), and GAFF v1.7 (RMSE = 2.21 kcal/mol, 95% CI [1.74, 2.68]) (Figure @fig:TdS).  
All force fields perform poorly predicting −TΔS for carboxylate guests. 
It is worth noting that all force fields predict a much smaller entropic component of binding for `a-coc` by 3-5 kcal/mol, which does not easily fit inside the primary cavity of cyclodextrin (Figure @fig:by-orientation).

![Comparison of calculated absolute binding free energies (ΔG) and binding enthalpies (ΔH) with experiment with SMIRNOFF99Frosst parameters (top), GAFF v1.7 parameters (middle), or GAFF v2.1 parameters (bottom) applied to both host and guest. The orange, blue, and purple coloring distinguish the functional group of the guest as an ammonium, alcohol, or carboxylate, respectively.](images/dG-dH.png){#fig:dG-dH}


|      |      | RMSE |      |  MSE |      |   R² |      | Slope |      | Intercept |      | 
|  ---  |  ---  |  ---  |  ---  |  ---  |  ---  |  ---  |  ---  |  ---  |  ---  |  ---  |  ---  | 
| ΔG | SMIRNOFF99Frosst | 0.91 | [0.71, 1.13] | -0.01 | [-0.29, 0.26] | 0.34 | [0.12, 0.56] | 0.49 | [0.26, 0.72] | -1.55 | [-0.80, -2.29] | 
| ΔG | GAFF v1.7 | 0.88 | [0.71, 1.08] | 0.46 | [0.23, 0.69] | 0.54 | [0.33, 0.71] | 0.69 | [0.47, 0.91] | -0.47 | [0.22, -1.16] | 
| ΔG | GAFF v2.1 | 1.68 | [1.51, 1.85] | -1.56 | [-1.74, -1.37] | 0.82 | [0.61, 0.92] | 1.19 | [0.96, 1.34] | -1.00 | [-0.52, -1.62] | 
| ΔH | SMIRNOFF99Frosst | 1.85 | [1.40, 2.30] | 0.77 | [0.26, 1.28] | 0.44 | [0.21, 0.66] | 0.85 | [0.54, 1.19] | 0.41 | [1.55, -0.50] | 
| ΔH | GAFF v1.7 | 2.54 | [2.08, 2.99] | 1.84 | [1.31, 2.37] | 0.39 | [0.17, 0.62] | 0.80 | [0.47, 1.18] | 1.36 | [2.66, 0.31] | 
| ΔH | GAFF v2.1 | 2.21 | [1.77, 2.66] | -1.64 | [-2.10, -1.20] | 0.75 | [0.57, 0.87] | 1.38 | [1.15, 1.63] | -0.69 | [0.15, -1.43] | 
| -TΔS | SMIRNOFF99Frosst | 1.90 | [1.49, 2.32] | -0.78 | [-1.29, -0.25] | 0.40 | [0.14, 0.63] | 0.90 | [0.51, 1.29] | -0.83 | [-0.34, -1.34] | 
| -TΔS | GAFF v1.7 | 2.21 | [1.74, 2.68] | -1.38 | [-1.90, -0.85] | 0.43 | [0.16, 0.68] | 0.95 | [0.54, 1.38] | -1.41 | [-0.95, -1.89] | 
| -TΔS | GAFF v2.1 | 1.47 | [1.09, 2.00] | 0.08 | [-0.35, 0.54] | 0.60 | [0.29, 0.80] | 1.14 | [0.75, 1.47] | 0.15 | [0.57, -0.27] | 

Table: Predicted thermodynamic properties for each force field relative to experiment. {#tbl:statistics}

### Guest preferences for binding in the primary or secondary cyclodextrin cavity

The asymmetry of the hosts and the guests leads to two distinct bound states for each host-guest pair: one where the primary functional group of the guest interacts with the primary alcohols of the host and a second conformation where the primary functional group of the guest interacts with the secondary alcohols (@fig:cavity).

The difference in binding free energy between either orientation (ΔΔG<sub>orientation</sub>) can be large, around ~2 kcal/mol for SMIRNOFF99Frosst and GAFF v1.7 and ~5 kcal/mol for GAFF v2.1.
SMIRNOFF99Frosst predicts the largest ΔΔG<sub>orientation</sub> for the ammonium-containing butylamine and pentylamine with αCD (@fig:by-orientation), with the primary orientation being more favorable.
GAFF v1.7 predicts a large ΔΔG<sub>orientation</sub> for the cyclic alcohols cyclooctanol and  cycloheptanol, with the secondary orientation having a more favorable ΔG.
This effect is even more apparent with GAFF v2.1 where the ΔΔG<sub>orientation</sub> for `a-chp` and `a-coc` is greater than 4 kcal/mol.
This effect is due, at least in part, to sampling challenges in the bound state for very large guests (Figure @fig:by-orientation, bottom right), especially in the narrow primary cavity of the smaller α-cyclodextrin.

![The differences in binding free energy (ΔG) between guests in either the primary or secondary orientation of αCD or βCD. Arrows point from ΔG for the secondary to ΔG for the primary cavity. The systems are arranged in descending order by greatest difference in ΔG between orientations.
Bottom right: An overlay of cyclooctanol bound state positions (400 snapshots over 1 μs) with αCD in GAFF v2.1.](images/by-orientation.png){#fig:by-orientation}

### Guest preferences for αCD and βCD

Ten guests in the data set bind both αCD and βCD.
These ten guests show different patterns of binding between the two host molecules.
For example, SMIRNOFF99Frosts underestimates the binding free energy of cyclooctanol both orientations by the same amount (Figure @fig:by-cyclodextrin).
However, despite underestimating the binding free energy of cyclobutanol for αCD by ~0.7 kcal/mol,  the binding affinity prediction for βCD is very slightly overestimated by ~0.3 kcal/mol (Table @tbl:dG-combined).
Very similar patterns are observed for GAFF v1.7 and both force fields appear to perform better overall on binding affinities to αCD compared to βCD (Figure @fig:dG-dH-by-cyclodextrin).

As is the case with the difference in binding free energy between guest orientations, the difference in binding free energy between host molecules using GAFF v2.1 is large.
There does not appear to be a clear difference in the accuracy of the predictions for αCD versus βCD (Figure @fig:dG-dH-by-cyclodextrin).

![Shown are the αCD and βCD binding free energies for each guest, highlighting the differences in binding to the two hosts. The binding affinity for αCD is circled in black. Thin colored lines connect data points for the same guest. Color is used purely to distinguish among the guests.](images/by-cyclodextrin.png){#fig:by-cyclodextrin}

### Trends by guest functional group

SMIRNOFF99Frosst does a good job (MSE = -0.10 kcal/mol, 95% CI [-0.54, 0.30] and RMSE = 0.76 kcal/mol, 95% CI [0.43, 1.12]) estimating the binding free energy of ammonium-containing guests to both αCD and βCD (Figure @fig:ammonium).
Shorter chain molecules bind less strongly and the same guest binds more strongly to αCD than βCD.

[I need to include the functional group tables here. I will put the SMIRNOFF99Frosst vs. Experimental tables here and the others in the SI.]{.banner .lightgrey}

![Binding free energy (ΔG) comparisons showing ammonium guests in color and highlighted. Darker colors indicate shorter chain molecules. Non-highlighted guests are shown as smaller gray circles.](images/ammonium.png){#fig:ammonium}

SMIRNOFF99Frosst performs reasonably on cyclic alcohols (MSE = 0.70 kcal/mol, 95% CI [0.22, 1.21] and RMSE = 1.07 kcal/mol, 95% CI [0.66, 1.58]) (Figure @fig:alcohols).
The predictions for αCD are uniformly underestimated while those for βCD are mostly under-predicted.
The predicted ΔG for cyclooctanol with αCD is particularly poor due to a poor fit in the bound state (Figure @fig:by-orientation).

[Should say something here about cylooctanol predictions *and* experiment being poor because it does not fit well, especially in αCD]{.banner .lightgrey}

![Binding free energy (ΔG) comparisons showing alcohols guests in color and highlighted. Darker colors indicate smaller molecules. Non-highlighted guests are shown as smaller gray circles.](images/alcohols.png){#fig:alcohols}

The binding affinity of carboxylate guests to both αCD and βCD is well characterized by SMIRNOFF99Frosst (MSE = -0.36 kcal/mol, 95% CI [-0.73, -0.01] and RMSE = 0.87 kcal/mol, 95% CI [0.58, 1.16]) (Figure @fig:carboxylates).

![Binding free energy (ΔG) comparisons showing alcohols guests in color and highlighted. Darker colors indicates smaller molecules. Non-highlighted guests are shown as smaller gray circles.](images/carboxylates.png){#fig:carboxylates}

In all cases, GAFF v1.7 tends to predict slightly weaker binding than SMIRNOFF99Frosst whereas GAFF v2.1 predicts much stronger binding for these compounds (Figures @fig:additional-highlights-ammonium, @fig:additional-highlights-alcohols, and @fig:additional-highlights-carboxylates).

### Differences in force field parameters between SMIRNOFF99Frosst and GAFF

Next, we summarize the parameter differences among SMIRNOFF99Frosst, a descendant of parm99; GAFF v1.7 (released circa March 2015 according to `gaff.dat` distributed with AMBER16); and GAFF v2.1 (which is under active development) on the parameters applied to αCD.

The σ and ε parameters are identical between SMIRNOFF99Frosst and GAFF v1.7.
Note, that hydroxyl hydrogens are assigned σ = 0 Å and ε = 0 kcal/mol in both GAFF v1.7 and SMIRNOFF99Frosst v1.0.5, but later versions of SMIRNOFF99Frosst adopt [small σ and ε](https://github.com/openforcefield/smirnoff99Frosst/blob/4ca43af6241a97edb356586f3f83ac21afcdff65/smirnoff99Frosst/smirnoff99Frosst.offxml#L315) values based on a similiar atom type in parm@Frosst [@Q2dwH7Dq; @cT3I9uDT; @10E0XdByV].
Compared to GAFF v2.1, SMIRNOFF99Frosst has deeper well depths for oxygens and decreased σ values for the hydroxyl hydrogens (Figure @fig:LJ).

#### Lennard-Jones
![A comparison of Lennard-Jones nonbonded parameters for SMIRNOFF99Frosst and GAFF v2.1. Values that differ by more than 10% are labeled in red. Atom names refer to Figure @fig:atom-names.](images/LJ.png){width="100%" #fig:LJ}

#### Bonded parameters

Compared to GAFF v1.7, SMIRNOFF99Frosst tends to have slightly larger bond force constants, except for the O--H hydroxyl bond force constant, which is much stronger.
In GAFF v2.1, the O--H hydroxyl bond force constant is consistent with SMIRNOFF99Frosst, but the carbon-oxygen bond constants are weaker.
Equilibrium bond lengths are very similar (Figure @fig:bond-req).

![A comparison of bond force constants for SMIRNOFF99Frosst, GAFF v1.7, and GAFF v2.1. Values that differ by more than 10% are labeled in red. Atom names refer to Figure @fig:atom-names.](images/bonds.png){width="100%" #fig:bonds}

#### Angle parameters

Relative to GAFF v1.7 and GAFF v2.1, SMIRNOFF99Frosst has fewer unique angle parameters applied to αCD; several distinct parameters appear to be compressed into a single force constant, around 50 kcal/mol/rad^2^ (Figure @fig:angles).
These parameters correspond to $\ce{C-C-C}$, $\ce{C-O-C}$, and $\ce{O-C-O}$ angles.
The $\ce{C-C-C}$ angles are primarily around the ring of the glucose monomer.
The $\ce{C-O-C}$ angles are both around the ring and between monomers (e.g., $\ce{C1-O1-C4}$ and $\ce{C1-O5-C5}$).
Weaker force constants for these parameters may lead to increased flexibility.

![A comparison of angle parameters for SMIRNOFF99Frosst, GAFF v1.7, and GAFF v2.1. Values that differ by more than 10% are labeled in red. Precise atom names have been omitted to compress multiple angles with the same parameter values into a single label.](images/angles.png){width="100%" #fig:angles}

#### Dihedral parameters

The dihedral parameters between SMIRNOFF99Frosst and GAFF v1.7 are extremely similar (where differences occur, they are in the second or third decimal place), with the exception of the $\ce{H1-C1-C2-O2}$ parameter (Figure @fig:atom-names, GAFF atom types `h2-c3-c3-oh`, SMIRKS pattern `[#1:1]-[#6X4:2]-[#6X4:3]-[#8X2:4]`), for which SMIRNOFF99Frosst applies a dihedral with periodicity = 1 and GAFF v1.7 applies a dihedral with a periodicity of 3 (Table @tbl:S99-vs-GAFF-v1.7 and Figure @fig:dihedral).

|   |  |  |  |  |  | SMIRNOFF99Frosst | GAFF v1.7 |
| --- | --- | --- | --- | --- | --- | --- | --- |
|  Atom 1 | Atom 2 | Atom 3 | Atom 4 | Per | Phase | Height (kcal/mol) | Height (kcal/mol) |
|  H1 | C1 | C2 | O2 | 1 | 0 | 0.25 | -- |
|  H1 | C1 | C2 | O2 | 3 | 0 | 0.00 | 0.16 |

Table: Dihedral parameter differences between SMIRNOFF99Frosst and GAFF v1.7. {#tbl:S99-vs-GAFF-v1.7}

![The dihedral energy term applied to H1-C1-C2-O2 in SMIRNOFF99Frosst and GAFF v1.7. Atom names refer to Figure @fig:atom-names.](images/SMIRNOFF99Frosst-vs-GAFF-v1.7-H1-C2-C2-O2.png){#fig:dihedral width=3.5in}

The dihedral parameters in GAFF v2.1 differ from those in SMIRNOFF99Frosst, in a number of ways.
There are several dihedrals that have a different number of terms in either force field (Table @tbl:S99-vs-GAFF-v2.1-missing).
Partly this is due to the addition of dihedral terms with a barrier height of exactly 0.00 kcal/mol in GAFF, which are used to override wildcard parameters that might match the same atom types. 
For example, GAFF v2.1 applies a three term energy function to the atom types `c3-os-c3-c3`, whereas SMIRNOFF99Frosst employs a two term energy function for the SMIRKS pattern (`[#6X4:1]-[#6X4:2]-[#8X2H0:3]-[#6X4:4]`), but only the terms with periodicity 2 and 3 have nonzero barrier heights in GAFF v2.1.
SMIRNOFF99Frosst uses two nonzero terms to model the potential barrier for the SMIRKS pattern `[#6X4:1]-[#6X4:2]-[#8X2H1:3]-[#1:4]` yet GAFF v2.1 applies a single term with a barrier height of exactly 0.00 kcal/mol for the atom types `c3-c3-oh-ho`.

[I am considering removing this table. I think it is difficult to interpret: there are cases where things are missing, things are zero, and duplicate parameters applied to different sets of atoms and listed multiple times.]{.banner .lightgrey}

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

Table: Dihedral parameter differences between SMIRNOFF99Frosst and GAFF v2.1, where one dihedral has fewer or more periodicity terms than the corresponding term in the other force field. Atom names refer to @fig:atom-names. {#tbl:S99-vs-GAFF-v2.1-missing}

In other cases, SMIRNOFF99Frosst and GAFF v2.1 have disagreements on the barrier height after matching the periodicity and phase for a given dihedrals.
It is notable that GAFF v2.1 does not have drastically higher force constants for any of the dihedrals, yet GAFF v2.1 produces much more rigid structures (Table @tbl:S99-vs-GAFF-v2.1, Figure @fig:flexibility).
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

Table: Dihedral barrier height differences between SMIRNOFF99Frosst and GAFF v2.1 for cases where the phase and periodicity of the energy term match but the barrier height does not. {#tbl:S99-vs-GAFF-v2.1}


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

![The dihedral energy term applied to three inter-residue dihedrals in SMIRNOFF99Frosst and GAFF v2.1. The dihedral acting on atoms O1<sub>n</sub>--C4<sub>n+1</sub>--C5<sub>n+1</sub>--O5<sub>n+1</sub> is quite significantly different, with multiple minima and and barrier heights. This dihedral partially controls the rotation of glucose monomers towards or away from the interior of the cyclodextrin cavity. Surprisingly, glucose monomers in GAFF v2.1 penetrate the open cavity much less frequently than in SMIRNOFF99Frosst, despite the lower and broader dihedral energy in GAFF v2.1. Atom names refer to Figure @fig:atom-names.](images/interdihedrals.png){width="100%" #fig:interdihedrals}

### Structural consequences of the force field parameter differences

In both SMIRNOFF99Frosst and GAFF v1.7, the average RMSD of βCD is between 2 and 2.5 Å over 43 μs of simulation. GAFF v2.1 is significanly more rigid, with an average RMSD less than 1.0 Å from the initial structure (Figure @fig:flexibility).

![Top: Root mean square deviation (RMSD) of free βCD in the three force fields, all relative to the same initial structure. A 1000 frame moving average is plotted in red. Middle: to-view of the open cavity of βCD with no guest (200 snapshots over 1 μs). Bottom: side-view of the open cavity. The carbons are colored blue in SMIRNOFF99Frosst, green in GAFF v1.7, and purple in GAFF v2.1. Hydrogen atoms have been hidden for clarity.](images/cyclodextrin-flexibility.png){#fig:flexibility width=100%}

The "flip" pseudodihedral O2<sub>n</sub>--C1<sub>n</sub>--C4<sub>n+1</sub>--O3<sub>n+1</sub> characterizes the orientation of glucose monomers relative to their neighbors.
This dihedral is tightly distributed in GAFF v2.1, with all seven dihedrals having a Gaussian-like distribution, centered around -10 degreees (@fig:pseudodihedral,a).
In contrast, simulations with both SMIRNOFF99Frosst and GAFF v1.7 report a multipeaked distribution for the dihedral, with a small amount of spread among the individual angles. 
At any given time point, SMIRNOFF99Frosst adopts a variety of individual pseudodihedral conformations, leading to many conformations with at least one glucose monomer inside the cyclodextrin cavity and distortion of the overall shape of the host binding pocket (Figure @fig:pseudodihedral,b-c). 
Each pseudodihedral in GAFF v2.1 has a tight distribution; neighboring pseudodihedrals are negatively correlated with each other and positively correlated with the dihedrals on the opposite side of the ring (Figure @fig:pseudodihedral,d).

![(a) Population histograms of the pseudodihedral in free βCD, averaged over 43 μs, for each force field; one curve is drawn for each pseudodihedral in βCD. (b) Renderings of βCD in GAFF v1.7 which have the similar mean psuedodihedral values but very different individual pseudodihedral values. (c) Left: The timeseries of psuedodihedral values in SMIRNOFF99Frost during the `b-chp-p` simulation. The average value is drawn in grey. Right: The correlation between pseudodihedrals in the βCD ring with SMIRNOFF99Frosst. (d) The same as panel (c) except using GAFF v2.1.](images/cyclodextrin-pseudodihedral.png){#fig:pseudodihedral width=100%}


## Discussion

As a terse representation of a GAFF-like force field, SMIRNOFF99Frosst does remarkably well. 
Despite having far fewer parameters than GAFF v1.7 and GAFF v2.1, SMIRNOFF99Frosst performs as well as GAFF v1.7 and better than GAFF v2.1 predicting binding free energies of small molecules to αCD and βCD, based on the mean signed error relative to experiment.
Moreover, SMIRNOFF99Frosst performs better than either GAFF v1.7 or GAFF v2.1 on predicted binding enthalpies, with a mean signed error less than 1 kcal/mol.
GAFF v2.1 has excellent agreement with experiment on predicted binding entropy, followed by SMIRNOFF99Frosst and then GAFF v1.7.

It is notable that both SMIRNOFF99Frosst and GAFF v1.7 result in excessively flexible cyclodextrin hosts.
It has been shown that there are 2--7 H<sub>2</sub>O inside αCD and 8--11 H<sub>2</sub>O molecules inside βCD [@j3qbz56S; @l02WNlWU].
It is likely that simulations with SMIRNOFF99Frosst and GAFF v1.7 result in fewer resident waters inside the cyclodextrin cavity due to intrusions from glucose units.
Futhermore, it is known that sugars and conjugated carbohydrates are especially difficult for many "general" force fields, due to the highly polar bonds in sugars, the number of chiral centers, and the large structural differences between chiral isomers [@okbsmIQF].
The specialized q4md-CD force field [@j7JJedX4], which used cyclodextrin X-ray crystal structures and NMR ^3^J couplings to tune force field parameters, produces a far more rigid cyclodextrin molecule, similar to GAFF v2.1 [@HVgz5rZq].
The CHARMM36 force field displays similar structural dynamics to q4md-CD, with certain GROMOS force fields even more rigid than those [@jdi722iE].
The lack of rigidity is associated with an underestimation of the binding enthalpy and an overestimation of the binding entropy; SMRINOFF99Frossst has a ΔH MSE = 0.77 kcal/mol and −TΔS MSE = -0.78 kcal/mol whereas the more rigid GAFF v2.1 results in ΔH MSE = -1.64 kcal/mol and −TΔS MSE = 0.08 kcal/mol.
It is especially notable that GAFF v2.1 has the best overall correlations `and probably the best Kendall τ?`.

As a starting point for force field optimization, it therefore seems important to include sugars and carbohydrates in the development of future iterations of SMIRNOFF99Frosst.
This will be especially useful for modeling more physiologically relevant protein structures, such as proteoglycans and glycopeptides.

## Supporting Information {.page_break_before #SI}

![Comparison of calculated absolute binding entropies (−TΔS) with experiment with SMIRNOFF99Frosst parameters (top), GAFF v1.7 parameters (middle), or GAFF v2.1 parameters (bottom) applied to both host and guest. The orange, blue, and purple coloring distinguish the functional group of the guest as an ammonium, alcohol, or carboxylate, respectively.](images/TdS.png){width="100%" #fig:TdS}

![The primary (left) and secondary (right) cavity of αCD.](images/alphaCD-structure.png){#fig:cavity width=3.5in}


![Binding free energies (ΔG) with the primary orientation results colored in blue and secondary orientation results colored in green.](images/by-orientation-comparison.png){width="100%" #fig:by-orientation-comparison}

![Binding free energies (ΔG) replotted from Figure @fig:by-orientation-comparison with points whose difference in binding free energy along either axis is greater than 2 kcal/mol shown in color. Arrows point from primary to secondary. **The arrow direction should match Figure @fig:by-orientation, but it doesn't.**](images/by-orientation-highlight.png){width="100%" #fig:by-orientation-highlight}

![Comparison of calculated absolute binding free energies (ΔG) between force field combinations. The orange, blue, and purple coloring distinguish the functional group of the guest as an ammonium, alcohol, or carboxylate, respectively.](images/dG-by-orientation.png){width="100%" #fig:dG-by-orientation}

![Comparison of calculated absolute binding free enthalpies (ΔH) between force field combinations. The orange, blue, and purple coloring distinguish the functional group of the guest as an ammonium, alcohol, or carboxylate, respectively.](images/dH-by-orientation.png){width="100%" #fig:dH-by-orientation}

![Comparison of calculated absolute binding free entropies (-TΔS) between force field combinations. The orange, blue, and purple coloring distinguish the functional group of the guest as an ammonium, alcohol, or carboxylate, respectively.](images/TdS-by-orientation.png){width="100%" #fig:TdS-by-orientation}

![Binding free energies (ΔG) replotted from Figure @fig:dG-dH, with αCD points colored in blue and βCD points in grey (left) or αCD points in grey with βCD points colored in green (right).](images/dG-dH-by-cyclodextrin.png){width="100%" #fig:dG-dH-by-cyclodextrin}

![Binding free energy (ΔG) comparisons showing ammonium guests in color and highlighted.](images/additional-highlights-ammonium.png){width="100%" #fig:additional-highlights-ammonium}

![Binding free energy (ΔG) comparisons showing alcohols guests in color and highlighted.](images/additional-highlights-alcohols.png){width="100%" #fig:additional-highlights-alcohols}

![Binding free energy (ΔG) comparisons showing carboxylates guests in color and highlighted.](images/additional-highlights-carboxylates.png){width="100%" #fig:additional-highlights-carboxylates}

![A comparison of bond equilibrium lengths for SMIRNOFF99Frosst, GAFF v1.7, and GAFF v2.1. Atom names refer to Figure @fig:atom-names.](images/bond-req.png){width="100%" #fig:bond-req}

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

## Code and data availability
- [GitHub repository](https://github.com/slochower/smirnoff-host-guest) used to convert AMBER input files from GAFF force field to SMIRNOFF99Frosst.
- [GitHub repository](https://github.com/slochower/smirnoff-host-guest-simulations-data) for setting up the attach-pull-release calculations using `paprika` version 0.0.3.
- [GitHub repository](https://github.com/slochower/smirnoff-host-guest-simulations) for analyzing the simulations and generating the plots in this manuscript.
- [GitHub repository](https://github.com/openforcefield/openforcefield) for the Open Force Field group containing the toolkit and force field XML file.

## Author contributions
Conceptualization, DRS, NMH, JDC, MKG; Methodology, DRS, NMH; Software, DRS, NMH; Formal Analysis, DRS, NMH, JDC, MKG; Investigation, DRS, NMH; Resources, MKG, JDC;  Data Curation, DRS, NMH; Writing-Original Draft, DRS, NMH; Writing - Review and Editing, DRS, NMH, JDC, MKG; Visualization, DRS; Supervision, JDC, MKG; Project Administration, MKG; Funding Acquisition, MKG.

## Acknowledgments 

## Disclosures
The authors declare the following competing financial interest(s): MKG has an equity interest in and is a cofounder and scientific advisor of VeraChem LLC.

## List of abbreviations
APR, attach-pull-release; CD, cyclodextrin; GAFF, Generalized AMBER Force Field

## References {.page_break_before}

<!-- Explicitly insert bibliography here -->
<div id="refs"></div>
