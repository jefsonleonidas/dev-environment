#!/bin/bash

# This script needs being execute by crontab with the fallow configuration:
#
# *  *    * * *   ems     /opt/fake_agent/verify-fake.sh
# It will be executed each minute to verify wheter there is a process from /opt/fake_agent/execute-fake.sh.
# If there is not, it try execute the /opt/fake_agent/execute-fake.sh always as necessary.

ps -ef|grep -v grep |grep execute-fake.sh
if [ $? != 0 ]; then
    /opt/fake_agent/execute-fake.sh
fi
