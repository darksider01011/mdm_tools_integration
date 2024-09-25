#!/bin/bash
 # Ansi color code variables
red="\e[0;91m"
blue="\e[0;94m"
expand_bg="\e[K"
blue_bg="\e[0;104m${expand_bg}"
red_bg="\e[0;101m${expand_bg}"
green_bg="\e[0;102m${expand_bg}"
green="\e[0;92m"
white="\e[0;97m"
bold="\e[1m"
uline="\e[4m"
clear="\e[0m"

clear

printf "
${red}

███╗░░░███╗██████╗░███╗░░░███╗
████╗░████║██╔══██╗████╗░████║
██╔████╔██║██║░░██║██╔████╔██║
██║╚██╔╝██║██║░░██║██║╚██╔╝██║
██║░╚═╝░██║██████╔╝██║░╚═╝░██║
╚═╝░░░░░╚═╝╚═════╝░╚═╝░░░░░╚═╝
${clear} "
echo ""
echo ""
sleep 0.2s
printf "${bold}// A TOOLBOX FOR WEB APPLICATION PENTESTER${clear}"
echo ""
echo ""
echo ""
sleep 0.2s
printf "${bold}${blue}SUBDOMAIN ENUMERATION (1)${clear}"
echo ""
sleep 0.2s
printf "${bold}${blue}SUBDOMAIN ENUMERATION {PARALLEL} (2)${clear}"
echo ""
sleep 0.2s
printf "${bold}${blue}DIRECTORY FUZZING (3)${clear}"
echo ""
sleep 0.2s
printf "${bold}${blue}WAF DETECTION (4)${clear}"
echo ""
sleep 0.2s
printf "${bold}${blue}WEB CRAWLING (5)${clear}"
echo ""
sleep 0.2s
printf "${bold}${blue}TECHNOLOGY DETECTION (6)${clear}"
echo ""
sleep 0.2s
printf "${bold}${blue}MDM MAILER (7)${clear}"
echo ""
echo ""
echo ""
echo ""
sleep 0.2s
 #user-input
read -p "YOUR DOMAIN (WITHOUT HTTPS://):" domain
read -p "YOUR CHOICE:" sel
clear
 #subdomain enumeration
