#!/bin/bash

# Define an array of resource group names to be deleted
declare -a resourceGroups=("rg-avd-dev-euw-monitoring" "rg-avd-poc-dev-euw-network" "rg-avd-poc-dev-euw-pool-compute" "rg-avd-poc-dev-euw-service-objects" "rg-avd-poc-dev-euw-storage")

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
