# Binding thermodynamics of host-guest systems with SMIRNOFF99Frosst from the Open Force Field Group

<!-- usage note: edit the H1 title above to personalize the manuscript -->

[![HTML Manuscript](https://img.shields.io/badge/manuscript-HTML-blue.svg)](https://slochower.github.io/smirnoff-host-guest-manuscript/)
[![PDF Manuscript](https://img.shields.io/badge/manuscript-PDF-blue.svg)](https://slochower.github.io/smirnoff-host-guest-manuscript/manuscript.pdf)
[![Build Status](https://travis-ci.org/slochower/smirnoff-host-guest-manuscript.svg?branch=master)](https://travis-ci.org/slochower/smirnoff-host-guest-manuscript)

## Manuscript description

<!-- usage note: edit this section. -->

This repository describes setting up and running host-guest binding free energy calculations on cyclodextrins using the SMIRNOFF99Frosst force field.

## Code and data availability

For information related to the setup and analysis of the calculations, please see:

- [GitHub repository](https://github.com/slochower/smirnoff-host-guest) used to convert AMBER input files from GAFF force field to SMIRNOFF99Frosst.
- [GitHub repository](https://github.com/slochower/smirnoff-host-guest-simulations-data) for setting up the attach-pull-release calculations using `paprika` version 0.0.3.
- [GitHub repository](https://github.com/slochower/smirnoff-host-guest-simulations) for analyzing the simulations and generating the plots in this manuscript.
- [GitHub repository](https://github.com/openforcefield/openforcefield) for the Open Force Field group containing the toolkit and force field XML file.

## License

<!--
usage note: edit this section to change the license of your manuscript or source code changes to this repository.
We encourage users to openly license their manuscripts, which is the default as specified below.
-->

[![License: CC BY 4.0](https://img.shields.io/badge/License%20All-CC%20BY%204.0-lightgrey.svg)](http://creativecommons.org/licenses/by/4.0/)
[![License: CC0 1.0](https://img.shields.io/badge/License%20Parts-CC0%201.0-lightgrey.svg)](https://creativecommons.org/publicdomain/zero/1.0/)

Except when noted otherwise, the entirety of this repository is licensed under a CC BY 4.0 License ([`LICENSE.md`](LICENSE.md)), which allows reuse with attribution.
Please attribute by linking to https://github.com/slochower/smirnoff-host-guest-manuscript.

Since CC BY is not ideal for code and data, certain repository components are also released under the CC0 1.0 public domain dedication ([`LICENSE-CC0.md`](LICENSE-CC0.md)).
All files matched by the following glob patterns are dual licensed under CC BY 4.0 and CC0 1.0:

+ `*.sh`
+ `*.py`
+ `*.yml` / `*.yaml`
+ `*.json`
+ `*.bib`
+ `*.tsv`
+ `.gitignore`

All other files are only available under CC BY 4.0, including:

+ `*.md`
+ `*.html`
+ `*.pdf`
+ `*.docx`

Except for the following files with different licenses:

+ `build/assets/anchors.js` which is [released](https://www.bryanbraun.com/anchorjs/) under an [MIT License](https://opensource.org/licenses/MIT)

Please open [an issue](https://github.com/slochower/smirnoff-host-guest-manuscript/issues) for any question related to licensing.