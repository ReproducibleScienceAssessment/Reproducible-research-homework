install.packages("janitor")
install.packages("ggplot2")
library(janitor)
library(ggplot2)

cui <- read.csv("question-5-data/Cui_etal2014.csv")

#looking at the number of columns and rows in the data set 
ncol(cui)
nrow(cui)

#cleaning the data 
colnames(cui)

cui_clean<- clean_names(cui)

colnames(cui_clean)

#transforming the data using logarithms to fit a linear model 

ggplot(cui_clean, 
       aes(y=log(virion_volume_nm_nm_nm),
           x=log(genome_length_kb)))+
  geom_point()

#generating a linear model to find the exponent and scaling 

mod1 <- lm(log(virion_volume_nm_nm_nm)~log(genome_length_kb), cui_clean)

summary(mod1)

confint(mod1)

#exponent = 1.52
#scaling factor = 1181.8

#plotting the model to reproduce graph 

    ggplot(cui_clean, 
       aes(y = log(virion_volume_nm_nm_nm),
           x = log(genome_length_kb))) +
  geom_point(size = 1.5) +
  geom_smooth(method = "lm", size = 0.75) +
  labs(
    x = "log [Genome length (kb)]",
    y = "log [Virion volume (nm3)]"
  ) +
  theme_bw()+
      theme(axis.title.x = element_text(face = "bold", size=9),
    axis.title.y = element_text(face = "bold", size=9),
    panel.grid.major = element_line(colour = "grey92", linewidth=0.3, linetype="solid"),
    panel.grid.minor = element_line(colour = "grey92", linewidth=0.3, linetype="solid"),
  )
  
    
#finding an estimated volume for a virion with a genome length of 300 kb 
L=300
B= 1182
lnV <- 1.5*log(L) + log(B)
lnV
exp(lnV)