if [ $sel -eq 1 ];then
 echo ""
 printf "${bold}SUBDOMAIN ENUMERATION${clear}"
 echo ""
 printf "${red}${bold}subfinder${clear} >> amass >> sudomy >> findomain >> assetfinder >> gau >> amass-bruteforce "
 echo ""
 echo ""
  #subfinder(go/apt/go package)
 subfinder -d $domain -o ./tools-opt/subfinder/subfinder-output.txt
 clear
 echo ""
  #finalrecon(python/apt/github package)
 #finalrecon  --sub https://$domain  -o ./tools-opt/finalrecon/finalrecon-output.txt
  #amass(go/apt/go/go package)
 echo ""
 printf "${bold}SUBDOMAIN ENUMERATION${clear}"
 echo ""
 printf "subfinder >> ${red}${bold}amass${clear} >> sudomy >> findomain >> assetfinder >> gau >> amass-bruteforce "
 echo ""
 echo ""
 amass enum -d $domain -o ./tools-opt/amass/amass-output.txt
 clear
  #sudomy(shellscript/github package)
 echo ""
 printf "${bold}SUBDOMAIN ENUMERATION${clear}"
 echo ""
 printf "subfinder >> amass >> ${red}${bold}sudomy${clear} >> findomain >> assetfinder >> gau >> amass-bruteforce "
 echo ""
 cd  ./tools/Sudomy
 ./sudomy -d $domain -o ./sudomy-opt
 cd sudomy-opt/Sudomy-Output/$domain
 cp subdomain.txt ../../../../../tools-opt/sudomy/sudomy-output.txt
 cd ../../../../../
 clear
  #findomain(rust/github package)
 echo ""
 printf "${bold}SUBDOMAIN ENUMERATION${clear}"
 echo ""
 printf "subfinder >> amass >> sudomy >> ${red}${bold}findomain${clear} >> assetfinder >> gau >> amass-bruteforce "
 echo ""
 findomain -t $domain -u ././tools-opt/findomain/findomain-output.txt
 sleep 10s
 clear
  #assetfinder
 echo ""
 printf "${bold}SUBDOMAIN ENUMERATION${clear}"
 echo ""
 printf "subfinder >> amass >> sudomy >> findomain >> ${red}${bold}assetfinder${clear} >> gau >> amass-bruteforce "
 echo ""
 assetfinder -subs-only $domain  >> ./tools-opt/assetfinder/assetfinder-output.txt
 cat ./tools-opt/assetfinder/assetfinder-output.txt
 sleep 10s
 clear
  #gau (go/go package)
 printf "${bold}SUBDOMAIN ENUMERATION${clear}"
 echo ""
 printf "subfinder >> amass >> sudomy >> findomain >> assetfinder >> ${red}${bold}gau${clear} >> amass-bruteforce "
 echo ""
 echo "PLEASE WAITE"
 echo "$domain" | gau --subs >> 1.txt
 mv 1.txt ./tools-opt/gau
 cd ./tools-opt/gau
 cat 1.txt | cut -d "/" -f 3 >> 2.txt
 sort 2.txt | uniq > gau-output.txt
 cat gau-output.txt
 sleep 10s
 rm -f 1.txt
 rm -f 2.txt
 cd ../../
 clear
  #amass-bruteforce(go/apt/go package)
 echo ""
 clear
 printf "${bold}SUBDOMAIN ENUMERATION${clear}"
 echo ""
 printf "subfinder >> amass >> sudomy >> findomain >> assetfinder >> gau >> ${red}${bold}amass-bruteforce${clear} "
 echo ""
 echo ""
 read -p "IF YOU WNAT CONTINUE PRESS 1 OR 0 :" var
 clear
 if [ $var -eq 1 ]; then
  read -p "ENTER YOUR WORDLIST  :/" wordlistdomain
  echo ""
  echo "NOTE: IT TAKES AT LEAST 15MIN"
  echo ""
  echo "BE PATIENT!"
  echo ""
  amass enum -brute -w ./$wordlistdomain -d $domain -o ./tools-opt/amass-bruteforce/amass-bruteforce-output.txt
 fi
 cd output
 mkdir $domain
 cd $domain
 mkdir subdomain
 cd subdomain
 mkdir tools-outputs
 cd ..
 cd ../../
  #copy textfiles to /integration/concatenate/subdomain
 cp ./tools-opt/amass/amass-output.txt ./integration/concatenate/subdomain/amass.txt
 cp ./tools-opt/subfinder/subfinder-output.txt ./integration/concatenate/subdomain/subfinder.txt
 cp ./tools-opt/findomain/findomain-output.txt ./integration/concatenate/subdomain/findomain.txt
 cp ./tools-opt/sudomy/sudomy-output.txt ./integration/concatenate/subdomain/sudomy.txt
 cp ./tools-opt/amass-bruteforce/amass-bruteforce-output.txt ./integration/concatenate/subdomain/amass-bruteforce.txt
 cp ./tools-opt/assetfinder/assetfinder-output.txt ./integration/concatenate/subdomain/assetfinder.txt
 cp ./tools-opt/gau/gau-output.txt ./integration/concatenate/subdomain/gau.txt
 cp ./tools-opt/finalrecon/finalrecon-output.txt ./integration/concatenate/subdomain/finalrecon.txt
  #concatenate text files
 cd integration/concatenate/subdomain
 cat amass-bruteforce.txt amass.txt findomain.txt subfinder.txt sudomy.txt assetfinder.txt gau.txt finalrecon.txt  >> all-domain.txt
  #elminate duplicate domain
 sort all-domain.txt | uniq > subdomain.txt
 clear
  #showing result
 echo "RESULT (WITHOUT PROBE)"
 echo ""
 echo "DOMAIN:" ; wc -l < subdomain.txt
 echo ""
 cat subdomain.txt
 echo ""
 printf  "${green_bg}${bold}SAVE IN /MDM/output/domains/$domain/subdomain/subdomain-$domain.txt${clear}"
 cp subdomain.txt ../../../output/$domain/subdomain
 cd ../../../
  #probing
 echo ""
 echo "PROBING"
 echo ""
 /root/go/bin/httpx -o ./output/$domain/subdomain/live.txt -l ./integration/concatenate/subdomain/subdomain.txt
 echo ""
 echo ""
 echo ""
 echo ""
 printf "${green_bg}${bold}SAVE IN /MDM/output/domains/$domain/subdomain/live-$domain.txt${clear}"
 echo ""
 echo "PROBING(STATUS CODE)"
 echo ""
 /root/go/bin/httpx  -o ./output/$domain/subdomain/status.txt -sc -l ./integration/concatenate/subdomain/subdomain.txt
 echo ""
 echo ""
 printf "${green_bg}${bold}SAVE IN /MDM/output/domains/$domain/subdomain/status-$domain.txt${clear}"
 echo ""
 echo "YOU WILL GO BACK IN MAIN MENU"
  #removing text files
 #cp ./tools-opt/finalrecon/finalrecon-output.txt ./output/$domain/subdomain/tools-outputs/finalrecon.txt
 cp ./tools-opt/amass/amass-output.txt ./output/$domain/subdomain/tools-outputs/amass.txt
 cp ./tools-opt/subfinder/subfinder-output.txt ./output/$domain/subdomain/tools-outputs/subfinder.txt
 cp ./tools-opt/assetfinder/assetfinder-output.txt ./output/$domain/subdomain/tools-outputs/assetfinder.txt
 cp ./tools-opt/findomain/findomain-output.txt ./output/$domain/subdomain/tools-outputs/findomain.txt
 cp ./tools-opt/gau/gau-output.txt ./output/$domain/subdomain/tools-outputs/gau.txt
 cp ./tools-opt/amass-bruteforce/amass-bruteforce-output.txt ./output/$domain/subdomain/tools-outputs/amass-bruteforce.txt

 rm -f ./tools-opt/amass/amass-output.txt
 rm -f ./tools-opt/amass-bruteforce/amass-bruteforce-output.txt
 rm -f ./tools-opt/findomain/findomain-output.txt
 rm -f ./tools-opt/subfinder/subfinder-output.txt
 rm -f ./tools-opt/sudomy/sudomy-output.txt
 rm -f ./integration/concatenate/subdomain/all-domain.txt
 rm -f ./integration/concatenate/subdomain/subdomain.txt
 rm -f ./integration/concatenate/subdomain/amass.txt
 rm -f ./integration/concatenate/subdomain/amass-bruteforce.txt
 rm -f ./integration/concatenate/subdomain/findomain.txt
 rm -f ./integration/concatenate/subdomain/subfinder.txt
 rm -f ./integration/concatenate/subdomain/sudomy.txt
 rm -f ./tools-opt/assetfinder/assetfinder-output.txt
 rm -f ./integration/concatenate/subdomain/assetfinder.txt
 rm -f ./integration/concatenate/subdomain/gau.txt
 rm -f ./tools-opt/gau/gau-output.txt
 sleep 45s
 clear
 sh ./MDM.sh
