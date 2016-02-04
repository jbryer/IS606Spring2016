devtools::install_github('rstudio/shinyapps')

source('config.R') # Contains configuration variables

##### Deploy to shinyapps.io ###################################################
library(shinyapps)

shinyapps::setAccountInfo(name='jbryer',
						  token=shinyappsio.token,
						  secret=shinyappsio.secret)
shinyapps::deployApp(appName='MASS')

# Dashboard: https://www.shinyapps.io/admin/#/dashboard
# Survey Link: https://excelsior.eu.qualtrics.com/SE/?SID=SV_0If2SzYPhQvEBRb
# Results: https://jbryer.shinyapps.io/MASS?responseId=R_1IblE2Oi6Hzjm0a
# Set redirect in Qualtrics to: https://jbryer.shinyapps.io/MASS?responseId=${e://Field/ResponseID}
