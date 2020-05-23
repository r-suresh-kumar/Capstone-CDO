#!/usr/bin/env bash

eksctl create cluster \
 --name $CLUSTER \
 --region $REGION \
 --zones us-west-2 \
 --zones us-west-2 \
 --zones us-west-2 \
 --zones us-west-2 \
 --zones us-west-2 \
 --zones us-west-2 \
 --zones us-west-2 \
 --zones us-west-2 \
 --zones us-west-2 \
 --zones us-west-2 \
 --zones us-west-2 \
 --zones us-west-2 \
 --version 1.15 \
 --nodegroup-name workers \
 --node-ami auto \
 --node-type m5.xlarge \
 --nodes 2 \
 --nodes-min 1 \
 --nodes-max 2
