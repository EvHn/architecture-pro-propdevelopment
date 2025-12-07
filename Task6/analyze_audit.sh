#!/bin/bash

jq 'select(.objectRef.resource=="secrets" and .verb=="list")' $1
jq 'select(.verb=="create" and .objectRef.subresource=="exec")' $1
jq 'select(.objectRef.resource=="pods" and .requestObject.spec.containers[].securityContext.privileged==true)' $1
grep -i 'audit-policy' $1
