#!/bin/bash 
#color
END="\e[1m"
Red="\e[31m"
GREEN="\e[32m"
BOLDGREEN="\e[1;${GREEN}"
YELLOW="\033[0;33m"

# check you are root or not 
if [ $EUID -ne 0 ]
  then echo -e "${Red}Please run as root${END}"
  exit
fi
#banner for Script to look cool

echo -e "
${Red}
 █████╗ ██████╗ ███████╗███████╗███╗   ██╗ █████╗ ██╗     
██╔══██╗██╔══██╗██╔════╝██╔════╝████╗  ██║██╔══██╗██║     
███████║██████╔╝███████╗█████╗  ██╔██╗ ██║███████║██║     
██╔══██║██╔══██╗╚════██║██╔══╝  ██║╚██╗██║██╔══██║██║     
██║  ██║██║  ██║███████║███████╗██║ ╚████║██║  ██║███████╗
╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚══════╝╚═╝  ╚═══╝╚═╝  ╚═╝╚══════╝ 
                                   by @Micro0x00 "

#versions 
git_v=$(git --version) &> /dev/null
py_v=$(python3 --version) &> /dev/null
go_v=$(go version) &> /dev/null
# Check For The requirements
echo "Check the requirements"
sleep 1s
if ! command -v git &> /dev/null
then
    echo "git is not installed we will installed it for you now "
    echo "Installing Git"
    apt-get install git -y &> /dev/null
    if command -v git &> /dev/null
    then
        echo "DONE"
    fi
else 
    echo -e "${BOLDGREEN}git is already install and your ${git_v}${END}"
fi
if ! command -v python &> /dev/null
then
    echo "python is not installed we will installed it for you now "
    apt-get install python3 -y &> /dev/null
    apt install python3-pip -y &> /dev/null
    if command -v python3 &> /dev/null
    then
        echo "DONE"
    fi
else 
    echo -e "${BOLDGREEN}python is already install and your ${py_v}${END}"
fi

if ! command -v go &> /dev/null
then
    echo "go is not installed we will installed it for you now "
    # sudo add-apt-repository ppa:ubuntu-lxc/lxd-stable # adding not work in all (distro)

    sudo apt-get install golang
    if command -v go &> /dev/null
    then
        echo "DONE"
    fi
else 
    echo -e "${RED}go is already install and your ${go_v}${END}"
fi
sleep 0.5s
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
mkdir Arsenal
cd Arsenal
#Tools Time
if ! command -v httprobe &> /dev/null
    then
    read -p "Do You want install httprobe " choice
    case $choice in 
    no | No | NO | n)
    echo -e "okay "
    ;;
    yes| YES | Yes | y )
    echo -e "okay "
    echo "Instaliing httprobe now "
    go install github.com/tomnomnom/httprobe@latest
    cd $GOPATH/bin
    cp amass /usr/local/bin 
    ;;
    esac
    else 
    echo "its already installed"
    
    fi
if ! command -v httpx -h &> /dev/null
then
read -p "Do you want install httpx (yes/no) ? " choice
case $choice in

  no | NO | n | No)
    echo -n "okay as you like "
    ;;

  yes | YES | Y | Yes)
    echo "now"
        echo "installing now"
        git clone https://github.com/projectdiscovery/httpx.git
        cd httpx/cmd/httpx 
        go build
        cp httpx /usr/local/bin
        if command -v httpx &> /dev/null
        then
        echo "Installed Sucselfiu"
        fi
                ;;
esac

    else
        echo "Httpx is already installed"    
