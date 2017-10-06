#!/bin/bash

wget http://cjoc.local/jnlpJars/jenkins-cli.jar
alias jenkins-cli='java -jar jenkins-cli.jar -s http://jenkins.local/jenkins -auth amuniz:87hasdg655asjdgdb'

# this will do nothing if the team already exists
jenkins-cli teams --create "Audit" || true

# set or override team display name and members
jenkins-cli teams audit --bulk-override < audit.json

# this requires the roles in a separated file
jenkins-cli roles audit --bulk-override < audit-roles.json
