# This file's purpose is to run all scripts for the new setup.
# Fish shell should already be installed and running
fish preNewSystemSetupFish.fish | tee preNewSystemSetupFish.log
fish newSystemSetupUbuntu.fish | tee newSystemSetupUbuntu.log
fish postNewSystemSetupUbuntu.fish | tee postNewSystemSetupUbuntu.log