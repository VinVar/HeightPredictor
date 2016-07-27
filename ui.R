# Predicting a child's adult height is not 100 percent accurate.  
# Below is a popular formula provided by the Mayo clinic:

# Add the mother's height and the father's height in either inches.
# Add 5 inches for boys or subtract 5 inches for girls.
# Divide by two.

library(shiny)

shinyUI(pageWithSidebar(
        headerPanel("Height Predictor"),
        sidebarPanel(
                #Choose the child's gender
                radioButtons("gender", "Child's Gender:",
                                   c("Male" = "Male",
                                     "Female" = "Female")),
                #Pick Father's height
                sliderInput('dadHt', "Father's Height in Inches:", min=36, 
                            max=100, value=36, step = .5),
                #Pick Mother's height
                sliderInput('momHt', "Mother's Height in Inches:", min=36, 
                            max=100, value=36, step = .5), 
                tabsetPanel(id = "inTabset",
                            tabPanel("How to use this app", 
                                     ("This is a very simple app that predicts the adult height of a child."),
                                     ("This app defaults to gender 'Male' and
                                      both the father and mother with a height of 36 inches.
                                      To use this app:"),
                                     h5("1. Choose the child's gender."),
                                     h5("2. Slide the father's height in inches."),
                                     h5("3. Slide the mother's height in inches."),
                                     ("You will see the calculated predicted height. 
                                      Also on the chart you will find a blue line that
                                      that shows where your childs predicted height 
                                      falls with respect to the U.S Population."),
                             helpText(   a("Click Here for detailed code",     
                                         href="https://github.com/VinVar/HeightPredictor",
                                         target="_blank")
                                             )
                                     
                             )
                )
        ),
        mainPanel(
                #Output the child's gender
                h4("Child's Gender"),
                #Output Father's height
                verbatimTextOutput("ogender"),
                h4("Father's Height"),
                verbatimTextOutput("odadHt"),
                #Output Mother's height
                h4("Mother's Height"),
                verbatimTextOutput("omomHt"),
                #Output Child's predicted height
                h4("Child's Predicted Height"),
                verbatimTextOutput("ochldHt"),
                #Output plot that shows where the predicted height falls w.r.t US population
                h4("Compare to average US Adult height"),
                plotOutput("op")
        )
))