fi
 #subdomian enumeration (parallel)
if [ $sel -eq 2 ];then
  printf "${red}${bold}WARNING!${clear} WILL CAUSE HIGHT CPU TEMPERATURE"
 sleep 5s
  #subfinder(go/apt/go package)
 subfinder -d $domain -o ./tools-opt/subfinder/subfinder-output.txt &
  #amass(go/apt/go package)
 amass enum -d $domain -o ./tools-opt/amass/amass-output.txt &
  #findomain(rust/gihub package)
 #findomain -t $domain -u ./tools-opt/findomain/findomain-output.txt &
  #finalrecon(python/apt/github package)
 #finalrecon  --sub https://$domain  -o ./tools-opt/finalrecon/final.txt
 #cat ./tools-opt/finalrecon/final.txt | sed -n '45,60p'  >> finalrecon-output.txt
  #assetfinder(go/go package)
 assetfinder -subs-only $domain  >> ./tools-opt/assetfinder/assetfinder-output.txt &
  #amass-bruteforce(go/go package)
 amass enum -brute -w ./$wordlistdomain -d $domain -o ./tools-opt/amass-bruteforce/amass-bruteforce-output.txt
  #sudomy(shellscript/package github)
 cd  ./tools/Sudomy
 ./sudomy -d $domain -o ./sudomy-opt &
 cd sudomy-opt/Sudomy-Output/$domain
 cp subdomain.txt ../../../../../tools-opt/sudomy/sudomy-output.txt
 cd ../../../../../
  #gau(go/go package)s
 echo "$domain" | gau --subs >> 1.txt &
 wait
 mv 1.txt ./tools-opt/gau
 cd ./tools-opt/gau
 cat 1.txt | cut -d "/" -f 3 >> 2.txt
 sort 2.txt | uniq > gau-output.txt
 cat gau-output.txt
 sleep 10s
 rm -f 1.txt
 rm -f 2.txt
 cd ../../
 wait
  #puredns(go/go package)
