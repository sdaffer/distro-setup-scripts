# This file's purpose is to run all scripts for the new setup.
# Fish shell should already be installed and running
fish ~/git/distro-setup-scripts/preNewSystemSetupFish.fish | tee preNewSystemSetupFish.log
fish newSystemSetupFedora.fish | tee newSystemSetupFedora.log
fish postNewSystemSetupFedora.fish | tee postNewSystemSetupFedora.log