fi
  if ! command -v amass &> /dev/null
    then
    read -p "Do You want install ammas " choice
    case $choice in 
    no | No | NO | n)
    echo -e "okay "
    ;;
    yes| YES | Yes | y )
    echo -e "okay "
    echo "Instaliing amass now "
    go install -v github.com/OWASP/Amass/v3/...@master
    cd $GOPATH/bin
    cp amass /usr/local/bin 
    ;;
    esac
    else 
    echo "its already installed"
    
    fi
 if ! command -v gobuster &> /dev/null
    then
 read -p "Do You want install gobuster " choice
    case $choice in 
    no | No | NO | n)
    echo -e "okay "
    ;;
    yes| YES | Yes | y )
    echo -e "okay "
    echo "Instaliing gobuster now "
    go install github.com/OJ/gobuster/v3@latest
    cd $GOPATH/bin
    cp gobuster /usr/local/bin 
    ;;
    esac
    else 
    echo "its gobuster installed"
    
 fi
 if ! command -v nuclei &> /dev/null
 then
 read -p "Do You want install nuclei " choice
    case $choice in 
    no | No | NO | n)
    echo -e "okay "
    ;;
    yes| YES | Yes | y )
    echo -e "okay "
    echo "Instaliing gobuster now "
    go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
    cd $GOPATH/bin
    cp nuclei /usr/local/bin
    ;;
    esac 
    if command -v nuclei &> /dev/null
    then
        echo "nuclei installiotion is done"
     fi
    else 
    echo "its nuclei installed"
    
 fi
 if ! command -v subfinder &> /dev/null
then
    read -p "Do You want install subfinder " choice
    case $choice in 
        no | No | NO | n)
        echo -e "okay"
        ;;
        yes| YES | Yes | y )
        echo -e "okay "
        echo "Instaliing subfinder now "
        go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
        cd $GOPATH/bin
        cp subfinder /usr/local/bin
        ;;
        esac 

    else 
    echo "its subfinder installed"
    if ! command -v assetfinder &> /dev/null
then
    read -p "Do You want install assetfinder " choice
    case $choice in 
        no | No | NO | n)
        echo -e "okay"
        ;;
        yes| YES | Yes | y )
        echo -e "okay "
        echo "Instaliing assetfinder now "
        go get -u github.com/tomnomnom/assetfinder
        cd $GOPATH/bin
        cp assetfinder /usr/local/bin
        ;;
        esac 

    else 
        echo "its assetfinder installed"


fi
    if ! command -v subfinder &> /dev/null
then
    read -p "Do You want install ffuf " choice
    case $choice in 
        no | No | NO | n)
        echo -e "okay"
        ;;
        yes| YES | Yes | y )
        echo -e "okay "
        echo "Instaliing ffuf now "
        go install github.com/ffuf/ffuf@lates
        cd $GOPATH/bin
        cp ffuf /usr/local/bin
        ;;
        esac 

    else 
        echo "its ffuf installed"


fi
 
 read -p "Do You want install knockpy " choice
     case $choice in 
     no | No | NO | n)
     echo -e "okay"
     ;;
     yes| YES | Yes | y )
     echo -e "installing knockpy"
     git clone https://github.com/guelfoweb/knock.git
     cd knock
     pip3 install -r requirements.txt
     ;;
     esac
      read -p "Do You want install XSStrike (yes/no) " choice
     case $choice in 
     no | No | NO | n)
     echo -e "okay"
     ;;
     yes| YES | Yes | y )
     echo -e "installing XSStrike"
     git clone https://github.com/s0md3v/XSStrike
     cd XSStrike
     pip3 install -r requirements.txt
     echo -e "Done"
     ;;
     esac
    if ! command -v assetfinder &> /dev/null
then
    read -p "Do You want install assetfinder " choice
    case $choice in 
        no | No | NO | n)
        echo -e "okay"
        ;;
        yes| YES | Yes | y )
        echo -e "okay "
        echo "Instaliing subzy now "
       go get -u -v github.com/lukasikic/subzy
        go install -v github.com/lukasikic/subzy@latest 
        cd $GOPATH/bin
        cp subzy /usr/local/bin
        ;;
        esac 

    else 
        echo "its subzy installed"


fi
if ! command -v assetfinder &> /dev/null
then
    read -p "Do You want install dnsx " choice
    case $choice in 
        no | No | NO | n)
        echo -e "okay"
        ;;
        yes| YES | Yes | y )
        echo -e "okay "
        echo "Instaliing dnsx now "
        go install -v github.com/projectdiscovery/dnsx/cmd/dnsx@latest
        cd $GOPATH/bin
        cp assetfinder /usr/local/bin
        ;;
        esac 

    else 
        echo "its dnsx installed"


fi

