#!/usr/bin/bash

# Run from the diff directory

# Output branch commit hashes
OLD_COMMIT=73f7b64c621def620831b51695aa57e327d738f5
NEW_COMMIT=b771c51fea5a3168b7fa1e5cc9ebb2971fe760ff

# old markdown
# wget --quiet --timestamping --directory-prefix=old \
#  https://github.com/slochower/smirnoff-host-guest-manuscript/raw/$OLD_COMMIT/manuscript.md

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
