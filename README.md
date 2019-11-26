## To run
Use your ruby manager to change to 2.5.0
if it is rbenv:
> rbenv install 2.5.0

> rbenv local 2.5.0

Then install the gem dependencies
> bundle install

To run the search program
> ruby lib/run.rb

## TBDs
1. Add in org related tests

## Assumptions, limitations, and extentions

This project is (quite wonderfully) open ended. There are many ways to structure it, and some of the choices relate to how far that you think you might get, and others you can leave out there in hope. Yes, keeping it extensible is ideal, but then there will always be some tricky aspects (at least for my brain) where you must find the path of least resistance in the time. I'm not sure I made the right calls, and there are some elements that I feel are very unsatisfying. 

Some areas of choice, and difficulty:
- Different display options: 
    initally I thought I would find a more basic main menu structure, and then have a more interesting set of options in the sub menus. Then I realised that I was unlikely to be able to cope with the full scale of the demands that would require. In the end I came back to the format that was suggested by the docs (slightly embarrassingly), and now that I didn't crack that nut, I wonder whether finding a flasher set of IO gems might not have been a better use of the time.
- Different ways to hold the data:
    Again, I kept this fairly simple: brought in the data at the outset, and then sort through things from there. I had some small ambitions to try to only have this happen if the user asked to search the data, but in the end that caused more potential issues when in reality this data is static. In the case where the data could change, of course I would only want to access the latest version, and then loading the data when that is pertinent would be best. Instead it looked ridiculous to reload the same data every time the search loop was reinitiated.
- Different places to extract the data:
    
- I am assuming that the fiuelds are the same, even if the data does not exist
- domain names and tags
- created_at etc and dates and search
- trying to make code dry trade-offs
- downcase and upcase issues (and other user input issues)
- checking for booleans
- forgiveness around underscores
- checking in the nested layer for arrays. why not kind of?
- yes, I have Rubocop, but I also have some preferences around certain things. Letting some code breathe, and other times keeping it compact.
- I have some guesses about the data and links between the three sets, but taking it further could be a fool's errand
- Just ticket ids and user ids presented for the results relating to the org id search


## extensions
- dates
- different 