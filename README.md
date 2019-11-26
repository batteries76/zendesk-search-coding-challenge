## To run
Use your ruby manager to change to 2.5.0
if it is rbenv:
> rbenv install 2.5.0

> rbenv local 2.5.0

Then install the gems
> bundle install

To run the search program
> ruby lib/run.rb

## TBD
1. Write some tests
2. Fix the date elements
3. Write some tests
4. Other options menus? Fields?

### Specs
Using ruby 2.5.0
Using RSpec 3.8


- different display options
- different ways to hold the data
- different places to extract the data
- I am assuming that the fiuelds are the same, even if the data does not exist
- domain names and tags
- created_at etc and dates and search
- trying to make code dry trade-offs
- downcase and upcase issues (and other user input issues)
- checking for booleans
- forgiveness around underscores
- checking in the nested layer for arrays. why not kind of?
- yes, I have Rubocop, but I also have some preferences around certain things. Letting some code breathe, and other times keeping it compact.

## extensions
- dates
- different 