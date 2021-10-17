# RShiny_CarAnalysis
### Author: Gavin South
Comparing and contrasting popular car models to help me make a decision at the dealership.

## Overview

R is a powerful and fun tool used to do data analytic and programming tasks among a plethora of other things. Interestingly it also includes that capacity to do simple interactive web pages with a document called a Shiny. It uses a local computer for a server and updates user input on the fly. 

I figured building a Shiny app to do a analytics presentation on something I'm VERY interested in would be a worthwile venture. In this doc I'll explain what I made and why I made it.

[Software Demo Video](https://youtu.be/YE-Ks1ZLOAg)

# Data Analysis Results

Q. I want to know how much three cars I love have improved (or not improve) through the years.

Q. I wanted to use simple visual comparisons and regression lines to come to some conclusions about these cars and the pros and cons of each.

Q. I wanted to find insights that were not immediate apparent by looking at car specs side by side, to find the not-immediately seen information hidden in data.

# Development Environment

I programmed this app in Rstudio™ using R and a ShinyR script. 

Libraries I used:
DT - Formatting the data frame to display in the document in an inneractive.
shiny - Library that includes the functions and tools to build and run the app.
readxl - Library to read Excel files. In this case this is how I saved the data abd thus need to read in that form.
tidyverse - The best and beastiest library for R. Used to do wrangling and building the interactive GGplot. 
shinythemes - To spice up the app with some different themes and aesthetics. 

# Useful Websites

* [RShiny](https://shiny.rstudio.com/)
* [Shiny Themes](https://rstudio.github.io/shinythemes/)
* [Interactive Buttons](https://shiny.rstudio.com/articles/action-buttons.html)

# Future Work
* This needs to go more in depth with statistics and Rsquared values.
* I need to find a way to upload this to the web and see if I can get some more feedback.
