# Figure 2

python ../../build/merge-subfigures.py --input \
atom-names-trimer.png \
gaff-atom-types.png \
--geometry 2x1 --fontsize 8 --output atom-names.png


# Figure 3

python ../../build/merge-subfigures.py --input \
    SMIRNOFF99Frosst-vs-Experiment-dG.png \
    SMIRNOFF99Frosst-vs-Experiment-dH.png \
    GAFF-v1.7-vs-Experiment-dG.png \
    GAFF-v1.7-vs-Experiment-dH.png \
    GAFF-v2.1-vs-Experiment-dG.png \
    GAFF-v2.1-vs-Experiment-dH.png \
    --geometry 2x3 --output dG-dH.png

# Figure 4

python ../../build/merge-subfigures.py --input \
    SMIRNOFF99Frosst-dG-by-orientation-all.png \
    GAFF-v1.7-dG-by-orientation-all.png \
    GAFF-v2.1-dG-by-orientation-all.png \
    cyclooctanol.png \
    --geometry 2x2 --resize --output by-orientation.png

# Figure 5

python ../../build/merge-subfigures.py --input \
SMIRNOFF99Frosst-vs-Experiment-dG-by-cyclodextrin.png \
GAFF-v1.7-vs-Experiment-dG-by-cyclodextrin.png \
GAFF-v2.1-vs-Experiment-dG-by-cyclodextrin.png \
--geometry 2x2 --output by-cyclodextrin.png

# Figure 6

python ../../build/merge-subfigures.py --input \
SMIRNOFF99Frosst-vs-Experiment-dG-highlight-alpha-ammonium.png \
SMIRNOFF99Frosst-vs-Experiment-dG-highlight-beta-ammonium.png \
--geometry 2x1 --output ammonium.png

# Figure 7

python ../../build/merge-subfigures.py --input \
SMIRNOFF99Frosst-vs-Experiment-dG-highlight-alpha-alcohols.png \
SMIRNOFF99Frosst-vs-Experiment-dG-highlight-beta-alcohols.png \
--geometry 2x1 --output alcohols.png

# Figure 8

python ../../build/merge-subfigures.py --input \
SMIRNOFF99Frosst-vs-Experiment-dG-highlight-alpha-carboxylates.png \
SMIRNOFF99Frosst-vs-Experiment-dG-highlight-beta-carboxylates.png \
--geometry 2x1 --output carboxylates.png

# Figure 9

python ../../build/merge-subfigures.py --input \
SMIRNOFF99Frosst-vs-GAFF-v2.1-sigma.png \
SMIRNOFF99Frosst-vs-GAFF-v2.1-epsilon.png \
--geometry 2x1 --output LJ.png

# Figure 10

python ../../build/merge-subfigures.py --input \
SMIRNOFF99Frosst-vs-GAFF-v1.7-bond-k.png \
SMIRNOFF99Frosst-vs-GAFF-v2.1-bond-k.png \
--geometry 2x1 --output bonds.png

# Figure 11

python ../../build/merge-subfigures.py --input \
SMIRNOFF99Frosst-vs-GAFF-v1.7-ang-k.png \
SMIRNOFF99Frosst-vs-GAFF-v2.1-ang-k.png \
SMIRNOFF99Frosst-vs-GAFF-v1.7-ang-theta.png \
SMIRNOFF99Frosst-vs-GAFF-v2.1-ang-theta.png \
--geometry 2x2 --output angles.png

# Figure 13

python ../../build/merge-subfigures.py --input \
SMIRNOFF99Frosst-vs-GAFF-v2.1-C1-O1-C4-C3.png \
SMIRNOFF99Frosst-vs-GAFF-v2.1-O1-C4-C3-O3.png \
SMIRNOFF99Frosst-vs-GAFF-v2.1-O1-C4-C5-O5.png \
--geometry 2x2 --gravity south --output interdihedrals.png

# Figure 16

python ../../build/merge-subfigures.py --input \
SMIRNOFF99Frosst-vs-Experiment-TdS.png \
GAFF-v1.7-vs-Experiment-TdS.png \
GAFF-v2.1-vs-Experiment-TdS.png \
--geometry 2x2 --output TdS.png

# Figure 18

python ../../build/merge-subfigures.py --input \
SMIRNOFF99Frosst-vs-GAFF-v1.7-dG-color-by-orientation.png \
SMIRNOFF99Frosst-vs-GAFF-v2.1-dG-color-by-orientation.png \
--geometry 2x1 --output by-orientation-comparison.png

# Figure 19

python ../../build/merge-subfigures.py --input \
SMIRNOFF99Frosst-vs-GAFF-v1.7-dG-by-orientation-highlight.png \
SMIRNOFF99Frosst-vs-GAFF-v2.1-dG-by-orientation-highlight.png \
--geometry 2x1 --output by-orientation-highlight.png

