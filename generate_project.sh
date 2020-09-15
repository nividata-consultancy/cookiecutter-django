#!/bin/sh

if [ -d "$HOME/projects/cookiecutter-django" ]
then
    echo "Removing current cookiecutter"
    rm -r $HOME/projects/cookiecutter-django
fi

cd $HOME/projects
git clone https://github.com/nividata-consultancy/cookiecutter-django
cookiecutter cookiecutter-django

echo "Is the project using frontend framework? [y/n]"
read is_frontend_framework_used

echo "Is test server setup? [y/n]"
read is_test_server_setup

if [ "$is_test_server_setup" == "n" ]
then
  echo "------------------------ WARNING ------------------------------"
  echo "Please ask DevOps team to setup the test server"
  echo "---------------------------------------------------------------"
fi

echo "Is the domain for the dev.projectURL.com setup? [y/n]"
read is_dev_domain_setup

if [ "$is_dev_domain_setup" == "n" ]
then
  echo "------------------------ WARNING ------------------------------"
  echo "Please ask DevOps team to setup the test server domain"
  echo "---------------------------------------------------------------"
fi

echo "Is CI/CD pipeline configured? [y/n]"
read is_ci_cd_pipeline_configured

if [ "$is_ci_cd_pipeline_configured" == "n" ]
then
  echo "------------------------ WARNING ------------------------------"
  echo "Please ask DevOps team to setup CI/CD pipeline"
  echo "---------------------------------------------------------------"
fi

echo "Is Sentry configured? [y/n]"
read is_sentry_configured

if [ "$is_sentry_configured" == "n" ]
then
  if [ "$is_frontend_framework_used" == "y" ]
  then
    echo "-------------------------------------- WARNING -----------------------------------------"
    echo "Please ask DevOps team to create sentry DSN for both the frontend and backend repository"
    echo "----------------------------------------------------------------------------------------"
  else
    echo "------------------------ WARNING ------------------------------"
    echo "Please ask DevOps team to create sentry DSN"
    echo "---------------------------------------------------------------"
  fi
fi

echo "Is Sonarqube token generated? [y/n]"
read is_sonarqube_configured

if [ "$is_sonarqube_configured" == "n" ]
then
  if [ "$is_frontend_framework_used" == "y" ]
  then
    echo "-------------------------------------- WARNING -----------------------------------------"
    echo "Please ask DevOps team to setup sonarqube for both the frontend and backend repository"
    echo "----------------------------------------------------------------------------------------"
  else
    echo "------------------------ WARNING ------------------------------"
    echo "Please ask DevOps team to create sentry DSN"
    echo "---------------------------------------------------------------"
  fi
fi

echo "Is communication channel decided? [y/n]"
read is_communication_channel_decided

if [ "$is_communication_channel_decided" == "n" ]
then
  echo "-------------------------------------- WARNING -----------------------------------------"
  echo "Please ask your prject manager to setup comminication channel on Fleep/Skype/Slack"
  echo "----------------------------------------------------------------------------------------"
fi

if [ -d "$HOME/projects/" ]
then
    echo "Directory $HOME/projects exists."
else
    echo "Directory $HOME/projects does not exists. Creating the directory $HOME/projects"
    mkdir $HOME/projects
fi




echo "Congratulations!! Your project is setup."
echo "------------------------- ***** HERE ARE SOME ADVICES DURING THE DEVELOPMENT *****------------------------ "
echo "- Make sure to follow PEP-8 standard"
echo "- Write unit tests"
echo "- Use strong passwords"
echo "- Automate whenever you can"
echo "- Keep a habit to write logs in the logical implementation"
echo "- Make sure development team has decided the branch management team strategy"
echo "- Admin URL should not be '/admin'. Must have random hash or tough characters."
echo "- Admin username and password should not easily guessable. Like admin/admin/admin123,"
echo "- Use strong passwords for other services"
echo "- Communicate your suggestions/issues to the team"
