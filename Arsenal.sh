#!/bin/bash 

#colors 
END="\e[1m"
Red="\e[31m"
GREEN="\e[32m"
BOLDGREEN="\e[1;${GREEN}"
YELLOW="\033[0;33m"
Cyan="\e[0;36m"
white="\e[0;37m"
#check you are root or not
if [ $EUID -ne 0 ]
  then echo -e "${Red}Please run as a root${END}"
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
╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚══════╝╚═╝  ╚═══╝╚═╝  ╚═╝╚══════╝ v2
                                 
 "

# creat a dir to your arsenal
mkdir Arsenal &> /dev/null
cd Arsenal 
requirements(){
    # check go 
    go_v=$(go version) 2> /dev/null
    if ! command -v go &> /dev/null
    then
        echo "go is not installed"
        echo "installing go now "
        sudo apt remove -y golang-go &>/dev/null
        sudo rm -rf /usr/local/go &>/dev/null
        wget https://go.dev/dl/go1.20.1.linux-amd64.tar.gz &>/dev/null
        sudo tar -xvf go1.20.1.linux-amd64.tar.gz -C /usr/local/ &>/dev/null
        export GOPATH=$HOME/go
        export PATH=$PATH:/usr/local/go/bin
        export PATH=$PATH:$GOPATH/bin
        source /etc/profile #to update you shell don't worry
    else
        echo -e "${Cyan}Go is already installed and your version is: ${go_v:13}${END}"
    fi
    if ! command -v go &> /dev/null
    then
        echo "If you get this message, run 'source /etc/profile' to update your shell and run again. #golang is installed, have a good day!"
        exit
    fi
    apt install build-essential -y &> /dev/null

    # Check For The requirements
    if ! command -v git ruby rustc python3 &> /dev/null
    then
        echo "Git, Ruby, Rust, or Python is not installed. We will install them for you now."
        echo "Installing Git"
        apt install git -y &> /dev/null
        echo "Installing Ruby"
        apt install ruby-full -y &
        echo "Installing Rust"
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh &> /dev/null
        echo "Installing Python"
        apt install python3 -y &> /dev/null
        apt install python3-pip -y &> /dev/null
    else
        echo -e "${BOLDGREEN}All requirements are already installed.${END}"
    fi
}
#Tools Time
Tools(){
    # Check if httpx installed or not
    if ! command -v httpx -h &> /dev/null
    then
        echo "installing httpx now"
        go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest &> /dev/null
        echo "httpx has been installed"
    else
        echo "httpx is already installed"
    fi

    # Check if httprobe installed or not
    if ! command -v httprobe &> /dev/null
    then
        echo "installing httprobe now"
        go install github.com/tomnomnom/httprobe@latest
        sudo cp $HOME/go/bin/httprobe /usr/local/bin
        echo "httprobe has been installed"
    else
        echo "httprobe is already installed"
    fi

    # Check if amass installed or not
    if ! command -v amass &> /dev/null
    then
        echo "Installing amass now"
        go install -v github.com/OWASP/Amass/v3/...@master &> /dev/null
        sudo cp $HOME/go/bin/amass /usr/local/bin
        echo "amass has been installed"
    else
        echo "amass is already installed"
    fi

    # Check if gobuster installed or not
    if ! command -v gobuster &> /dev/null
    then
        echo "Installing gobuster now"
        go install github.com/OJ/gobuster/v3@latest &> /dev/null
        sudo cp $HOME/go/bin/gobuster /usr/local/bin
        echo "GoBuster has been installed"
    else
        echo "Gobuster is already installed"
    fi

    # Check if nuclei installed or not
    if ! command -v nuclei &> /dev/null
    then
        echo "Installing nuclei now"
        go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest &> /dev/null
        sudo cp $HOME/go/bin/nuclei /usr/local/bin
        echo "nuclei installation is done"
    else
        echo "nuclei is already installed"
    fi

    # Check if subfinder installed or not
    if ! command -v subfinder &> /dev/null
    then
        echo "Installing subfinder now"
        go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest &> /dev/null
        sudo cp $HOME/go/bin/subfinder /usr/local/bin
        echo "subfinder installation is done"
    else
        echo "subfinder is already installed"
    fi

    # Check if assetfinder is installed or not
    if ! command -v assetfinder &> /dev/null
    then
        echo "installing assetfinder now"
        go install github.com/tomnomnom/assetfinder@latest &> /dev/null
        echo "assetfinder has been installed"
    else
        echo "assetfinder is already installed"
    fi

    # Check if ffuf installed or not
    if ! command -v ffuf &> /dev/null
    then
        echo "Installing ffuf now"
        go install github.com/ffuf/ffuf@latest
        cp $HOME/go/bin/ffuf /usr/local/bin
        echo "ffuf has been installed"
    else
        echo "ffuf is already installed"
    fi

    # Check if gf installed or not
    if ! command -v gf &> /dev/null
    then
        echo "installing gf now"
        go install github.com/tomnomnom/gf@latest &> /dev/null
        cp $HOME/go/bin/gf /usr/local/bin
        echo "gf has been installed"
    else
        echo "gf is already installed"
    fi

    # Check if meg installed or not
    if ! command -v meg &> /dev/null
    then
        echo "Instaliing meg now"
        go install github.com/tomnomnom/meg@latest &> /dev/null
        cp $HOME/go/bin/meg /usr/local/bin
        echo "meg has been installed"
    else
        echo "meg is already installed"
    fi

    # Check if waybackurls installed or not
    if ! command -v waybackurls &> /dev/null
    then
        echo "installing waybackurls now"
        go install github.com/tomnomnom/waybackurls@latest &> /dev/null
        cp $HOME/go/bin/waybackurls /usr/local/bin
	      echo "waybackurls has been installed"

    else
        echo "waybackurls is already installed"
fi

    if ! command -v subzy &> /dev/null
    then

            go install -v github.com/LukaSikic/subzy@latest &> /dev/null
            echo "installing subzy now "
            sudo cp $HOME/go/bin/subzy /usr/local/bin
            echo "subzy has been installed"
            
            

    else
        echo "subzy already installed"


    fi
if ! command -v asnmap -h &> /dev/null
then
        echo "installing asnmap now "
        go install github.com/projectdiscovery/asnmap/cmd/asnmap@latest &> /dev/null
        echo "asnmap has been installed"

    else
        echo "asnmap is already installed"

fi

if ! command -v jsleak -h &> /dev/null
then
        echo "installing jsleak now "
        go install github.com/channyein1337/jsleak@latest &> /dev/null
        echo "jsleak has been installed"

    else
        echo "jsleak is already installed"

fi


if ! command -v mapcidr -h &> /dev/null
then
        echo "installing mapcidr now "
        go install -v github.com/projectdiscovery/mapcidr/cmd/mapcidr@latest &> /dev/null
        echo "mapcidr has been installed"

    else
        echo "mapcidr is already installed"

fi

if ! command -v dnsx &> /dev/null
then
        echo "installing dnsx now "
        go install -v github.com/projectdiscovery/dnsx/cmd/dnsx@latest &> /dev/null
        sudo cp $HOME/go/bin/dnsx /usr/local/bin
        echo "dnsx has been installed"

    else
        echo "dnsx is already installed"

fi
if ! command -v gospider &> /dev/null
then

        echo "installing gospider now "
        go install github.com/jaeles-project/gospider@latest &> /dev/null
        sudo cp $HOME/go/bin/gospider /usr/local/bin
         echo "gospider has been installed"
     

    else
        echo "gospider is  already installed"
    fi
     if ! command -v wpscan &> /dev/null
then

        echo "installing wpscan now "
        gem install wpscan &> /dev/null
        if command -v wpscan -h
        then
         echo "wpscan has been installed"
        fi
        

    else
        echo "wpscan already installed"


fi
    if ! command -v CRLFuzz &> /dev/null
then
        echo "installing CRLFuzz now "
        go install github.com/dwisiswant0/crlfuzz/cmd/crlfuzz@latest &> /dev/null
        sudo cp $HOME/go/bin/crlfuzz /usr/local/bin
        
 #CRLFuzz
    else
        echo " CRLFuzz has been installed"
    fi


        echo "installing dontgo403 now "
        git clone https://github.com/devploit/dontgo403 &> /dev/null
        cd dontgo403 
         go get &> /dev/null
         go build &> /dev/null
         echo " Try ./dontgo403 -h to run "
         cd - &> /dev/null
        

 if ! command -v katana -h &> /dev/null
then
 
        echo "installing katana now "
        go install github.com/projectdiscovery/katana/cmd/katana@latest 
        sudo cp $HOME/go/bin/katana /usr/local/bin
        echo "Katana has been installed"
        
        

    else
        echo "katana is already  installed"
    fi


     if ! command -v uncover &> /dev/null
then

        echo "installing uncover now "
        go install -v github.com/projectdiscovery/uncover/cmd/uncover@latest &> /dev/null
        sudo cp $HOME/go/bin/uncover /usr/local/bin
        echo "uncover has been installed"

        
        
    else
        echo "uncover is already  installed"
    fi
if ! command -v dalfox &> /dev/null
then
 
        echo "installing Dalfox now "
        go install github.com/hahwul/dalfox/v2@latest &> /dev/null
        cp $HOME/go/bin/dalfox /usr/local/bin
        echo "dalfox has been installed"
        
    else
        echo "dalfox is already installed"


fi

if ! command -v GoLinkFinder &> /dev/null
then
        
        echo "installing GoLinkFinder now "
        go install github.com/0xsha/GoLinkFinder@latest &> /dev/null
        cp $HOME/go/bin/GoLinkFinder /usr/local/bin
        echo "GoLinkFinder has been installed"
        

    else
        echo "GoLinkFinder is already installed"

fi
 if ! command -v hakrawler &> /dev/null
     then 
    echo "installing hakrawler now "

     go install github.com/hakluke/hakrawler@latest &> /dev/null
     cp $HOME/go/bin/hakrawler /usr/local/bin
     echo "Hakrawler has been installed"
     
     
     else 
             echo "hakrawler is already installed"

  fi
     
 if ! command -v csprecon &> /dev/null
    then
    echo "installing csprecon now "

     go install github.com/edoardottt/csprecon/cmd/csprecon@latest &> /dev/null
     echo "csprecon has been installed"
     

    else
        echo "csprecon is already installed"

fi

if ! command -v gotator &> /dev/null
    then
    echo "installing gotator now "

    `go env -w GO111MODULE="auto"`
    go install github.com/Josue87/gotator@latest &> /dev/null
    echo "gotator has been installed"

    else
        echo "gotator is already installed"

fi
if ! command -v osmedeus &> /dev/null
    then
    echo "installing osmedeus now "

    go install -v github.com/j3ssie/osmedeus@latest &> /dev/null
    echo "osmedeus has been installed"
     

    else
        echo "osmedeus is already installed"

fi

if ! command -v shuffledns &> /dev/null
    then
    echo "Installing shuffledns Now"
     go install -v github.com/projectdiscovery/shuffledns/cmd/shuffledns@latest  &> /dev/null
     echo "shuffledns has been installed"
     

    else
        echo "shuffledns is already installed"

fi

if ! command -v socialhunter -h &> /dev/null
    then

     go install github.com/utkusen/socialhunter@latest &> /dev/null
     echo "socialhunter has been installed"
     

    else
        echo "socialhunter is already installed"

fi

if ! command -v getJS &> /dev/null
    then
    echo "installing getJS"
    go install github.com/003random/getJS@latest &> /dev/null
    echo "getJS has been installed"

     

    else
        echo "getJS is already installed"

fi

echo "Time to install some python Tools"
sleep 3s

      echo -e "installing knockpy"
     git clone https://github.com/guelfoweb/knock.git &> /dev/null
     cd knock || exit
     pip3 install -r requirements.txt &> /dev/null
     cd -
     
    read -p "Do You want install XSStrike (Y/n) " choice 
     case $choice in
     no | No | NO | n)
     ;;
     yes| YES | Yes | y | Y )
     echo -e "installing XSStrike"
     git clone https://github.com/s0md3v/XSStrike &> /dev/null
     cd XSStrike || exit
     pip3 install -r requirements.txt
     echo -e "XSStrike has been installed"
           ;;
        esac
     cd - &> /dev/null 
  
    read -p "Do You want install Logsensor (Y/n) " choice
     case $choice in
     no | No | NO | n)
     ;;
     yes| YES | Yes | y | Y)
     echo -e "installing Logsensor"
     git clone https://github.com/Mr-Robert0/Logsensor.git &> /dev/null
    cd Logsensor
    chmod +x logsensor.py
    chmod +x install.sh
    pip install -r requirements.txt
    ./install.sh &> /dev/null
    echo "Logsensor has been installed"
          ;;
        esac
    cd - &> /dev/null || exit
     
 read -p "Do You want install Altdns (Y/n) " choice
     case $choice in
     no | No | NO | n)
     ;;
     yes| YES | Yes | y | Y)
     echo -e "installing Altdns"
      git clone https://github.com/infosec-au/altdns.git &> /dev/null
        cd altdns || exit
        pip3 install -r requirements.txt
        echo "Altdns has been installed"
        echo "to run try python3 altdns --help"
              ;;
        esac
        cd - &> /dev/null || exit

     
     
     read -p "Do You want install xnLinkFinder (Y/n) " choice
     case $choice in
     no | No | NO | n)
     ;;
     yes| YES | Yes | y | Y)
    git clone https://github.com/xnl-h4ck3r/xnLinkFinder.git  &> /dev/null
    cd xnLinkFinder || exit
    python3 setup.py install
        echo "xnLinkFinder has been installed"
        ;;
        esac
        cd - || exit
    
      read -p "Do You want install ParamSpider (Y/n) " choice
     case $choice in
     no | No | NO | n)
     ;;
     yes| YES | Yes | y | Y )
    git clone https://github.com/devanshbatham/ParamSpider &> /dev/null
    cd ParamSpider || exit
    pip3 install -r requirements.txt
        echo "ParamSpider has been installed"
        echo "To use try python3 paramspider.py --domain target.com"
           ;;
        esac
        cd - &> /dev/null 
     
     read -p "Do You want install NoSQLMap (Y/n) " choice
     case $choice in
     no | No | NO | n)
     ;;
     yes| YES | Yes | y |Y )
    git clone https://github.com/codingo/NoSQLMap.git &> /dev/null
    cd NoSQLMap 
    python3 setup.py install /dev/null

        echo "NoSQLMap has been installed"
              ;;
        esac
        cd - &> /dev/null || exit
     

     

  read -p "Do You want install chameleon (Y/n) " choice
     case $choice in
     no | No | NO | n)
     ;;
     yes| YES | Yes | y | Y)
    curl -sL https://raw.githubusercontent.com/iustin24/chameleon/master/install.sh | bash

        echo "Chameleon has been installed"
             ;;
        esac
        cd -
     
     

 read -p "Do You want install GraphQLmap (Y/n) " choice
     case $choice in
     no | No | NO | n)
     ;;
     yes| YES | Yes | y | Y)
    git clone https://github.com/swisskyrepo/GraphQLmap
    cd GraphQLmap/ || exit
    python3 setup.py install
        echo "GraphQLmap has been installed"
            ;;
        esac
        cd - 
     

 read -p "Do You want install WhatWeb (Y/n) " choice
     case $choice in
     no | No | NO | n)
     ;;
     yes| YES | Yes | y | Y)
     git clone https://github.com/urbanadventurer/WhatWeb.git
    cd WhatWeb/ 
    gem install bundler
    bundle update
    bundle install
    echo "WhatWeb has been installed"
         ;;
        esac
    cd -
     

