library(qualtrics)
library(ggplot2)
library(likert)

if(file.exists('Data/MASS-results.rda')) {
	load('Data/MASS-Results.rda')
} else {
	surveyId <- 'SV_0If2SzYPhQvEBRb' # MASS only
	source('Shiny-MASS/config.R')
	mass <- getSurveyResults(user, pass, surveyId)
	save(mass, file='Data/MASS-Results.rda')
}

mass.levels <- c('Strongly Agree', 'Agree', 'Neither Agree nor Disagree', 
                 'Disagree', 'Strongly Disagree')

mass.items <- c('I find math interesting.',
                'I get uptight during math tests.',
                'I think that I will use math in the future.',
                'Mind goes blank and I am unable to think clearly when doing my math test.',
                'Math relates to my life.',
                'I worry about my ability to solve math problems.',
                'I get a sinking feeling when I try to do math problems.',
                'I find math challenging.',
                'Mathematics makes me feel nervous.',
                'I would like to take more math classes.',
                'Mathematics makes me feel uneasy.',
                'Math is one of my favorite subjects.',
                'I enjoy learning with mathematics.',
                'Mathematics makes me feel confused.')

# Map of where respondents are located
states <- map_data('state')
ggplot(states, aes(x=long, y=lat)) + 
  geom_polygon(aes(group=group), color='grey70', fill='white') +
  geom_point(data=mass, aes(x=LocationLongitude, y=LocationLatitude), color='blue') +
  coord_map('albers',  at0 = 45.5, lat1 = 29.5) +
  theme(axis.ticks=element_blank(), axis.text=element_blank()) +
  xlab('') + ylab('') + ggtitle('Location of IS606 Spring 2016 Students')

# Likert Plot
mass.likert <- mass[,11:24]
names(mass.likert) <- mass.items
for(i in seq_len(ncol(mass.likert))) {
	mass.likert[,i] <- factor(mass.likert[,i], levels=1:5, labels=mass.levels, ordered=TRUE)
}

l <- likert(mass.likert)
plot(l)
