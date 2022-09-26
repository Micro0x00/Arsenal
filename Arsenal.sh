#!/bin/bash
#color
END="\e[1m"
Red="\e[31m"
GREEN="\e[32m"
BOLDGREEN="\e[1;${GREEN}"
YELLOW="\033[0;33m"
Cyan="\e[0;36m"
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
╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚══════╝╚═╝  ╚═══╝╚═╝  ╚═╝╚══════╝ v1
                                 
                                 twitter:Micro0x00
                                 by @Mohamed Mater "

# creat a dir to your arsenal
mkdir Arsenal
cd Arsenal
requirements(){
go_v=$(go version) &>/dev/nulls
if ! command -v go &> /dev/null
then
    echo "go is not installed"
    echo "Please install go "
    echo "Check this "
    echo "https://github.com/Micro0x00/Arsenal/blob/main/README.md#go-lang-installation"
    # sudo apt-get remove -y golang-go
    # sudo rm -rf /usr/local/go
    # wget https://go.dev/dl/go1.19.1.linux-amd64.tar.gz
        # sudo tar -xvf go1.19.1.linux-amd64.tar.gz
        # sudo mv go /usr/local
    # sudo echo "export GOPATH=$HOME/go" >> /etc/profile
    # sudo echo "export PATH=$PATH:/usr/local/go/bin" >> /etc/profile
    # sudo echo "export PATH=$PATH:$GOPATH/bin" >> /etc/profile
    # source /etc/profile #to update you shell dont worry
    exit
else
echo -e "${Cyan}go is already install and your ${go_v}${END}"
fi

#version
git_v=$(git --version) &> /dev/null
py_v=$(python3 --version) &> /dev/null
ruby_v=$(ruby -v) &>/dev/nulls
rust_v=$(rustc --version)

# Check For The requirements
echo "Check the requirements"
sleep 4s
if ! command -v git &> /dev/null
then
    echo "git is not installed we will installed it for you now "
    echo "Installing Git"
    apt-get install git -y &> /dev/null
    if command -v git &> /dev/null
    then
        echo "githas been installed"
    fi
else
    echo -e "${BOLDGREEN}git is already install and your ${git_v}${END}"
fi
if ! command -v ruby -v &> /dev/null
then
    echo "ruby is not installed we will installed it for you now "
    echo "Installing ruby"
    apt-get install ruby-full -y
    if command -v ruby -v &> /dev/null
    then
        echo "Rubyhas been installed"
    fi
else
    echo -e "${Red}ruby is already install and your ${ruby_v}${END}"
fi
if ! command -v  rustc --version  &> /dev/null
then
    echo "rust is not installed we will installed it for you now "
    echo "Installing rust"
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    if command -v rustc --versiony &> /dev/null
    then
        echo "Rusthas been installed"
    fi
else
    echo -e "rust is already install and your ${rust_v}"
fi
if ! command -v python3 &> /dev/null
then
    echo "python is not installed we will installed it for you now "
    apt-get install python3 -y &> /dev/null
    apt install python3-pip -y &> /dev/null
    if command -v python3 &> /dev/null
    then
        echo "DONE"
    fi
else
    echo -e "${YELLOW}python is already install and your ${py_v}${END}"
fi


}
#Tools Time
Tools(){
    # echo "Check if httpx installed or not"
    if ! command -v httpx -h &> /dev/null
then
read -p "Do you want install httpx (Y/n) ? " choice
case $choice in

  no | NO | n | No | N)
    echo  "okay hava a good day "
    ;;

  yes | YES | Y | Yes | y)
        echo "installing httpx now"
        go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest &> /dev/null
        sudo cp $HOME/go/bin/httpx /usr/local/bin
        if command -v httpx &> /dev/null
        then
        echo "httpx has been installed "
        fi
                ;;
esac

    else
        echo "httpx is already installed"
fi
    # echo "Check if httprobe installed or not"
