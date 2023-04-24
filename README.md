# Bitly-take-home

<!-- TABLE OF CONTENTS -->
<h3>
  <details>
    <summary>Table of Contents</summary>
    <ol>
      <li>
        <a href="#challenge-summary">Challenge Summary</a>
        <ul>
          <li><a href="#built-with">Built With</a></li>
          <li><a href="#dependencies">Dependencies</a></li>
          <li><a href="#design-decisions">Design Decisions</a></li>
        </ul>
      </li>
      <li>
        <a href="#getting-started">Getting Started</a>
        <ul>
            <li><a href="#ruby-installation">Ruby Installation</a></li>
            <li><a href="#repository-installation">Repository Installation</a></li>
            <li><a href="#usage">Usage</a></li>
        </ul>
      </li>
      <li><a href="#roadmap">Roadmap</a></li>
    </ol>
  </details>
</h3>

<!-- Challenge Summary -->
## Challenge Summary

![Product Demo](assets/demo.gif)

The goal of this challenge is to create a program that calculates the number of clicks from 2021 for each record in data set provided in the encodes.csv file. The clicks for different years can be found in the decodes.json file provided.

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- Built With -->
### Built With

The language of choice for this challenge is Ruby. 

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- Dependencies -->
### Dependencies

Dependencies in Ruby are known as Gems. Only two dependencies were actually added/installed:

1) RSpec for testing 
2) Pry for debugging

The dependencies are installed/controlled via the Gemfile, which for this program is as follows:
```
source 'https://rubygems.org'

ruby '2.7.4'

gem 'rspec'
gem 'pry'
# gem 'csv'
# gem 'json'
```
The csv and json dependencies are part of ruby 2.7.4 by default. They were included but commented out just in case anything odd happens with the ruby installation and for some reason they end up not being installed correctly; if so, the error messages would be pretty clear about the problem in which case the gems should be uncommented and the repo installation instructions - outlined below - followed normally.

<p align="right">(<a href="#top">back to top</a>)</p>


<!-- Design Decisions -->
### Design Decisions
<details>
<summary> Click to expand/collapse </summary>

1) As the challenge makes use of CSV and JSON files rather than a database or APIs, there was no need to employ a framework within Ruby to do the challenge. This allowed for a simple and light solution using plain Ruby.

2) For the directory set up, the lib folder has two files - each being a class - while the spec folder has their corresponding tests. The data folder has the encodes.csv and decodes.json files.

3) The encodes were made into their own class and while only two of the instance variables defined were utilized, the other two were set up to allow for other possible uses outside of this tech challenge.

4) For counting clicks, a class was set up with methods 2 helper methods (add_csv_encodes and count_clicks_by_year), the primary long link count method (click_count_by_long_link), and a fourth sorting mehod (sorted_count). Besides making the code neater, it allows for other possible sorting methods to be made.

5) The methods were written with both versatility and quality control in mind by allowing different years, json file inputs, and csv file inputs to be input and yielding results accordingly. The quality control comes from being able to see the output for the 2020, 2021 and 2022 data summing the clicks up for each of the encodes and then doing a find for each bitlink to verify that they add up correctly. 

6) While numbers or a similar spreadsheet could have been used to apply filters for the quality control, it was more fun to do it the above way.

7) The driving reason for versatility was in preparation for the live coding where improvements/additions would be made. The more modular and versatile the code, the easier the modifications.

8) The most difficult part of the challenge, coding-wise, was actually the "sorted array of JSON objects containing the long URL as the key and the click count as the value" part. I understand JSON to be a format and so I was confused when I read "JSON object". I made an educated guess that the structure and its being a valid JSON format upon output is what ultimately mattered. I'm hoping to get confirmation or correction on this.

9) It was possible to get the challenge done without implementiing OOD principles and creating the Encode class by instead making use of hashes(ruby)/maps(I believe is what they're called in Go)/objects(Javascript), but I did not think that would have been a scalable approach and it would not have been easy on the eyes/mind. 

<p align="right">(<a href="#top">back to top</a>)</p>
</details>

<!-- Getting Started -->
## Getting Started

To run this program you must first have Ruby installed on your device. There are installation instructions included based on my experience (limited as it may be) and preference. If you have installation managers that you prefer, feel free to use them instead.



<!-- Ruby Installation -->
### Ruby Installation
<details>
<summary> Click to expand/collapse </summary>

### macOS:
1) Install homebrew if you have not already done so by running `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"` in terminal. It will take some time. To confirm it's been installed correctly after it's done, press command + q on your keyboard. Start a new terminal session and type `brew doctor`, you should get `Your system is ready to brew.` as an output.

2) Install rbenv by running `brew install rbenv` in terminal. Once that is complete, run `rbenv init`; you should get an output that looks similar to: 
```
  # Load rbenv automatically by appending
  # the following to ~/.zshrc
  .
  eval "$(rbenv init -)"
```

3) Update your zshrc file with the eval line from the above output. If unsure how to open your zshrc file, use your code editor's shell command (the following example uses VScode and "code" refers to it) in the terminal: `code ~/.zshrc`. If the zshrc file does not exist, you can run ` touch ~/.zshrc` followed by the previous command to open it and paste the eval line in. Make sure to save the file then close using command + q. To confirm this step has been done correctly, start terminal again and type `rbenv versions`. If there are no error messages, you're good to go.

4) Use rbenv to install and/or change Ruby versions as needed. This program is built using Ruby 2.7.4, so we'll either install or switch to that version. If you don't see 2.7.4 listed when you run `rbenv versions`, then run `rbenv install 2.7.4` in terminal. Once done, you should see it listed after running `rbenv versions` (highly recommend command + q before checking). If you see it listed, then once you fork and clone the repo make sure to run `rbenv local 2.7.4` in the program's directory. You could also run `rbenv global 2.7.4` followed by `rbenv rehash` but that would change the globally used version to 2.7.4 rather than just the program's directory's.


### Windows:

![](https://tenor.com/bdtwd.gif)

<p align="right">(<a href="#top">back to top</a>)</p>
</details>

<!-- Repository Installation -->
### Repository Installation
* run`bundle install` in the console/terminal

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- Usage -->
### Usage

To run the program, just type the code below in the console/terminal:

`ruby count_clicks_runner.rb`

You'll see the following output:
```
[
  {
    "https://youtube.com/": 557
  },
  {
    "https://twitter.com/": 512
  },
  {
    "https://reddit.com/": 510
  },
  {
    "https://github.com/": 497
  },
  {
    "https://linkedin.com/": 496
  },
  {
    "https://google.com/": 492
  }
]
```

If you'd like to count clicks for other years, use a difference csv file, or use a different json file then in the count_clicks_runner.rb replace the arguments shown below as needed:

 `("2021", './data/decodes.json', './data/encodes.csv')`

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- ROADMAP -->
## Roadmap

MVP
* [x] Count clicks for the year 2021
* [x] Sort count in descending order
* [x] Output JSON array of hashes/objects in console
* [x] Unit tests for each method/function (employed TDD)
* [x] Detailed README file 

Stretch Goals
* [x] Write the code to count clicks based on year input and file path provided
* [x] Set Ruby up on Windows device to include installation instructions as well as test cloning and running on a different OS


<p align="right">(<a href="#top">back to top</a>)</p>
