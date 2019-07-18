import os
import glob
import subprocess as sp

for file in glob.glob("*.pdf"):
    print(f"Updating {file}")
    p = sp.Popen(
        [
            "cp",
            os.path.join(
                "..",
                "..",
                "..",
                "projects",
                "smirnoff-host-guest-simulations",
                "figures",
                file,
            ),
            ".",
        ]
    )
    p.communicate()
