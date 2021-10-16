#' Car analysis using Rshiny
#' DS: Gavin South

# Libraries galore
library(shiny)
library(shinythemes)
library(readxl)
library(tidyverse)
library(DT)
library(formattable)
library(vroom)

# All that lovely data
cars <- read_excel("~/Desktop/Applied Programming/Sprint Two/car_data.xlsx")

# The user interface and fluid input page
ui <- fluidPage(
    theme = shinytheme("flatly"),
    h1("Choosing a New Car Using Analytics"),
    h3("Author: Gavin South"),
    tabsetPanel(
        type = "tabs",
        tabPanel("Background",
                 h3("Cross Shopping Three Models"),
                 h4("I have lived the past six years without a car, and although having the expenses of insurance, 
                     gas, and a payment gone I miss having that sense of freedom that car ownership brings. 
                     I'm also honestly sick of walking back and forth to Broliums all winter with groceries in hand 
                     straining and freezing cold. NO MORE."), 
                 h4("Now that I've done an internship and earning a living I feel like it's time to find a new car.
                    But, not just a new car but a new car that I will keep for years and years. 
                    A car that will check all the boxes."),
                 h3("I dwindled down to three different car models:"),
                 h3("Subaru WRX STI"),
                 h3("Toyota Tacoma"),
                 h3("Ford F150"),
                 br(),
                 h4("I found myself drawn to these models because I want something fun, reliable, and practical. 
                    Although these cars are all different they all have traits that check all these boxes."),
                 h4("But how should I decide? Biases? I like them all... How about data and looking at some numbers and metrics."),
                 h4("Throughout this small analysis I will show a good way at looking and comparing different variable to give an
                    idea of where these current car models are sitting against one another. I will show how they have improved over the years.
                    I will also show how drastically things can change when tech or now things are explored and used by companies. 
                    I'll also explain some interesting company ethics that ensure these metrics stay steady and don't change (borring but amazingly efficient)"),
                 h4("In essence this analysis goes in depth to explore three amazing cars and their pros and cons and will enable me to make a more informed decision")),
        tabPanel("Data",
                 br(),
                 h4("This data was collected manually from the internet from any and every resource I could find. 
                    It contains 20+ years worth of specs on the three cars aforementioned. This table is also 
                    interactive so click around, sort, and search to your hearts content."),
                 br(),
                 DT::dataTableOutput("data")),
        tabPanel(
            "Plot",
            br(),
            plotOutput("plot"),
            fluidRow(
                column(
                    3,
                    checkboxGroupInput(
                        "checkGroup",
                        h3("Car Models:"),
                        choices = list(
                            "WRX STI" = "WRX STI",
                            "F150" = "F150",
                            "Tacoma" = "Tacoma"
                        ),
                        selected = "WRX STI"
                    ),
                    helpText("Check one or more cars to compare.")
                ),
                column(
                    4,
                    selectInput(
                        "variable",
                        h3("Variables:"),
                        choices = colnames(cars %>% select(-model,-year,-make,-index)),
                        selected = "hp"
                    ),
                    hr(),
                    helpText("Choose a unique variable to plot.")
                ),
                column(
                    4,
                    h3("Regression Line:"),
                    checkboxInput("checkbox", "ON", value = FALSE),
                    helpText("Check to see slope of regression line.")
                ))
        ),
        tabPanel(
            "Conclusion",
            br(),
            h3("The verdict is still out..."),
            h4("After looking at the differences in all the different metrics on these cars side by side 
               I was lead to think differently about my choice in car. They are all so different obviously 
               but some of these cars are starting to lag behind the times, especially considering the past 20
               years. The Subaru for example is a familiar formula that has not changed much in the powertrain 
               department in years. Even with the most recent refresh this year the performance metrics have barely 
               budged. They may see this as conservative or familiar but to most of the car community, they find
               it frustrating and odd that there is not great growth and imrpovement in areas as important as these."),
            br(),
            h4("Toyota, on the other hand may also do something similar using their manufacturing techniques of Kaizen 
               to build robust and proven cars that sometimes trade wild upgrades for steady and small improvements 
               upon what is already working. This is good to note and shows up in a lot of Toyota's models in resale
               and longevity. But as time goes on Toyota has been feeling the pressure of some other companies
               and has started to build faster, more powerful, forced induction or hybrid powertrains for their 
               most popular models. The best question we can face at this point is, while considering a 4Runner or
               Tacoma, is it wise to sit around and wait for these cars to become powerhouse versions of their best selves 
               and then buy? We'll have to see."),
            br(),
            h4("The most valuable insight I gathered from this analysis is this though. Ford has come out with their 
               first full-sized electric truck, the F-150 lightning, and it is proving to be a powerful and exciting
               option in a very competitive segment. Ford has caught on and is going to make some amazing strides with 
               their electric line up of cars. Not only do they appeal to the climate-awareness crowd but they are 
               appealing to all Americans who want improvements and joy from their cars. Massive performance upgrades and 
               a range that could make any other full size enviousm YES please. More of that."),
            br(),
            h4("One more not on the subject. This analysis has sold me on electric cars. I think they are truly the
               future for all people, car enthusiast and layman alike. America is ready. Toyota, Subaru, other manufacturers, all
               are catching on. These two Japanese powerhouse companies are still teaming up and building a new crossover
               that will come out early next year as both companies real attempt at an soley all-electric model. I
               personally am so curious about the metrics behind this thing. I hope it gets the same hype as the new
               hybrid Tundra that is going to be an amazing truck. Lets just hope these companies can keep going
               and improve some of Americas favorite cars... elecric Tacoma, electric WRX? 4wd and 400hp+? I'm waiting.")
            )
        )
    )
)

# The server function
server <- function(input, output, session) {
    output$plot <- renderPlot({
        p <- cars %>%
            filter(model %in% input$checkGroup) %>%
            ggplot(aes(
                x = year,
                y = !!(as.symbol(input$variable)),
                color = model
            )) +
            geom_line(aes()) +
            theme_minimal() +
            theme(legend.position = c(0.05, 0.8)) +
            labs(
                title = "Variable Changing Over Time",
                subtitle = "Produced Using GGPlot in Tidyverse"
            )
        if(input$checkbox == TRUE) {
            p = p + geom_smooth(
                method = lm,
                se = FALSE,
                linetype = "dotted",
                cex = .5
            )}
        else {
            p = p
        }
        p
    }, res = 96)
    output$data = DT::renderDataTable({ cars })
}

# Running the app 
shinyApp(ui = ui, server = server)
runApp("app.r")

