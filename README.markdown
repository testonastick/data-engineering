# solve the tab delimited file problem

## prerequisites (mac)
* install [homebrew](http://brew.sh/) 
* set up homebrew to install regular mac dmg files [per vagrant casked
  instructions](http://jasoncosper.com/vagrant-casked/): 
  `brew tap phinze/homebrew-cask && brew install brew-cask`
* install vagrant via homebrew
  `brew cask install vagrant`
* install virtualbox via homebrew
  `brew cask install virtualbox`

## get set up
1. clone this repo
1. `git submodule init`
1. `git submodule update`
1. `vagrant up`
1. `vagrant ssh`
1. `cd my-app`
1. `bundle install`
1. `rake db:create`
1. `rake db:migrate`

## run the app
1. after the above setup, ssh to the guest box
   `vagrant ssh`
1. `cd my-app`
1. `rails s`
1. from the host box, point your browser at:
   [http://localhost:3000/orders/upload](http://localhost:3000/orders/upload)
1. upload a tsv file from the root of the project directory

## run the tests
1. after the above setup, ssh to the guest box
1. `cd my-app`
1. `RAILS_ENV=test rake db:create`
1. `RAILS_ENV=test rake db:migrate`
1. `bundle exec rspec spec/`

## Acknowledgements 
* [vagrant casked](http://jasoncosper.com/vagrant-casked/)
* [rails dev box](https://github.com/rails/rails-dev-box) 

## Intentions
I focused mostly on making the environment easy to spin up. By borrowing the
puppet setup for the [rails dev box](https://github.com/rails/rails-dev-box),
I was able to keep you from having to install my DB on your machine. This is
similar to how I dev rails as well. I did not focus on interface design. 

## Testing
I did some input/output testing in specs. I avoided mocking in many cases
as I didn't need to save any time on db access. I didn't bother with cucumber.
Unless I have a person who will provide the gherkin, I don't get as much
value from cukes as I do rspecs. 

I did test the functionality uploading a massive file:
big_example_input_with_decimals.tab did complete while running on my machine
but took about 10 minutes to do so. 

## What Else Should be Done
* visual design
* navigation
* much more security testing/probing
* better input checking [little bobby tables](http://xkcd.com/327/)
* either performance tuning to handle larger files or file size checking with
  limits
* better tsv parsing, this is pretty optimistic.

# Challenge for Software Engineer - Big Data 
To better assess a candidates development skills, we would like to provide the following challenge.  You have as much time as you'd like (though we ask that you not spend more than a few hours).

There are three jobs that both use this challenge:

1. Senior Software Engineer: If you are applying to this position, the email address you should use for submission is [dev.challenges@livingsocial.com](dev.challenges@livingsocial.com).  You must use either Ruby/Ruby on Rails or Scala/Play2.0.
1. Senior Software Engineer, Big Data (and/or Data Scientist): If you are applying to this position, the email address you should use for submission is [data.challenge@livingsocial.com](mailto:data.challenge@livingsocial.com).  You may use any programming language or framework you'd like.

Feel free to email the appropriate address above if you have any questions.

## Submission Instructions
1. First, fork this project on github.  You will need to create an account if you don't already have one.
1. Next, complete the project as described below within your fork.
1. Finally, push all of your changes to your fork on github and submit a pull request.  You should also email the appropriate address listed in the first section and your recruiter to let them know you have submitted a solution.  Make sure to include your github username in your email (so we can match people with pull requests).

## Alternate Submission Instructions (if you don't want to publicize completing the challenge)
1. Clone the repository
1. Next, complete your project as described below within your local repository
1. Email a patch file to the appropriate address listed above ([data.challenge@livingsocial.com](mailto:data.challenge@livingsocial.com) if you are applying for the Big Data position, [dev.challenges@livingsocial.com](dev.challenges@livingsocial.com) if you are applying for the general Senior Software Engineer or Associate Developer position).

## Project Description
Imagine that LivingSocial has just acquired a new company.  Unfortunately, the company has never stored their data in a database and instead uses a plain text file.  We need to create a way for the new subsidiary to import their data into a database.  Your task is to create a web interface that accepts file uploads, normalizes the data, and then stores it in a relational database.

Here's what your web-based application must do:

1. Your app must accept (via a form) a tab delimited file with the following columns: purchaser name, item description, item price, purchase count, merchant address, and merchant name.  You can assume the columns will always be in that order, that there will always be data in each column, and that there will always be a header line.  An example input file named example_input.tab is included in this repo.
1. Your app must parse the given file, normalize the data, and store the information in a relational database.
1. After upload, your application should display the total amount gross revenue represented by the uploaded file.

Your application does not need to:

1. handle authentication or authorization (bonus points if it does, extra bonus points if authentication is via OpenID)
1. be written with any particular language or framework
1. be aesthetically pleasing

Your application should be easy to set up and should run on either Linux or Mac OS X.  It should not require any for-pay software.

## Evaluation
Evaluation of your submission will be based on the following criteria. Additionally, reviewers will attempt to assess your familiarity with standard libraries. If your code submission is in Ruby, reviewers will attempt to assess your experience with object-oriented programming based on how you've structured your submission.

1. Did your application fulfill the basic requirements?
1. Did you document the method for setting up and running your application?
1. Did you follow the instructions for submission?