echo ""
read -p "DO YOU WANT TO BRUTEFORCE ? 1[YES] or 0[NO]:" var
if [ $var -eq 1 ]; then
 read -p "enter your wordlist:" word
  #convert to four spice
 puredns bruteforce $word $domain -r ./wordlist/subdomain/resolvers.txt -w puredns.txt
 mv puredns.txt ./integration/concatenate/subdomain/puredns.txt
fi
 #code
  cd output
 mkdir $domain
 cd $domain
 mkdir subdomain
  cd subdomain
  mkdir tools-outputs
  cd ..
 cd ../../
  #copy textfiles to /integration/concatenate/subdomain
 cp ./tools-opt/amass/amass-output.txt ./integration/concatenate/subdomain/amass.txt
 cp ./tools-opt/subfinder/subfinder-output.txt ./integration/concatenate/subdomain/subfinder.txt
 cp ./tools-opt/findomain/findomain-output.txt ./integration/concatenate/subdomain/findomain.txt
 cp ./tools-opt/sudomy/sudomy-output.txt ./integration/concatenate/subdomain/sudomy.txt
 cp ./tools-opt/amass-bruteforce/amass-bruteforce-output.txt ./integration/concatenate/subdomain/amass-bruteforce.txt
 cp ./tools-opt/assetfinder/assetfinder-output.txt ./integration/concatenate/subdomain/assetfinder.txt
 cp ./tools-opt/gau/gau-output.txt ./integration/concatenate/subdomain/gau.txt
 cp ./tools-opt/finalrecon/finalrecon-output.txt ./integration/concatenate/subdomain/finalrecon.txt
  #concatenate text files
 cd integration/concatenate/subdomain
 cat amass-bruteforce.txt amass.txt findomain.txt subfinder.txt sudomy.txt assetfinder.txt gau.txt finalrecon.txt puredns.txt >> all-domain.txt
  #elminate duplicate domain
 sort all-domain.txt | uniq > subdomain.txt
 #clear
  #showing result
 echo "RESULT (WITHOUT PROBE)"
 echo ""
 echo "DOMAIN:" ; wc -l < subdomain.txt
 echo ""
 cat subdomain.txt
 echo ""
 printf  "${green_bg}${bold}SAVE IN /MDM/output/domains/$domain/subdomain/subdomain-$domain.txt${clear}"
 cp subdomain.txt ../../../output/$domain/subdomain
 cd ../../../
  #probing
 echo ""
 echo "PROBING"
 echo ""
 httpx -o ./output/$domain/subdomain/live.txt -l ./integration/concatenate/subdomain/subdomain.txt
 echo ""
 echo ""
 echo ""
 echo ""
 printf "${green_bg}${bold}SAVE IN /MDM/output/domains/$domain/subdomain/live-$domain.txt${clear}"
 echo ""
 echo "PROBING(STATUS CODE)"
 echo ""
 httpx  -o ./output/$domain/subdomain/status.txt -sc -l ./integration/concatenate/subdomain/subdomain.txt
 echo ""
 echo ""
 printf "${green_bg}${bold}SAVE IN /MDM/output/domains/$domain/subdomain/status-$domain.txt${clear}"
 echo ""
 echo "YOU WILL GO BACK IN MAIN MENU"
  #removing text files
 #cp ./tools-opt/finalrecon/finalrecon-output.txt ./output/$domain/subdomain/tools-outputs/finalrecon.txt
 cp ./tools-opt/amass/amass-output.txt ./output/$domain/subdomain/tools-outputs/amass.txt
 cp ./tools-opt/subfinder/subfinder-output.txt ./output/$domain/subdomain/tools-outputs/subfinder.txt
 cp ./tools-opt/assetfinder/assetfinder-output.txt ./output/$domain/subdomain/tools-outputs/assetfinder.txt
 cp ./tools-opt/findomain/findomain-output.txt ./output/$domain/subdomain/tools-outputs/findomain.txt
 cp ./tools-opt/gau/gau-output.txt ./output/$domain/subdomain/tools-outputs/gau.txt
 cp ./tools-opt/amass-bruteforce/amass-bruteforce-output.txt ./output/$domain/subdomain/tools-outputs/amass-bruteforce.txt
 mv ./integration/concatenate/subdomain/puredns.txt ./output/$domain/subdomain/tools-outputs/puredns.txt
 mv ./integration/concatenate/subdomain/sudomy.txt ./output/$domain/subdomain/tools-outputs/sudomy.txt

 rm -f ./tools-opt/amass/amass-output.txt
 rm -f ./tools-opt/amass-bruteforce/amass-bruteforce-output.txt
 rm -f ./tools-opt/findomain/findomain-output.txt
 rm -f ./tools-opt/subfinder/subfinder-output.txt
 rm -f ./tools-opt/sudomy/sudomy-output.txt
 rm -f ./integration/concatenate/subdomain/all-domain.txt
 rm -f ./integration/concatenate/subdomain/subdomain.txt
 rm -f ./integration/concatenate/subdomain/amass.txt
 rm -f ./integration/concatenate/subdomain/amass-bruteforce.txt
 rm -f ./integration/concatenate/subdomain/findomain.txt
 rm -f ./integration/concatenate/subdomain/subfinder.txt
 rm -f ./integration/concatenate/subdomain/sudomy.txt
 rm -f ./tools-opt/assetfinder/assetfinder-output.txt
 rm -f ./integration/concatenate/subdomain/assetfinder.txt
 rm -f ./integration/concatenate/subdomain/gau.txt
 rm -f ./tools-opt/gau/gau-output.txt
 #sleep 45s
 #clear
 #sh ./MDM.sh
