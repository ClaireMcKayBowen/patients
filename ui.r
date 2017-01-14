library(shiny)

# Define UI Clinical Trials App
shinyUI(pageWithSidebar(

  # Application title
	headerPanel("Are More of My Patients Developing Side Effects Than Expected?"),
  
	sidebarPanel(
		sliderInput("patients", "Number of Patients:", 
                min = 1, max = 200, value = 20),
		sliderInput("percent", "Adverse Event Percentage Level:", 
                min = 0, max = 1, value = 0.2, step= 0.01),
		sliderInput("sig", "Percentage Significant Figures:", 
                min = 2, max = 5, value = 3, step= 1),
		h4("Inputs"),
		tableOutput("values"),
		downloadButton('downloadData', 'Download Data')
    ),
	
  
  
  # Show a table summarizing the values entered
	mainPanel(

		tabsetPanel(
			tabPanel("Data Table",
				HTML('&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<font size=4>Total Number of Patients</font>'),
				tableOutput("data.m")
			),
			tabPanel("About",
				h5("This is a web application run by the R Package Shiny. It allows you to input the number of patients and the percentage threshold. You can download the data table by pressing the 'download data' button. The data will be saved to your download folder as a csv file.", align = "justify"),
				
				HTML("<u><b>Relative Literature:</b></u>
				     <p><b>Bowen, CMK</b>, Liu, F., & Wheeler, J. (2015), 'Are More of My Patients Developing Side Effects than Expected', <i>Practical Radiation Oncology</i>, doi: 10.1016/j.prro.2014.10.007"),
				br(),
				br(),
				p('Claire Bowen - Web App Contact',br(),'Statistics PhD Candidate | University of Notre Dame',br(),
				a('Website', href="http://www.clairemckaybowen.com", target="_blank"),
				'|',
				a('LinkedIn', href="https://www.linkedin.com/in/bowenclaire", target="_blank")
				),	

				br(),
								
				p('Fang Liu',br(),'Assistant Professor | University of Notre Dame',br(),
				a('Website', href="http://acms.nd.edu/people/faculty/fang-liu/", target="_blank")
				),
				
				br(),
				
				p('James A. Wheeler',br(),'Director of Radiation Oncology| Indiana University Goshen Center for Cancer Care',br(),
				a('Website', href="http://www.iuhealth.net/portal/IUH/findadoctor?paf_gear_id=6900001&paf_dm=full&task_name=displayBio&contactId=69771", target="_blank")
				)
				
			)
		)
	)

))
