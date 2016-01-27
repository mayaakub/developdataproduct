library(shiny)
library(ggplot2)

# Define a server for the Shiny app
shinyServer(function(input, output) {
   
  output$inputYear <- renderUI({
    selectInput("Year", "Year:", c("All",as.character(unique(DataYear$Year))))
  })
  
  output$inputMonth <- renderUI({
    selectInput("Month", "Month:", c("All",as.character(unique(subset(DataYear,Year==input$Year)$Month))))  
    })
  
  selectedData <- reactive({  
    
    if (input$Year == "All") {
      DataYearAll
    }
    else if (input$Year != "All" & input$Month == "All") {
      subset(DataYear, Year==input$Year)
    }
    else if (input$Year != "All" & input$Month != "All") {
      subset(DataBase, Year==input$Year & Month==input$Month)
    }
    
  })
  
  output$DataBase<-renderPrint({ selectedData()
  })
  
  output$BarPlot <- renderPlot({
    # Render a barplot 
    validate(need(input$Month,"Value"))
    validate(need(input$Year,"Value"))
    if (input$Year == "All") {
      g <- ggplot(selectedData(), aes(factor(Year),Total,fill=Year))      
    }
    if (input$Year != "All" & input$Month == "All") {
      g <- ggplot(selectedData(), aes(factor(Month,levels=Month),Total,fill=Month))        
    }
    if (input$Year != "All" & input$Month != "All") {
      g <- ggplot(selectedData(), aes(factor(Day),Total,fill=Day)) 

    }
    g <- g + geom_bar(stat="identity",position="dodge")
    g <- g + guides(fill=FALSE) + geom_hline(yintercept = 120)
    g <- g + labs(x="Day",y="Storage Usage (TB)") + ylim(0,125)
    g
    })
  
  output$PiePlot <- renderPlot({
    # Render a piechart
    if (input$Year == "All") {
      g <- ggplot(selectedData(), aes(Year,Total,fill=Year)) 
    }
    if (input$Year != "All" & input$Month == "All") {
      g <- ggplot(selectedData(), aes(factor(Month,levels=Month),Total,fill=Month)) 
    }
    if (input$Year != "All" & input$Month != "All") {
      g <- ggplot(selectedData(), aes(factor(Day),Total,fill=Day)) 
 
    }
    g <- g + geom_bar(stat="identity",position="dodge")
    g <- g + guides(fill=FALSE)  
    g <- g + labs(x="Day",y="Storage Usage (TB)") 
    g <- g + coord_polar("x", start=0) 
    g
  })
  
  output$LinePlot <- renderPlot({
    ## Render a lineplot
    if (input$Year == "All") {
      g <- ggplot(selectedData(), aes(Year,Total)) 
    }
    if (input$Year != "All" & input$Month == "All") {  
      g <- ggplot(selectedData(), aes(factor(Month,levels=Month),Total,group=Year)) 
    }
    if (input$Year != "All" & input$Month != "All") {
      g <- ggplot(selectedData(), aes(factor(Day),Total,group=Month)) 
    }
    g <- g + geom_point(pch=12, cex=1) + geom_line(color="red", alpha=0.5,size=1) + ylim(0,125)
    g <- g + geom_hline(yintercept = 120) + labs(x="Day",y="Storage Usage (TB)") 
    g 
  })

})