fi

 #directory fuzzing
if [ $sel -eq 3 ];then
  if [ -e ./output/$domain/subdomain/live.txt ];then

 file="./output/$domain/subdomain/live.txt"

 #cd output
 #cd $domain
 #mkdir directory
 #cd directory

 #code

echo ""
printf "${blue}SUBDOMAINS FOR OUR DOMAIN :${clear}"
echo ""
cat ./output/$domain/subdomain/live.txt
echo ""
printf "${green}WHICH SUBDOMAIN YOU WANT TO FUZZ (with https:// or http:// ) :${clear}"
read url
printf "${blue}[***] is your site based on wordpress or not?\n${clear}"
printf "${green}[+] for wordpress press [1]: (if not press [2]) ${clear} " 
read wordpress_confirm
sleep 1s
clear
printf "${blue}[***] Do you like to add your own dictionary?\n${clear}"
printf "${green}[+] yes? [1]: No?[2] ${clear}" 
read dict_confirm
printf "${blue}[***] if not then just ENTER \n${clear}"
printf "${green}[+] Enter the Dictionary: ${clear}"
read dict
sleep 1s
clear
printf "${green}[+] Enter user agents: ${clear}" 
read user_agents
sleep 1s
clear
printf "${green}[+] for setting cookie press [1]: (if not press [2]:) ${clear}"
read cookie_confirm
printf "${green}[+] Enter your cookie session : ${clear}"
read cookie
clear
mkdir dir_output

