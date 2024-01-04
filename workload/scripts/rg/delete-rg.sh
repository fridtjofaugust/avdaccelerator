#!/bin/bash

# Define an array of resource group names to be deleted
declare -a resourceGroups=("rg-avd-dev-euw-monitoring" "rg-avd-we1-dev-euw-network" "rg-avd-we1-dev-euw-pool-compute" "rg-avd-we1-dev-euw-service-objects" "rg-avd-we1-dev-euw-storage")

# Loop through the array and delete each resource group if it exists
for rg in "${resourceGroups[@]}"
do
   # Check if the resource group exists
   if az group exists --name $rg; then
       echo "Deleting resource group $rg"
       az group delete --name $rg --yes --no-wait
       echo "Deletion initiated for $rg"
   else
       echo "Resource group $rg does not exist, skipping..."
   fi
done

echo "All specified resource groups have been processed for deletion."
