#!/usr/bin/env bash
#
# Download the registry and scripts.
# This is the first step in setting up Kubeflow.
# Downloads it to the current directory
set -ex

# Create a local copy of the Kubeflow source repo
TMPDIR=$(mktemp -d /tmp/tmp.kubeflow-repo-XXXXXX)
curl -L -o ${TMPDIR}/kubeflow.tar.gz https://github.com/kubeflow/kubeflow/archive/v0.5-branch.tar.gz
tar -xzvf ${TMPDIR}/kubeflow.tar.gz -C ${TMPDIR}
# GitHub seems to strip out the v in the file name.
KUBEFLOW_SOURCE=$(find ${TMPDIR} -maxdepth 1 -type d -name "kubeflow*")

# Copy over the directories we need
cp -r ${KUBEFLOW_SOURCE}/kubeflow ./
cp -r ${KUBEFLOW_SOURCE}/scripts ./
cp -r ${KUBEFLOW_SOURCE}/deployment ./
