FROM ubuntu
MAINTAINER Damian Turco

ADD ./menu.sh ./menu.sh 
ADD ./blankLinesCounter.sh ./blankLinesCounter.sh 
ADD ./findNames.sh ./findNames.sh 
ADD ./statsSentences.sh ./statsSentences.sh 
ADD ./statsUsageWords.sh ./statsUsageWords.sh 
ADD ./StatsWords.sh ./StatsWords.sh
ADD ./Texto.txt ./Texto.txt
ADD ./Su_texto.txt ./Su_texto.txt
ENTRYPOINT ["bash","./menu.sh"]

