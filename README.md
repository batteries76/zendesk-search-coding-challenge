## To Get Things Running
Use your ruby manager to change to 2.5.0
If it is rbenv:
`> rbenv install 2.5.0`
and then: 
`> rbenv local 2.5.0`

Then install the gem dependencies
`> bundle install`

To run the search program
`> ruby lib/run.rb`

## Assumptions, Limitations, and Extentions

This project is (quite wonderfully) open ended. There are many ways to structure it, and some of the choices relate to how far that you think you might get, and others you can leave out there in hope. Yes, keeping it extensible is ideal, but then there will always be some tricky aspects where you must find the path of least resistance in the time. I'm not sure I made the right calls, and there are some elements that I feel are very unsatisfying - but I also stand by certain choices (for now).

I am making the assumption that the person reading this will fairly readily understand the structure of this project, and can see (and understand) the decisions that I made on a apex level, and so I'm not going to expound extensively in this area:
- The run.rb runs it.
- The Main class is basically the controller for the project, and pulls from the following classes.
- The Display class handles IO.
- The Loader loads the data.
- And the Searcher searches.

### Discussion
What follows is not a user manual for a random bystander, but more a discussion to the makers of this to give an indication of why I made the choices that I made here. (That is, I'm not expecting a random GitHub user to try to understand this repository.)

Some areas of choice, limitation, and difficulty:
- Different display options: 
    
    Initally I thought I would find a more basic main menu structure, and then have a more interesting set of options in the sub menus. Later I realised that I was unlikely to be able to cope with the full scale of the demands that would require. In the end I came back to the format that was suggested by the docs (slightly embarrassingly). Now that I didn't crack that nut, I wonder whether finding a flasher set of IO gems might not have been a better use of the time. The menu is the nexus of the interaction and I feel ambivalent about the choices I made here. It works well enough for now, but depending on the most common ways of using this search, there could be much improvement to be found.

- Different ways to hold the data:

    Again, I kept this fairly simple: brought in the data at the outset, and then sort through things from there. I had some small ambitions to try to only have this happen if the user asked to search the data, but in the end that caused more potential issues, when in (this) reality the data is static. I toyed with having it sit in its own module, but then this felt overcooked. In any case where the data could change, of course I would only want to access the latest version, and then loading the data when that is pertinent would be best. Instead it looked ridiculous to reload the same data every time the search loop was reinitiated, and so it ended up getting drawn in at the start.

- Different places to extract the data:

    This data is linked (I'm assuming), but it's perhaps not always clear how. In the end, the only link I made was the suggested one regarding organisations. Clearly things get extremely complicated bringing in related data when the inital search brings in several entries. Some of this comes down to the user and the pertinence of various use cases. Who is accessing this? Why? What do they understand about what they are seeing? What will best help them to find what they need, and how often will that lead to another search? I'm not clever enough to understand the best way to present the data, and the related data (and the related data), without a better sense of some amount of prioritising, or some sense of the most well worn paths through the system. For this project I used the specs and some commong sense to keep things moving.

- I am assuming that the fields are the same, even if the data does not exist:

    This is a standard assumption, and I hope doesn't need too much discussion. I'm assumning the data is good data. I wouldn't always do that. 

- 'domain_names' and 'tags':

    Inititally I was trying to find the most generalised approach here, so that it might be the most extensible structure (`if kind_of(Array)`, for example), which could lead to (perhaps) some recursive deeper search options. But then it struck me that time is finite (at least for this test), and that also I don't know the possible potential structures that could be used, and for now perhaps it's worth singling these elements out. In the end I saw more problems going down that route given that the data is what it is currently. 

- 'created_at', etc, and dates and search:

    Dates. I started down this road, and then backed off. A greater coder would have perhaps solved this. I had enough trouble with the two levels of the menu, and working out how best to present the options so that the user would not be overwhelmed (as well as the results!), without adding another level. It's not parsing dates that is the issue, but the user being left to enter it, or me left to advise the user. I worked up a couple of options, and abandoned them. The best option I came up with was a search field that would give all the tickets before a certain year. Struck me as useful, and not too hard to code. I didn't include it.

- Trying to make code dry trade-offs:

    Happened across the range, as you'd expect. There are a few areas that could be tightened if I had infinite time. The last change I made to the printing could be rejigged, and there might be some interesting options in the searching. For now I'm comfortable with the current trade-offs. 

- User input issues:

    There could be several problems with running any `.upcase` or similar over the user data. For the meantime it may be fine, but if there was to be some sort of regex extension (as I would potentially aim for as the next item), then things could get tricky playing around with this stuff (for example, values matching parts of urls). Again, it would come down to some extent to who is using this, and what they understand about the process. 

- Code formatting choices. Letting some code breathe, and other times keeping it compact:

    I think this is an area where I could improve a lot. I am working on it. Having said that, some of the 'inconsistencies' around formatting in my code are choices I have made around trying to have heavy sections be more readable. It won't suit everyone. I am more than happy to be locked down to a company policy on this should that be the situation.

- Testing:

    I have to admit not a strong point for me so far. I am very willing to improve in this area. Display, and other areas are tricky. I have done several unit tests over the course of writing this app. I went down the rabbithole of how best to test the IO, and in the end I settled on testing it myself. I am keen to learn more in this area, and to become a more competent and systematic programmer (including in areas like commits and commit messages, and TDD patterns).


## Extensions
- Dates (including addded menu features)
- Different conections
- User input (forgiving, regex)
- Testing: full end-to-end and IO testing
