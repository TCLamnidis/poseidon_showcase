#!/usr/bin/env bash

## The following steps install the required tools. Assumes conda is installed and configured.
  ## Create the conda environment (install tools)
  # conda create -n poseidon_showcase -c bioconda  poseidon-trident=1.5.0.1 poseidon-xerxes=1.0.1.1

  ## Activate the conda environment
  # conda activate poseidon_showcase

## Download required packages
trident fetch --archive community-archive -d . -f '*2012_PattersonGenetics*,*2018_Lamnidis_Fennoscandia*,Greek,<I9033>'

## List the groups in the downloaded packages
trident list -d . --groups

## Run xerxes to calculate F4 statistics (no need to merge datasets with forge!)
xerxes fstats -d . --stat 'F4(Spanish,Lithuanian,Nganasan,Mbuti)' -j CHR --tableOutFile F4.txt

## Can also run multiple configrued fstats with a statConfig file in YAML format
xerxes fstats -d . --statConfig fstats.config -j CHR --tableOutFile F4_config.txt