# Figure 20

python ../../build/merge-subfigures.py --input \
SMIRNOFF99Frosst-vs-GAFF-v1.7-dG-by-orientation.png \
SMIRNOFF99Frosst-vs-GAFF-v2.1-dG-by-orientation.png \
GAFF-v2.1-vs-GAFF-v1.7-dG-by-orientation.png \
--geometry 2x2 --output dG-by-orientation.png

# Figure 21

python ../../build/merge-subfigures.py --input \
SMIRNOFF99Frosst-vs-GAFF-v1.7-dH-by-orientation.png \
SMIRNOFF99Frosst-vs-GAFF-v2.1-dH-by-orientation.png \
GAFF-v2.1-vs-GAFF-v1.7-dH-by-orientation.png \
--geometry 2x2 --output dH-by-orientation.png

# Figure 22

python ../../build/merge-subfigures.py --input \
SMIRNOFF99Frosst-vs-GAFF-v1.7-TdS-by-orientation.png \
SMIRNOFF99Frosst-vs-GAFF-v2.1-TdS-by-orientation.png \
GAFF-v2.1-vs-GAFF-v1.7-TdS-by-orientation.png \
--geometry 2x2 --output TdS-by-orientation.png

# Figure 23

python ../../build/merge-subfigures.py --input \
SMIRNOFF99Frosst-vs-Experiment-dG-alpha.png \
SMIRNOFF99Frosst-vs-Experiment-dG-beta.png \
GAFF-v1.7-vs-Experiment-dG-alpha.png \
GAFF-v1.7-vs-Experiment-dG-beta.png \
GAFF-v2.1-vs-Experiment-dG-alpha.png \
GAFF-v2.1-vs-Experiment-dG-beta.png \
--geometry 2x3 --output dG-dH-by-cyclodextrin.png

# Figure 24

python ../../build/merge-subfigures.py --input \
SMIRNOFF99Frosst-vs-GAFF-v1.7-dG-highlight-alpha-ammonium-by-orientation.png \
SMIRNOFF99Frosst-vs-GAFF-v2.1-dG-highlight-alpha-ammonium-by-orientation.png \
SMIRNOFF99Frosst-vs-GAFF-v1.7-dG-highlight-beta-ammonium-by-orientation.png \
SMIRNOFF99Frosst-vs-GAFF-v2.1-dG-highlight-beta-ammonium-by-orientation.png \
--geometry 2x2 --output additional-highlights-ammonium.png

# Figure 25

python ../../build/merge-subfigures.py --input \
SMIRNOFF99Frosst-vs-GAFF-v1.7-dG-highlight-alpha-alcohols-by-orientation.png \
SMIRNOFF99Frosst-vs-GAFF-v2.1-dG-highlight-alpha-alcohols-by-orientation.png \
SMIRNOFF99Frosst-vs-GAFF-v1.7-dG-highlight-beta-alcohols-by-orientation.png \
SMIRNOFF99Frosst-vs-GAFF-v2.1-dG-highlight-beta-alcohols-by-orientation.png \
--geometry 2x2 --output additional-highlights-alcohols.png

# Figure 26

python ../../build/merge-subfigures.py --input \
SMIRNOFF99Frosst-vs-GAFF-v1.7-dG-highlight-alpha-carboxylates-by-orientation.png \
SMIRNOFF99Frosst-vs-GAFF-v2.1-dG-highlight-alpha-carboxylates-by-orientation.png \
SMIRNOFF99Frosst-vs-GAFF-v1.7-dG-highlight-beta-carboxylates-by-orientation.png \
SMIRNOFF99Frosst-vs-GAFF-v2.1-dG-highlight-beta-carboxylates-by-orientation.png \
--geometry 2x2 --output additional-highlights-carboxylates.png

# Figure 27

python ../../build/merge-subfigures.py --input \
SMIRNOFF99Frosst-vs-GAFF-v1.7-bond-req.png \
SMIRNOFF99Frosst-vs-GAFF-v2.1-bond-req.png \
--geometry 2x1 --output bond-req.png

# Figure XX

python ../../build/merge-subfigures.py --input \
alpha_gaff_charged_by_monomer.png \
alpha_gaff_charged_whole_molecule.png \
--geometry 2x1 \
--output charge-schemes.png

# Figure XX

python ../../build/merge-subfigures.py --input \
H1-C2-C2-O2-structure.png \
SMIRNOFF99Frosst-vs-GAFF-v1.7-H1-C2-C2-O2.png \
--geometry 2x1 \
--output H1-C2-C2-O2.png

# Figure XX

python ../../build/merge-subfigures.py --input \
pseudodihedral-histogram.png \
pseudodihedral-timeseries.png \
--geometry 2x1 \
--gravity north \
--output cyclodextrin-pseudodihedral.png
