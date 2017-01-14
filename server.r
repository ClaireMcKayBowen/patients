library(shiny)
library(xtable)

# Define server logic for slider examples
shinyServer(function(input, output) {

  # Reactive expression to compose a data frame containing all of the values
  sliderValues <- reactive({

    # Compose data frame
    data.frame(
      Name = c("Number of Patients", 
               "Adverse Event Percentage Level",
			   "Percentage Significant Figures"),
      Value = as.character(c(input$patients, 
                             input$percent,
							 input$sig)), 
      stringsAsFactors=FALSE)
	}) 
	
	data.m <- reactive({
			m<-matrix(ncol=input$patients,nrow=input$patients)
			for(n in 1:input$patients){
				for(y in 1:input$patients){
					m[y,n]<-1-pbeta((input$percent),y+1/3,n-y+1/3)
					if(y==n)break
				}
			}
			m<-round(m,digits=input$sig)
			if(input$sig==2){
				m[m>.99]<-">0.99"
				}
			if(input$sig==3){
				m[m>.999]<-">0.999"
				}
			if(input$sig==4){
				m[m>.9999]<-">0.9999"
				}
			if(input$sig==5){
				m[m>.99999]<-">0.99999"
				}
				
			w<-matrix(ncol=1,nrow=input$patients)
				for(i in 1:(input$patients)){
					w[i]<-i
				}
			m<-cbind(w,m)
			colnames(m)<-c("# of Patients with AE",paste("",1:input$patients))
			as.data.frame(m)})
	
	output$downloadData <- downloadHandler(
			file = c('medical_data.csv'),
			content = function(file) {
			write.csv(data.m(), file)
			}
	)
	

  # Show the values using an HTML table
	output$values <- renderTable({
	sliderValues()})
	
	#output$data.m<-observe({print(data.m())})
	
	#output$data.m<-function(){xtable(data.m(), caption = "Your Caption",caption.placement = "top",include.colnames = TRUE,align=paste(rep("c",input$patients+1)))}
	
	output$data.m <- renderTable({
		data.m()},include.rownames=FALSE,include.colnames=TRUE,digits=3)
	
	
})