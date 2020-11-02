sudo apt-get update

# force color output on terminal
sed -ie "s/#force_color_prompt=yes/force_color_prompt=yes/" ~/.bashrc
source ~/.bashrc