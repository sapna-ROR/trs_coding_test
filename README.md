# trs Espresso

Make sure you read **all** of this document carefully, and follow the guidelines
in it. Pay particular attention to the "What We Care About" section. We also
recommend you read
[9 Essential Tips on How to Tackle a Coding Challenge](https://www.codementor.io/learn-programming/9-essential-tips-tackle-coding-challenge).

## Background

We like coffee.

So we built an app to fetch coffee for people from our favourite barista.

The app keeps track of coffee ordered; what the balance is for each user; what users have paid for already; and what is still owed.

## Data

We've got the following data

- `data/prices.json` - provided by our barista. Has details of what beverages are available, and what their prices are.
- `data/orders.json` - list of beverages ordered by users of the app.
- `data/payments.json` - list of payments made by users paying for items they have purchased.

## Requirements

- Load the list of prices
- Load the orders
  - Calculate the total cost of each user's orders
- Load the payments
  - Calculate the total payment for each user
  - Calculate what each user now owes
- Return a JSON string containing the results of this work.

(see `spec/coffee_app_integration_spec.rb` for specific examples)

## Getting Started

Create a directory to work on your project. Copy `trs_coding_task.tar.gz` into your project directory. To extract the project files, run:
```
tar -xzvpf trs_coding_task.tar.gz
```

trs Espresso requires ruby and bundler to be installed. Before you begin; install the dependencies by running `bundle`.
Once the dependencies have been installed you'll have a few commands available:

- `bundle exec rake`  : Will attempt to run your application and print output to the terminal.
- `bundle exec rspec` : Runs the test suite, we've added a few integration tests to get you started, but you'll probably want to add more as you work.

## Submitting The Task

1. Ensure that everything you wish to submit is committed to the `main` branch
1. In your project directory, run: `tar -czvf firstname_lastname.tar.gz .` (where _firstname_ and _lastname_ are your names)
1. Email the generated `.tar.gz` file back to the person that sent you the task.

## What We Care About

First, you should write in Ruby, even if you're not strong in it. We don't mind if your Ruby isn't perfect. If you're *really* not comfortable in Ruby, talk to us, and we'll consider letting you use another language.

We're interested in your method and how you approach the problem just as much as we're interested in the end result. We'll go through your code with you afterwards, and you can talk to us about how you tackled it, why you chose the approach you did, _etcetera_. We don't particularly mind which version of Ruby or Rspec you use or which gems you use to solve the problem.

We haven't hidden any nasty tricks in the task. Don't overthink it. Just write nice, solid code.

Here are the categories we use to grade your submission:

### Modelling
You will need to think about how to split up responsibilities to solve this problem in a way that helps the solution be understandable and extensible. Avoid having a single large class or method which does all the work. Your methods don't need to all be a single line, but small enough to digest easily.

### Naming
Classes, methods and variables should have clear, consistent and descriptive names. Be concise, but if in doubt err on the side of clarity.

### Production Quality - Consistency
Aim to be consistent in your code, formatting and naming. Follow established idioms where possible. While there are no extra points for using a linting tool or following a specific style-guide, you can use one if you find it easier. You will lose points for being inconsistent however. Try re-use code to solve similar problems. Your code should be easy to read and logic easy to follow.

### Production Quality - Clarity
Focus on writing code that is easy to read, understand, and extend. Prefer simple, clear solutions over complicated techniques like metaprogramming. In general, aim for code that does not require comments to understand, and use comments sparingly - but include them where they assist readers of the code.

### Testing - Included tests
The tests that we include in your program should all pass. The rake task output should look correct.

### Testing - Additional tests
You should add unit and integration tests to your submission. You do not need 100% test coverage, please add tests where you think they provide the most value. Your tests do not need to follow any set style but aim to be consistent. Your tests should be readable and easy to modify.

### Data types
Use appropriate data types for your variables and method returns, depending on what they're storing. Pay special attention to what data type you use to store money values.

### Error handling
Add error handling to your submission when dealing with the external JSON data. You shouldn't assume the data is always valid JSON, and if it is, you shouldn't assume it is always structured as expected. Think about what errors could occur, where you would handle them, and how. We are more interested in your thinking around trade offs here than the exact approach.

## Submitting your task back

Please use Git and commit all of your changes (please don't use GitHub or other public hosting)!

Include the `.git` directory in the packaged .tar.gz file you send to us.

## Do not publish our task

It should go without saying that we don't want other candidates to see our
task or previous submissions.
