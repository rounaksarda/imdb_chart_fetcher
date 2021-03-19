# imdb_chart_fetcher
Get the JSON response from imdb

This is the assignment question, I was asked for hiring.

The question asked by the company is as:
-----------------------------------------------------------------------------------

Write a command-line script that takes input the chart_url and items_count , where
chart_url is one of IMDb Top Indian Charts:
● Top Rated Indian Movies ( https://www.imdb.com/india/top-rated-indian-movies )
● Top Rated Tamil Movies ( https://www.imdb.com/india/top-rated-tamil-movies )
● Top Rated Telugu Movies ( https://www.imdb.com/india/top-rated-telugu-movies )
The script should output a json string of the top items_count number of movie items (with
attributes as listed below) in that particular IMDb chart.
Following attributes of each movie should be printed:
● title
● movie_release_year
● imdb_rating
● summary
● duration
● genre
Example:
> ./imdb_chart_fetcher 'https://www.imdb.com/india/top-rated-indian-movies' 1
[{"title": "3 Idiots", "movie_release_year": 2009, "imdb_rating": 8.4,
"summary": "Two friends are searching for their long lost companion. They
revisit their college days and recall the memories of their friend who inspired
them to think differently, even as the rest of the world called them
\"idiots\".", "duration": "2h 50min", "genre": "Comedy, Drama"}]

------------------------------------------------------------------------------------

The assignment I submitted can be run like the example.png

-----------------------------------------------------------------------------------

Thanks to the company for asking me this question, while building this small script I learned new concepts as always,

If this script can be used for some good, I will feel happy for the same.
Any suggestions and edits are always welcome.


