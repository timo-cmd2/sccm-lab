# the main core of my tasksequence
# the logic works folder-based

# case-scenario: installation of sap and office356
# 1. run dokcer server for the sccm-master
# 2. create basic folder structure using scaffold.ps1
# - TSStructure/Manufacturer/App/
# 3. Generate a Wget registryfile with scaffold.ps1
# - TSStructure/Manufacturer/App/Registry.yaml
# - The yaml registryfile contains the source locations of the programs
# 4. run this file 