if [ $cookie_confirm -eq 1 ];then

	if [ $dict_confirm -eq 1 ];then
        	gobuster dir -u $url -w $dict -c "$cookie" -s "204,302,307,401,403" -b "" -a "$user_agents" -o 5.txt&
               	cat 5.txt | grep -Eo "http://.*|https://.*" | cut -d "/" -f 4 > 6.txt
           	dirb $url $dict -r -c "$cookie" -N 404 -a "$user_agents" -w -z 200 > dirb3.txt&
                cat dirb3.txt | grep -Eo "DIRECTORY: https://.*|DIRECTORY: http://.*" | cut -d "/" -f 4 > dirb4.txt
               	ffuf -u $url/FUZZ -w $dict -b "$cookie" -e .php,.html,.txt > 7.txt&
                cat 7.txt  | cut -d "[" -f2 |cut -b 3-100 > 8.txt
               	gau $url --o gau_res.txt&
		if [ $wordpress_confirm -eq 1 ];then
                	wpscan --url $url --enumerate t --cookie-string $cookie --random-user-agent > wpscan.txt&
                        cat wpscan.txt | grep -Eo "https://.*|http://.*" | cut -d "/" -f 4,5,6 > wpscan2.txt
                fi
                cat 6.txt 8.txt dirb4.txt gau_res.txt wpscan2.txt > result.txt
                cp 6.txt 8.txt dirb4.txt gau_res.txt wpscan2.txt /dir_output
		cp result.txt /dir_output
		rm 6.txt 8.txt dirb4.txt gau_res.txt wpscan2.txt
		wait
	elif [ ! $dict_confirm -eq 1 ];then
           	gobuster dir -u $url -w /usr/share/dirbuster/wordlists/directory-list-lowercase-2.3-medium.txt  -c "$cookie" -s "204,301,302,307,401,403" -b "" -o 5.txt&
                cat 5.txt | grep -Eo "http://.*|https://.*" | cut -d "/" -f 4 > 6.txt
                ffuf -u $url/FUZZ -w /usr/share/seclists/Discovery/Web-Content/raft-medium-words-lowercase.txt  -b "$cookie" -e .php,.html,.txt > 7.txt
                cat 7.txt  | cut -d "[" -f2 |cut -b 3-100 > 8.txt
               	dirb $url /usr/share/seclists/Discovery/Web-Content/raft-medium-words-lowercase.txt -a "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36" -c "$cookie" -a "$user_agents" -w -z 200 > dirb3.txt
                cat dirb3.txt | grep -Eo "DIRECTORY: https://.*|DIRECTORY: http://.*" | cut -d "/" -f 4 > dirb4.txt
                gau $url --o gau_res.txt
		if [ $wordpress_confirm -eq 1 ];then
                	wpscan --url $url --enumerate t --cookie-string $cookie --random-user-agent > wpscan.txt
                        cat wpscan.txt | grep -Eo "https://.*|http://.*" | cut -d "/" -f 4,5,6 > wpscan2.txt
		fi
                cat 6.txt 8.txt dirb4.txt gau_res.txt wpscan2.txt > result.txt
		cp 6.txt 8.txt dirb4.txt gau_res.txt wpscan2.txt /dir_output
		cp result.txt /dir_output
                rm 6.txt 8.txt dirb4.txt gau_res.txt wpscan2.txt
	fi

