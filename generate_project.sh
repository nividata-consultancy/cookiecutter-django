#if ask "Is test server setup "; then
#    said_yes
#fi

if [ -d "$HOME/projects/" ]
then
    echo "Directory $HOME/projects exists."
else
    echo "Directory $HOME/projects does not exists. Creating the directory $HOME/projects"
    mkdir $HOME/projects
fi

cd $HOME/projects

cookiecutter

echo "Is test server setup? [y/n]"
read is_test_server_setup


if [ "$is_test_server_setup" == "n" ]
then
  echo "Please ask DevOps team to setup the test server"
else
  echo "You are good to go"
fi
