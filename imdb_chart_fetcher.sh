#!/usr/bin/env bash


if [[ $# -ne 2 ]]; then
  echo "Too many argumnets: Please only pass one movie or use \"NAME OF MOVIE\" for spaces." >&2
  exit 1
fi
movie_s=$(echo $1 | sed 's/ //g')

ans=$(($2 * 2))
movie=$(curl -s $1 | grep -o '/title/tt[0-9]*/' | head -n $ans)

i=0
if [[ -z $movie ]]; then
    echo -e "Sorry: couldn't find the movie.\nIn case of a typo check:\n"
    echo "$1" | aspell -a
    exit 1
fi

for movie_id in $movie
do
	i=$i+1
	rem=$(( i % 2 ))
if [ $rem -eq 0 ] 
then
	curl -s https://www.imdb.com/"$movie_id"?ref_=fn_al_tt_1 >findMovie.tmp
	if ! [[ -s findMovie.tmp ]]; then
    		echo "Error: couldn't get the movie's page." >&2
    		exit 1
	fi
	movie_title=$(grep '<title>*' findMovie.tmp | sed 's/        <title>//' | sed 's/ - IMDb<\/title>//')
	movie_rating=$(grep -o 'title="[0-9]*.[0-9]* based' findMovie.tmp | sed 's/title="//g' | cut -d' ' -f1)
	##movie_rating_count=$(grep -o 'based on [0-9]*,*[0-9]*,*[0-9]* user' findMovie.tmp | cut -d' ' -f3)
	movie_length=$(grep -o '[0-9]** min</time' findMovie.tmp | cut -d'<' -f1)
	movie_sum=$(grep -A1 'summary_text' findMovie.tmp | tail -n 1 | sed -e 's/^[ \t]*//')
	movie_genre=$(grep 'genres"' findMovie.tmp | head -n 1 | cut -d '?' -f2 | cut -d '=' -f2 | sed 's/&explore//')
	movie_date=$(grep '\/year\/[0-9]*\/' findMovie.tmp | cut --complement -d '/' -f1 | cut --complement -d '/' -f1 | sed 's/\/"//')
	echo -e "{\"title\": \"$movie_title\", \"movie_release_year\": $movie_date, \"imdb_rating\": $movie_rating, \"summary\": \"$movie_sum\", \"duration\": \"$movie_length\", \"genre\": \"$movie_genre\" }"
	rm findMovie.tmp
fi
done