if ! command -v  &> /dev/null
    then
    read -p "Do You want install httprobe " choice
    case $choice in
    no | No | NO | n)
    echo -e "okay "
    ;;
    yes| YES | Yes | y | Y )
    echo -e "okay "
    echo "Instaliing httprobe now "
    go install github.com/tomnomnom/httprobe@latest
    sudo cp $HOME/go/bin/httprobe /usr/local/bin
    echo "httprobe has been installed"

    ;;
    esac
    else
    echo "httprobe is already installed"

    fi
        # echo "Check if amass installed or not"
  if ! command -v amass &> /dev/null
    then
    read -p "Do You want install ammas (Y/n) ?" choice
    case $choice in
    no | No | NO | n)
    echo -e "okay have a good day "
    ;;
    yes| YES | Yes | y | Y)
    go install -v github.com/OWASP/Amass/v3/...@master &> /dev/null
        echo "Instaliing amass now "
    sudo cp $HOME/go/bin/amass /usr/local/bin
      echo "amass has been installed"
    ;;
    esac
    else
   echo "amass is already installed"

    fi
 if ! command -v gobuster &> /dev/null
    then
 read -p "Do You want install gobuster (yes/no) ?" choice
    case $choice in
    no | No | NO | n)
    echo -e "okay "
    ;;
    yes| YES | Yes | y )
    echo -e "okay "
    go install github.com/OJ/gobuster/v3@latest
    echo "Instaliing gobuster now "

    sudo cp $HOME/go/bin/gobuster /usr/local/bin
    echo "GoBuster has been installed"
    ;;
    esac
    else
    echo "Gobuster is already installed"

 fi
 if ! command -v nuclei &> /dev/null
 then
 read -p "Do You want install nuclei (Y/n) ? " choice
    case $choice in
    no | No | NO | n)
    echo -e "okay "
    ;;
    YES | Yes | y | yes | Y)
    echo "Instaliing nuclei now "
    go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
    sudo cp $HOME/go/bin/nuclei /usr/local/bin
     echo "nuclei installiotion is done"

    ;;
    esac
    else
       echo "nuclei is already installed"


   fi

 if ! command -v subfinder &> /dev/null
then
    read -p "Do You want install subfinder (Y/n) ?" choice
    case $choice in
        no | No | NO | n )
        echo -e "okay"
        ;;
        yes| YES | Yes | y | Y )
        echo -e "okay "
        echo "Instaliing subfinder now "
        go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
        sudo cp $HOME/go/bin/subfinder /usr/local/bin
        ;;
        esac

    else
    echo "subfinder is already installed"
fi
    if ! command -v assetfinder &> /dev/null
then
    read -p "Do You want install assetfinder (Y/n) ?" choice
    case $choice in
        no | No | NO | n)
        echo -e "Okay have a good day"
        ;;
        yes| YES | Yes | y | Y)
        echo "Instaliing assetfinder now "
        sudo go install github.com/tomnomnom/assetfinder@latest
        sudo cp $HOME/go/bin/assetfinder /usr/local/bin
        echo "assetfinder has been installed "

        ;;
        esac

    else
        echo " assetfinder is installed"


fi
    if ! command -v ffuf &> /dev/null
then
    read -p "Do You want install ffuf (Y/n) ? " choice
    case $choice in
        no | No | NO | n)
        echo -e "okay"
        ;;
        yes| YES | Yes | y | Y )
        echo -e "okay "
        echo "Instaliing ffuf now "
        go install github.com/ffuf/ffuf@latest
        cp $HOME/go/bin/ffuf /usr/local/bin
        echo "ffuf has been installed "

        ;;
        esac

    else
        echo "ffuf is already installed"


fi
if ! command -v gf &> /dev/null
then
    read -p "Do You want install gf (Y/n) ?" choice
    case $choice in
        no | No | NO | n)
        echo -e "okay"
        ;;
        yes| YES | Yes | y )
        echo -e "okay "
        echo "Instaliing gf now "
        go install github.com/tomnomnom/gf@latest
        cp $HOME/go/bin/gf /usr/local/bin
        echo "gf has been installed"
        ;;
        esac

    else
        echo "gf is already installed"


fi
 if ! command -v meg &> /dev/null