elif [ ! $cookie_confirm -eq 1 ];then
        if [ $dict_confirm -eq 1 ];then
		gobuster dir -u $url -w $dict -s "204,302,307,401,403" -b "" -o 5.txt&
                cat 5.txt | grep -Eo "http://.*|https://.*" | cut -d "/" -f 4 > 6.txt
                echo "finished gobuster for $url"
                dirb $url $dict -N 404 -w -z 200 > dirb3.txt&
                cat dirb3.txt | grep -Eo "DIRECTORY: https://.*|DIRECTORY: http://.*" | cut -d "/" -f 4 > dirb4.txt
                echo "finished dirb for $url "
                ffuf -u $url/FUZZ -w $dict -e .php,.html,.txt > 7.txt&
                cat 7.txt  | cut -d "[" -f2 |cut -b 3-100 > 8.txt
               	echo "finished ffuf for $url"
                gau $url --o gau_res.txt&
                echo "finished gau for $url"
                if [ $wordpress_confirm -eq 1 ];then
                	wpscan --url $url --enumerate t --random-user-agent > wpscan.txt
                        cat wpscan.txt | grep -Eo "https://.*|http://.*" | cut -d "/" -f 4,5,6 > wpscan2.txt
                        echo "finished wpscan for $url"
                fi
                cat 6.txt 8.txt dirb4.txt gau_res.txt wpscan2.txt > result.txt
                cp 6.txt 8.txt dirb4.txt gau_res.txt wpscan2.txt /dir_output
                cp result.txt /dir_output
		rm 6.txt 8.txt dirb4.txt gau_res.txt wpscan2.txt
		wait
	elif [ ! $dict_confirm -eq 1 ]
        then
       		gobuster dir -u $url -w /usr/share/dirbuster/wordlists/directory-list-lowercase-2.3-medium.txt -s "204,301,302,307,401,403" -b "" -o 5.txt&
               	cat 5.txt | grep -Eo "http://.*|https://.*" | cut -d "/" -f 4 > 6.txt
              	ffuf -u $url/FUZZ -w /usr/share/seclists/Discovery/Web-Content/raft-medium-words-lowercase.txt -e .php,.html,.txt > 7.txt&
                cat 7.txt  | cut -d "[" -f2 |cut -b 3-100 > 8.txt
                dirb $url /usr/share/seclists/Discovery/Web-Content/raft-medium-words-lowercase.txt -r -a "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36" -w -z 200 > dirb3.txt&
               	cat dirb3.txt | grep -Eo "DIRECTORY: https://.*|DIRECTORY: http://.*" | cut -d "/" -f 4 > dirb4.txt
               	gau $url --o gau_res.txt&
                if [ $wordpress_confirm -eq 1 ]
                then
                	wpscan --url $url --enumerate t --random-user-agent > wpscan.txt&
                        cat wpscan.txt | grep -Eo "https://.*|http://.*" | cut -d "/" -f 4,5,6 > wpscan2.txt
                fi
               	cat 6.txt 8.txt dirb4.txt gau_res.txt wpscan2.txt > result.txt
		cp 6.txt 8.txt dirb4.txt gau_res.txt wpscan2.txt /dir_output
                cp result.txt /dir_output
		rm 6.txt 8.txt dirb4.txt gau_res.txt wpscan2.txt
	fi
fi

  else
  printf "${red}${bold}YOUR SUBDOMAIN IS NOT EXIST${clear}"
  echo ""
  echo ""
  printf "${bold}YOU SHOULD FIRST RUN SUBDOMAIN ENUMERATION${clear}"
  sleep 7s
  sh MDM.shfi
fi
fi

 #waf detection
if [ $sel -eq 4 ];then
 printf "${bold}WAF DETECTION${clear}"
 wafw00f https://$domain
 echo ""
 echo "YOU WILL GO BACK IN MAIN MENU"
 sleep 20s
 clear
 sh ./MDM.sh
fi

 #web crawling
