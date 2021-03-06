# Record Store

## Basic routing practice with Ruby and Sinatra

## By Danielle Thompson

## 7.30.21

### Things I've Learned 😃

- The Ruby `yield` Keyword, Rails `yield`, and `yield_self` - [`Yield`](https://www.rubyguides.com/2019/12/yield-keyword/)
- Moar about Ruby [Blocks, Procs, & Lambdas](https://www.rubyguides.com/2016/02/ruby-procs-and-lambdas/)

### Local Environment

- localhost:4567

### Commands

1. `bundle` compiles the Gemfile.
2. `ruby app.rb` in the CLI will run the program.
3. Exit app with Ctrl + C.
4. `rspec` runs test cases.
5. Debug in Capybara integration testing with `save_and_open_page`. (is similar to binding.pry)

### Known Bugs

- Clear() test does not pass.

### Tasks to Take On

1. Write a method for search.
2. Finish adding tests for all album specs.
3. Add integration tests for each route in the application. (A single test can hit multiple routes - e.g. GET /albums, GET /albums/new, POST /albums.)
4. Add song properties (lyrics, songwriter, etc.)
5. Practice nesting classes inside modules.
6. Add album attributes, & use `attributes` hash.
7. Put any edit and delete forms on the artist or album.erb page, which means wouldn't need to have edit_X.erb pages.

### User Stories to Implement

- As a customer, I want to see a welcome page that includes a list of recent Albums and featured Artists.
- As a customer, I want to click on an Album to see more information about it.
- As a customer, I want to search for an Album by name.
- As a business owner, I want to be able to add, update and delete Albums and Artists.
