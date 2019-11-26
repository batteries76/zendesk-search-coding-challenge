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

This project is (quite wonderfully) open ended. There are many ways to structure it, and some of the choices relate to how far that you think you might get, and others you can leave out there in hope. Yes, keeping it extensible is ideal, but then there will always be some tricky aspects (at least for my brain) where you must find the path of least resistance in the time. I'm not sure I made the right calls, and there are some elements that I feel are very unsatisfying. But I also stand by certain choices.

I am making the assumption that the person reading this will fairly readily understand the structure of this project, and can see the decisions that I made on a apex level (although may be baffled by some decisions), and so I'm not going to expound extensively in this area:
- The run.rb runs it
- main.rb is the controller
- The Display class handles IO
- The Loader loads,
- And the Searcher searches.
Maybe not the best choices, but hopefully not crazy.

What follows is not a user manual for a random bystander, but more a discussion to the makers of this to give an indication of why I made the choices that I made here. (As in, I'm not expecting a random GitHub user to try to understand this repository.)

Some areas of choice, limitation, and difficulty:
- Different display options: 
    initally I thought I would find a more basic main menu structure, and then have a more interesting set of options in the sub menus. Then I realised that I was unlikely to be able to cope with the full scale of the demands that would require. In the end I came back to the format that was suggested by the docs (slightly embarrassingly), and now that I didn't crack that nut, I wonder whether finding a flasher set of IO gems might not have been a better use of the time. The menu is the nexus of the interaction. Mine works well in the end, but would it work well with added features. I feel ambivalent about the choices I made. There is much to discuss here, and one big element would revolve around the most likely use cases for this app.
- Different ways to hold the data:
    Again, I kept this fairly simple: brought in the data at the outset, and then sort through things from there. I had some small ambitions to try to only have this happen if the user asked to search the data, but in the end that caused more potential issues, when in (this) reality this data is static. I toyed with having it sit in it's own module, but then this wasn't ideal. Files and terminal apps, aren't the standard case (although still very interesting), and I thought of playing around with serving the data (then had a reality check). In the case where the data could change, of course I would only want to access the latest version, and then loading the data when that is pertinent would be best. Instead it looked ridiculous to reload the same data every time the search loop was reinitiated, and so it ended up getting drawn in at the start.
- Different places to extract the data:
    This data is linked, but I'm not always clear how. In the end, the only link I made was the suggested one. Clearly things get extremely complicated bringing in related data when the inital search brings in several entries. Some of this comes down to the user and the pertinence of various use cases. Who is accessing this? Why? What do they understand about what they are seeing? What will best help them to find what they need, and how often will that lead to another search? I'm not clever enough to understand the best way to present the data, and the related data (and the related data), without a better sense of some amount of prioritising, or some sense of the most well worn paths through the system. 
- I am assuming that the fields are the same, even if the data does not exist:
    This is a standard assumption, and I hope doesn't need too much discussion. I'm assumning the data is good data. I wouldn't always do that. 
- 'domain_names' and 'tags':
    Inititally I was trying to find the best approach here, so that it might be the most extensible algorithm (`if kind_of(Array)`, for example, which could lead to (perhaps) some recursive deeper search options). But then it struck me that time is finite (at least for this test), and that also I don't know the possible potential structures that could be used, and for now perhaps it's worth singling these elements out. For one thing, it might be better to treat these as special, as in the future this could be more valuable, because I don't know why people are going to use these search fields. If you want depth, fine, make it general. But if different search fields require different responses, then there will be more idiosyncratic code required to cater for the various circumstances.
- 'created_at', etc, and dates and search:
    Dates. I started down this road, and then backed off. A greater coder would have perhaps solved this. I had enough trouble with the two levels of the menu, and working out how best to present the options so that the user would not be overwhelmed (as well as the results!), without needing to add another level. It's not parsing dates that is the issue, but the user being left to enter it, or me left to advise the user. I worked up a couple of options, and abandoned them. The best option I came up with was a search field that would give all the tickets before a certain year. Struck me as useful, and not too hard to code. I didn't include it.
- Trying to make code dry trade-offs:
    Happened across the range, as you'd expect. 
- Downcase and upcase issues (and other user input issues):
    Upcases, downcases, underscores, oh my. Rhubarb aside, obviously there are heaps of choices to make here. Time was against me, but it's more than that. The fields are less problematic, because you get to see them (if you press the right buttons). And sure, you could make that more forgiving, but there could be so much that goes wrong there. And with anything in the values too. Maybe it's a cop-out, but once you casually start returning both upcase and downcase results, and then have tasty regex to pull both from strings you might have plenty more different problems. I think I would like to have a suggestion system for the fields, and then a tiered system for the results (these are the pure, these are the close, etc). But it goes back to the problem earlier, where there needs to be more context to the searches and to the totality. 
- Yes, I have Rubocop, but I also have some preferences around certain things. Letting some code breathe, and other times keeping it compact:
    I totally understand why there are standards and Rubocop and all these things. This is a failing on my part, and the result of coding alone and teaching too long. It's not perfect code by any means, and perhaps even less lovely Rubocop code. I am happy to learn the systems, and I don't deny certain things make things easier. I do actually think carefully about why I leave a line here or there, or why I leave brackets in (teacher's issue, largely). I do like explicit, readable code, and tend to overwrite rather than underwrite. I also do love Ruby, but I love many languages, and started with C. Brackets don't scare me, and at times I prefer them. I digress. 
- I have some knowledge, and some guesses about the data and links between the three sets, but taking it further could be a fool's errand:
    This is two-fold. At this point the only related data I provide occurs when the user search for an organisation id. This is because 1. I simply don't have the intelligence to nail the generalised structure for something more involved, and 2, as discussed, providing extra data on everything every time is more confusing for the user. Furthermore, I am only providing the ids. Lame? Well, they are already using a search system - they can use those. And also, I'm not giving a heap of confusing results. Or is this a mistake? I hope not


## Extensions
- Dates
- Different conections
- User input massaging
