#!/bin/bash

declare -i i=0

declare -i end=`curl -X "GET" "https://api.spotify.com/v1/playlists/038AujGG7ZbzEZAKtdGhoN/tracks?limit=1" -H "Accept: application/json" -H "Content-Type: application/json" -H "Authorization: Bearer <key> "| jq -r '.total'`

rm spoticheck.out

#TODO should this be -le? It might be but I don't want to type like a redditor
#TODO parse this json in a smarter way
while [ $i -lt $end ]
do
curl -X "GET" "https://api.spotify.com/v1/playlists/038AujGG7ZbzEZAKtdGhoN/tracks?offset=$i&fields=items(track(name))%2Citems(track(album(artists(name))))" -H "Accept: application/json" -H "Content-Type: application/json" -H "Authorization: Bearer <key>" |jq | grep '^        "name":' | cut -c 17- >> spoticheck.out 
        i+=100
done

mv newlist.txt oldlist.txt

cat spoticheck.out | sort > newlist.txt
comm -23 oldlist.txt newlist.txt  > missingsongs

while read p; do echo $p has been removed; done <missingsongs
