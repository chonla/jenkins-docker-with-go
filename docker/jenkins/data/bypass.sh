#!/usr/bin/env bash

# wait until jenkins is ready
until $(curl --output /dev/null --silent --head --fail http://localhost:8080/login?from=%2F); do
    printf '.'
    sleep 5
done
echo ""

crumb=""
content=$(curl -i -s http://localhost:8080/login?from=%2F)
if [[ $content =~ \"([a-f0-9]{32})\" ]];
then
    crumb=${BASH_REMATCH[1]};
else
    echo "cannot found jenkins-crumb"
    exit 1
fi

pwd=$(cat /var/jenkins_home/secrets/initialAdminPassword)
post_data="from=&j_username=admin&j_password=${pwd}&Jenkins-Crumb=${crumb}&json=%7B%22from%22%3A+%22%22%2C+%22j_username%22%3A+%22admin%22%2C+%22j_password%22%3A+%22${pwd}%22%2C+%22Jenkins-Crumb%22%3A+%22${crumb}%22%7D"

content=$(curl -i -s -c cookies.txt -X POST -d ${post_data} -H 'Content-Type: application/x-www-form-urlencoded' http://localhost:8080/j_acegi_security_check)

content=$(curl -i -b cookies.txt -s http://localhost:8080/setupWizard/setupWizardFirstUser)
if [[ $content =~ \"([a-f0-9]{32})\" ]];
then
    crumb=${BASH_REMATCH[1]};
else
    echo "cannot found jenkins-crumb"
    exit 1
fi

post_data="username=${JENKINS_USER}&password1=${JENKINS_PASSWORD}&password2=${JENKINS_PASSWORD}&fullname=${JENKINS_NAME}&email=${JENKINS_EMAIL}&Jenkins-Crumb=${crumb}&json=%7B%22username%22%3A+%22${JENKINS_USER}%22%2C+%22password1%22%3A+%22${JENKINS_PASSWORD}%22%2C+%22password2%22%3A+%22${JENKINS_PASSWORD}%22%2C+%22fullname%22%3A+%22${JENKINS_NAME}%22%2C+%22email%22%3A+%22${JENKINS_EMAIL}%22%2C+%22Jenkins-Crumb%22%3A+%22${crumb}%22%7D"

curl -i \
    -b cookies.txt \
    -X POST \
    -d ${post_data} \
    -H 'Content-Type: application/x-www-form-urlencoded' \
    http://localhost:8080/setupWizard/createAdminUser