if [ $sel -eq 5 ];then
 echo "WEB CRAWLER"
 echo ""
 cd output
 mkdir $domain
 cd $domain
 mkdir crawler
 cd crawler
 katana -u  https://$domain -o crawl.txt
 echo ""
 printf "${green_bg}${bold}SAVE IN /MDM/output/$domain/crawler/crawl.txt${clear}"
 sleep 10s
 clear
 cd ../../../
 sh ./MDM.sh
fi

 #technology detection
if [ $sel -eq 6 ];then

 #cd output
 #mkdir $domain
 #cd $domain
 #mkdir technology
 #cd technology
 #echo ""
 #echo "wappy"
 #echo ""
 wappy -u $domain
 echo ""
 echo "webtech"
 echo ""
 webtech -u https://$domain
echo "whatweb"
 echo ""
whatweb -v $domain

#cat wappy.txt webtech.txt whatweb.txt >> tech.txt
#pwd
#printf "${green_bg}${bold}SAVE IN /MDM/output/$domain/technology/tech.txt${clear}"
#sleep 30s
#clear
#cd ../../../
#sh ./MDM.sh

fi

if [ $sel -eq 7 ];then
 printf "${blue}
███╗░░░███╗██████╗░███╗░░░███╗  ███╗░░░███╗░█████╗░██╗██╗░░░░░███████╗██████╗░
████╗░████║██╔══██╗████╗░████║  ████╗░████║██╔══██╗██║██║░░░░░██╔════╝██╔══██╗
██╔████╔██║██║░░██║██╔████╔██║  ██╔████╔██║███████║██║██║░░░░░█████╗░░██████╔╝
██║╚██╔╝██║██║░░██║██║╚██╔╝██║  ██║╚██╔╝██║██╔══██║██║██║░░░░░██╔══╝░░██╔══██╗
██║░╚═╝░██║██████╔╝██║░╚═╝░██║  ██║░╚═╝░██║██║░░██║██║███████╗███████╗██║░░██║
╚═╝░░░░░╚═╝╚═════╝░╚═╝░░░░░╚═╝  ╚═╝░░░░░╚═╝╚═╝░░╚═╝╚═╝╚══════╝╚══════╝╚═╝░░╚═
${clear}
"
 echo "EMAILING SUBDOMAIN ENUMERATION RESULTS (1)"

 echo "EMAILING DIRECTORY FUZZING RESULTS (2)"

 echo "EMAILING TECHNOLOGY RESULTS (3)"
 echo ""
 read -p "ENTER YOUR EMAIL :" email
 read -p "YOUR CHOICE :" choice

 #EMAILING SUBDOMAIN ENUMERATION RESULTS
 if [ $choice -eq 1 ];then
  if [ -e ./output/$domain/subdomain/live.txt ];then
   cd ./output/$domain/subdomain
   ssmtp  -v $email < subdomain.txt
   printf "${green}RESULT HAS BEEN SUCCESFULY SENT TO YOUR EMAIL${clear}"
   sleep 4
   sh MDM.sh
  else
   printf "${red}YOUR RESULT NOT FOUND${clear}"
   sleep 4s
   sh MDM.sh
  fi
 fi

 #EMAILING DIRECTORY FUZZING RESULTS
 if [ $choice -eq 2 ];then
  echo "UNDER THE CONSTRACTION :)"
  sleep 4
  sh MDM.sh
 fi

 #EMAILING TECHNOLOGY RESULTS
 if [ $choice -eq 3 ];then
  if [ -e ./output/$domain/technology/tech.txt ];then
   cd ./output/$domain/technology
   ssmtp -v $email < tech.txt
   clear
   printf "${green}RESULT HAS BEEN SUCCESFULY SENT TO YOUR EMAIL${clear}"
   sleep 4
   sh MDM.sh
  else
   printf "${red}YOUR RESULT NOT FOUND${clear}"
   sleep 4s
   sh MDM.sh
  fi
 fi

fi
