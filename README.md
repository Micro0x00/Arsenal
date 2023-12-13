# Arsenal
<h1 align="center">
  <img src="https://i.imgur.com/0sx9YWQ.jpg" alt="subfinder" width="500" >
  <br>
</h1>

<h4 align="center">Recon Tool installer</h4>

<p align="center">
<a href="https://twitter.com/Micro0x00"><img src="https://img.shields.io/twitter/follow/Micro0x00.svg?logo=twitter"></a>
</p>

----

Arsenal is a Simple shell script (Bash) used to install the most important tools and requirements for your environment and save time in installing all these tools.
 ## Tools in Arsenal

|Name| description |
|---|---|
| Amass | The OWASP Amass Project performs network mapping of attack surfaces and external asset discovery using open source information gathering and active reconnaissance techniques  |
| ffuf | A fast web fuzzer written in Go  |
| dnsX | Fast and multi-purpose DNS toolkit allow to run multiple DNS queries  |
| meg | meg is a tool for fetching lots of URLs but still being 'nice' to servers  |
| gf | A wrapper around grep to avoid typing common patterns |
| XnLinkFinder | This is a tool used to discover endpoints crawling a target |
| httpX |  httpx is a fast and multi-purpose HTTP toolkit allow to run multiple probers using retryablehttp library, it is designed to maintain the result reliability with increased threads|
| Gobuster| Gobuster is a tool used to brute-force (DNS,Open Amazon S3 buckets,Web Content) |
| Nuclei | Nuclei tool is Golang Language-based tool used to send requests across multiple targets based on nuclei templates leading to zero false positive or irrelevant results and provides fast scanning on various host|
| Subfinder | Subfinder is a subdomain discovery tool that discovers valid subdomains for websites by using passive online sources. It has a simple modular architecture and is optimized for speed. subfinder is built for doing one thing only - passive subdomain enumeration, and it does that very well |
| Naabu | Naabu is a port scanning tool written in Go that allows you to enumerate valid ports for hosts in a fast and reliable manner. It is a really simple tool that does fast SYN/CONNECT scans on the host/list of hosts and lists all ports that return a reply |
| assetfinder |Find domains and subdomains potentially related to a given domain |
|httprobe|  Take a list of domains and probe for working http and https servers |
| knockpy| Knockpy is a python3 tool designed to quickly enumerate subdomains on a target domain through dictionary attack |
| waybackurl | fetch known URLs from the Wayback Machine for *.domain and output them on stdout |
| Logsensor | A Powerful Sensor Tool to discover login panels, and POST Form SQLi Scanning |
|Subzy |Subdomain takeover tool which works based on matching response fingerprints from can-i-take-over-xyz |
| Xss-strike | Advanced XSS Detection Suite|
| Altdns | Subdomain discovery through alterations and permutations |
| Nosqlmap | NoSQLMap is an open source Python tool designed to audit for as well as automate injection attacks and exploit default configuration weaknesses in NoSQL databases and web applications using NoSQL in order to disclose or clone data from the database|
| ParamSpider | Parameter miner for humans |
|GoSpider| GoSpider - Fast web spider written in Go
|eyewitness|EyeWitness is a Python tool written by @CptJesus and @christruncer. It’s goal is to help you efficiently assess what assets of your target to look into first.|
|CRLFuzz| A fast tool to scan CRLF vulnerability written in Go|
| DontGO403 |dontgo403 is a tool to bypass 40X errors |
| Chameleon| Chameleon provides better content discovery by using wappalyzer's set of technology fingerprints alongside custom wordlists tailored to each detected technologies |
| uncover |uncover is a go wrapper using APIs of well known search engines to quickly discover exposed hosts on the internet. It is built with automation in mind, so you can query it and utilize the results with your current pipeline tools |
| wpscan | WordPress Security Scanner |
| GraphQLmap| GraphQLmap is a scripting engine to interact with a graphql endpoint for pentesting purposes |
| dalfox | DalFox is an powerful open source XSS scanning tool and parameter analyzer and utility that fast the process of detecting and verify XSS flaws. It comes with a powerful testing engine, many niche features for the cool hacker!|
|http request smuggling | HTTP Request Smuggling Detection Tool|
|commix|Commix (short for [comm]and [i]njection e[x]ploiter) is an open source penetration testing tool, written by Anastasios Stasinopoulos (@ancst), that automates the detection and exploitation of command injection vulnerabilities|
| GoLinkFinder | A minimal JS endpoint extractor | 
| JWT Toolkit v2 | JWT Tookkit is a toolkit for validating, forging, scanning and tampering JWTs (JSON Web Tokens) |
| GitLeaks | check git repos for secrets and keys |
| csprecon | Discover new target domains using Content Security Policy |
| WhatWeb | Next generation web scanner | 
| Arjun | Arjun can find query parameters for URL endpoints. If you don't get what that means, it's okay, read along |
| Hakrawler| Fast golang web crawler for gathering URLs and JavaScript file locations. This is basically a simple implementation of the awesome Gocolly library |
| Katana | A next-generation crawling and spidering framework |
| GetJS |getJS is a tool to extract all the javascript files from a set of given urls |
| Gotator | Gotator is a tool to generate DNS wordlists through permutations |
| Osemdeus |Osmedeus - A Workflow Engine for Offensive Security | 
| socialhunter | it's tool to test borken link hijaked Crawls the given URL and finds broken social media links that can be hijacked. Broken social links may allow an attacker to conduct phishing attacks. It also can cost a loss of the company's reputation. Broken social media hijack issues are usually accepted on the bug bounty programs. | 
| mapCIDR | mapCIDR is developed to ease load distribution for mass scanning operations, it can be used both as a library and as independent CLI tool. |
| shuffleDNS | shuffleDNS is a wrapper around massdns, written in go, that allows you to enumerate valid subdomains using active bruteforce, as well as resolve subdomains with wildcard handling and easy input-output support. | 
| jsleak | ommand-line tool designed to uncover secrets and links in JavaScript files or source code. The jsleak was inspired by Linkfinder and regexes are collected from multiple sources.|
| asnmap | Go CLI and Library for quickly mapping organization network ranges using ASN information.|



----
## Requirements in Arsenal:heavy_check_mark:

 - Python3
 - Git
 - Ruby
 - Wget
 - GO-Lang
 - Rust
 
 ----
 ## Go-lang installation (Manual)
     sudo apt-get remove -y golang-go
     sudo rm -rf /usr/local/go
     wget go.dev/dl/go1.20.4.linux-amd64.tar.gz
     sudo tar -xvf go1.20.4.linux-amd64.tar.gz
     sudo mv go /usr/local
     nano /etc/profile or .profile
     export GOPATH=$HOME/go
     export PATH=$PATH:/usr/local/go/bin
     export PATH=$PATH:$GOPATH/bin 
     source /etc/profile #to update you shell dont worry
----
## How to install

    git clone https://github.com/Micro0x00/Arsenal.git
	cd Arsenal
	sudo chmod +x Arsenal.sh
	sudo ./Arsenal.sh


<h1 align="center">
  <img src="https://i.imgur.com/ZEGGucH.png" alt="arsenal" width="700" >
  <br>
</h1>


<h3 align="left">Support:</h3>  
<p><a href="https://www.buymeacoffee.com/Micro0x00"> <img align="left" src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" height="50" width="210" alt="Micro0x00" /></a></p><br><br>  
