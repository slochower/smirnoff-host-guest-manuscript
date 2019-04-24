#!/usr/bin/bash

# Run from the diff directory

# Output branch commit hashes
OLD_COMMIT=937c297c6deed1126f4ef7322e3830f406e3df81
NEW_COMMIT=9e7eb83a2840e78662be03f477a5451520d8befd

# old markdown
wget --quiet --timestamping --directory-prefix=old \
  https://raw.githubusercontent.com/slochower/smirnoff-host-guest-manuscript/$OLD_COMMIT/manuscript.md

# old HTML
wget --quiet --timestamping --directory-prefix=old \
    https://raw.githubusercontent.com/slochower/smirnoff-host-guest-manuscript/$OLD_COMMIT/manuscript.html

# new markdown
wget --quiet --timestamping --directory-prefix=new \
    https://raw.githubusercontent.com/slochower/smirnoff-host-guest-manuscript/$NEW_COMMIT/manuscript.md

# new HTML
wget --quiet --timestamping --directory-prefix=new \
    https://raw.githubusercontent.com/slochower/smirnoff-host-guest-manuscript/$NEW_COMMIT/manuscript.html