then
    read -p "Do You want install meg (Y/n) ?" choice
    case $choice in
        no | No | NO | n)
        echo -e "okay"
        ;;
        yes| YES | Yes | y | Y)
        echo -e "okay "
        echo "Instaliing meg now "
        go install github.com/tomnomnom/meg@latest
        cp $HOME/go/bin/meg /usr/local/bin
        echo "meg has been installed"
        ;;
        esac

    else
        echo "meg is already installed"


fi
if ! command -v waybackurls &> /dev/null
then
    read -p "Do You want install waybackurls (Y/n) ?" choice
    case $choice in
        no | No | NO | n)
        echo -e "okay"
        ;;
        yes| YES | Yes | y | Y)
        echo -e "okay "
        echo "Instaliing waybackurls now "
        go install github.com/tomnomnom/waybackurls@latest
        cp $HOME/go/bin/waybackurls /usr/local/bin
        ;;
        esac

    else
        echo "waybackurls is already installed"


fi

    if ! command -v subzy &> /dev/null
    then
        read -p "Do You want install subzy (Y/n) ?" choice
        case $choice in
            no | No | NO | n)
            echo -e "okay"
            ;;
            yes| YES | Yes | y| Y )
            go get -u -v github.com/lukasikic/subzy &> /dev/null
            echo "Instaliing subzy now "

            go install -v github.com/lukasikic/subzy@latest

            sudo cp $HOME/go/bin/subzy /usr/local/bin
            echo "subzy has been installed"
            ;;
            esac

    else
        echo "subzy already installed"


    fi
if ! command -v dnsx &> /dev/null
then
    read -p "Do You want install dnsx (Y/n) ?" choice
    case $choice in
        no | No | NO | n)
        echo -e "okay"
        ;;
        yes| YES | Yes | y |Y )
        echo -e "okay "
        echo "Instaliing dnsx now "
        go install -v github.com/projectdiscovery/dnsx/cmd/dnsx@latest
        sudo cp $HOME/go/bin/dnsx /usr/local/bin
        echo "dnsx has been installed"
        ;;
        esac

    else
        echo "dnsx is already installed"

fi
if ! command -v gospider &> /dev/null
then
    read -p "Do You want install gospider (Y/n) ? " choice
    case $choice in
        no | No | NO | n)
        echo -e "okay"
        ;;
        yes| YES | Yes | y | Y)
        echo -e "okay "
        echo "Instaliing gospider now "
        go install github.com/jaeles-project/gospider@latest
        sudo cp $HOME/go/bin/gospider /usr/local/bin
         echo "gospider has been installed"
        ;;
        esac

    else
        echo " gospider is  already installed"
    fi
     if ! command -v wpscan &> /dev/null
then
    read -p "Do You want install wpscan (Y/n) ?" choice
    case $choice in
        no | No | NO | n)
        echo -e "okay"
        ;;
        yes| YES | Yes | y | Y)
        echo -e "okay "
        echo "Instaliing wpscan now "
        gem install wpscan
        if command -v wpscan -h
        then
         echo "wpscan has been installed"
        fi
        ;;
        esac

    else
        echo "wpscan already installed"


fi
    if ! command -v CRLFuzz &> /dev/null
then
    read -p "Do You want install CRLFuzz (Y/n) " choice
    case $choice in
        no | No | NO | n)
        echo -e "okay"
        ;;
        yes| YES | Yes | y | Y )
        echo -e "okay "
        echo "Instaliing CRLFuzz now "
        go install github.com/dwisiswant0/crlfuzz/cmd/crlfuzz@latest
        sudo cp $HOME/go/bin/crlfuzz /usr/local/bin
        ;;
        esac
 #CRLFuzz
    else
        echo " CRLFuzz has been installed"
    fi

    read -p "Do You want install dontgo403 (Y/n)" choice
    case $choice in
        no | No | NO | n)
        echo -e "okay"
        ;;
        yes| YES | Yes | y | Y)
        echo -e "okay "
        echo "Instaliing dontgo403 now "
        git clone https://github.com/devploit/dontgo403 &> /dev/null
        cd dontgo403
         go get
         go build
         echo "Try ./dontgo403 -h to run"
         cd -
        ;;
        esac

     if ! command -v uncover &> /dev/null