read -p "Do You want install http request smuggling (Y/n) : " choice
     case $choice in
     no | No | NO | n | N)
     ;;
     yes| YES | Yes | y | Y)
    git clone https://github.com/anshumanpattnaik/http-request-smuggling.git
    cd http-request-smuggling || exit
    pip3 install -r requirements.txt
    echo "http request smuggling has been installed"
          ;;
        esac
    cd -
    
     


read -p "Do You want install commix (Y/n) : " choice
     case $choice in
     no | No | NO | n)
     ;;
     yes| YES | Yes | y | Y)
    git clone https://github.com/commixproject/commix.git commix
    cd commix || exit
    echo "commix has been installed"
          ;;
        esac
    cd - 
    
     

read -p "Do You want install JWT_TOOL (Y/n) : " choice
     case $choice in
     no | No | NO | n)
     ;;
     yes| YES | Yes | y | Y)
    git clone https://github.com/ticarpi/jwt_tool
    cd jwt_tool || exit
    python3 -m pip install termcolor cprint pycryptodomex requests
    chmod +x jwt_tool.py
    echo "JWT_TOOL has been installed"
          ;;
        esac
    cd -
    
     


read -p "Do You want install Arjun (Y/n) : " choice
     case $choice in
     no | No | NO | n)
     ;;
     yes| YES | Yes | y | Y)
    git clone https://github.com/s0md3v/Arjun
    cd Arjun || exit
    python3 setup.py install    
    echo "Arjun has been installed"
          ;;
        esac
    cd -
    
     
read -p "Do You want install Gitleaks (Y/n) : " choice
     case $choice in
     no | No | NO | n)
     ;;
     yes| YES | Yes | y | Y)
    git clone https://github.com/zricethezav/gitleaks.git 
    cd gitleaks || exit
    make build
    mv gitleaks /usr/local/bin
          ;;
        esac
    cd - || exit
    
         
     
}


requirements
Tools
