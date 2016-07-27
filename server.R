library(shiny)
library(ggplot2)
# create a 2 by 2 data frame with the average male and female height of us population
gender <- c("Male", "Female")
height <- c(69.5, 64)
df <- data.frame(gender, height)

#Create a bar plot that shows the average us height by gender
#Add a line plot to indicate the predicted height based on user input.
avHtPlot <- function(c) {
        ggplot(aes(gender, height), data = df) +
                title("Predict height of US Population by Gender") +
                labs(x="Gender", y="Average Height in inches") +
                geom_bar(stat="identity", width = 0.2, aes(fill=gender)) + 
                geom_hline(aes(yintercept=c), color="blue" ,size= 1) +
                geom_text(aes(.5,c-5,label = c, vjust = -1))
}

shinyServer(function(input, output)  {
                genderInput <- reactive({
                        switch(input$gender,
                               "Male" = 5,
                               "Female" = -5)
                })
                
                childHeight <- reactive({
                        (input$dadHt + input$momHt + genderInput())/2
                })
                
                output$ogender <- renderPrint({input$gender})
                output$odadHt <- renderPrint({input$dadHt})
                output$omomHt <- renderPrint({input$momHt})
                output$ochldHt <- renderPrint({childHeight()})
                output$op <-   renderPlot({
                                p <- avHtPlot(childHeight())
                        print(p) 
                        })
         })