then
    read -p "Do You want install uncover (Y/n) ?" choice
    case $choice in
        no | No | NO | n)
        echo -e "okay"
        ;;
        yes| YES | Yes | y |Y )
        echo -e "okay "
        echo "Instaliing uncover now "
        go install -v github.com/projectdiscovery/uncover/cmd/uncover@latest &> /dev/null
        sudo cp $HOME/go/bin/uncover /usr/local/bin
        ;;
        esac
 #uncover
    else
        echo "uncover is already  installed"
    fi

 read -p "Do You want install knockpy (Y/n) " choice
     case $choice in
     no | No | NO | n)
     echo -e "okay hava a gooday"
     ;;
     yes| YES | Yes | y | Y )

     echo -e "installing knockpy"
     git clone https://github.com/guelfoweb/knock.git  &> /dev/null
     cd knock
     pip3 install -r requirements.txt
     cd -
     ;;
     esac
      read -p "Do You want install XSStrike (Y/n) " choice
     case $choice in
     no | No | NO | n)
     echo -e "okay"
     ;;
     yes| YES | Yes | y | Y )
     echo -e "installing XSStrike"
     git clone https://github.com/s0md3v/XSStrike &> /dev/null
     cd XSStrike
     pip3 install -r requirements.txt
     echo -e "Done"
     cd - &> /dev/null
     ;;
     esac
        read -p "Do You want install Logsensor (Y/n) " choice
     case $choice in
     no | No | NO | n)
     echo -e "okay"
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
    cd - &> /dev/null
     ;;
     esac
 read -p "Do You want install Altdns (Y/n) " choice
     case $choice in
     no | No | NO | n)
     echo -e "okay"
     ;;
     yes| YES | Yes | y | Y)
     echo -e "installing Altdns"
      git clone https://github.com/infosec-au/altdns.git &> /dev/null
        cd altdns
        pip3 install -r requirements.txt
        echo "Done"
        echo "to run try python3 altdns --help"
        cd - &> /dev/null

     ;;
     esac
     read -p "Do You want install xnLinkFinder (Y/n) " choice
     case $choice in
     no | No | NO | n)
     echo -e "okay"
     ;;
     yes| YES | Yes | y | Y)
    git clone https://github.com/xnl-h4ck3r/xnLinkFinder.git  &> /dev/null
    cd xnLinkFinder
    python3 setup.py install
        echo "xnLinkFinder has been installed"
        cd -
     ;;# nsb2 of j us45 ry 3ybd #encoded
    esac
      read -p "Do You want install ParamSpider (Y/n) " choice
     case $choice in
     no | No | NO | n)
     echo -e "okay"
     ;;
     yes| YES | Yes | y | Y )
    git clone https://github.com/devanshbatham/ParamSpider &> /dev/null
    cd ParamSpider
    pip3 install -r requirements.txt
        echo "ParamSpider has been installed"
        echo "To use try python3 paramspider.py --domain target.com"
        cd - &> /dev/null
     ;;
     esac
     read -p "Do You want install NoSQLMap (Y/n) " choice
     case $choice in
     no | No | NO | n)
     echo -e "okay"
     ;;
     yes| YES | Yes | y |Y )
    git clone https://github.com/codingo/NoSQLMap.git &> /dev/null
    cd NoSQLMap
    python3 setup.py install

        echo "NoSQLMap has been installed"
        cd - &> /dev/null
     ;;
     esac
     read -p "Do You want install EyeWitness (Y/n) " choice
     case $choice in
     no | No | NO | n)
     echo -e "okay"
     ;;
     yes| YES | Yes | y | Y)
    git clone https://github.com/FortyNorthSecurity/EyeWitness.git     &> /dev/null
    bash EyeWitness/Python/setup/setup.sh

        echo "EyeWitness has been installed"
        cd - &> /dev/null
     ;;
     esac

  read -p "Do You want install chameleon (Y/n) " choice
     case $choice in
     no | No | NO | n)
     echo -e "okay"
     ;;
     yes| YES | Yes | y | Y)
    cargo install --git https://github.com/iustin24/chameleon

        echo "Done"
        cd -
     ;;
     esac

}

requirements
Tools
