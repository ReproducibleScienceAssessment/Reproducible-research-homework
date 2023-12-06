# Reproducible research: version control and R

## Question 4 

1. Execute the code to produce the paths of two random walks. What do you observe?

This code generates a series of random 'steps' after pulling from the function 500 times. The patterns of steps changes each time you run the code. The random walk model describes a sequence of points which are derived from the previous one by adding a random element. There is no systematic trend or pattern seen in the output of the model.

It has generated 2 dataframes from the same model which are plotted. The axes are x and y coordinates for the 'step' of each time stamp (of which there are 500). These are shown by the colour gradient shown in the legend

2. A random seed is a starting point or initial value used in random number generation or randomization processes within computer programs and statistical algorithms. It is a fixed value or set of values that serves as a basis for generating a sequence of random numbers or outcomes. Setting a random seed allows for reproducibility, meaning that if you use the same seed value, you will get the same sequence of random numbers or results each time you run the program or algorithm.

3. see file (random_walk)

4. comparison of random_walk commits
   
<img width="1212" alt="Screenshot 2023-12-06 at 11 47 18" src="https://github.com/skystewartroberts/Reproducible-research-homework/assets/150151519/9c4f3c41-a0f4-459d-ba51-455ad82952e3">


## Question 5

1. 33 rows and 13 columns

2. we have fit a log transformation to the data so we can fit a linear model 

3. finding the exponent and scaling factor 

slope (exponent) = $\alpha$ = 1.5152 

intercept (scaling factor) = ln($\beta$) = e^(7.0748) = 1181.8

The linear model showed that the genome length is a significant predictor of virion volume (p<0.001, R2 = 0.71, slope = 1.52). The model accounted for 71% of the data. These values are the same as the paper for the subset of dsDNA strands that they analysed. This is expected as a linear model should produce the same predicted values when fitted to the same data set repeatedly 

4. Code to reproduce the graph: (also can be found on Q5 r code script)

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
  
  
5. Estimated volume for a virion with a genome length of 300 using equation of the regression line 

Volume = 6.697×10^(6) (rounded)


## Bonus: Explain the difference between reproducibility and replicability in scientific research. How can git and GitHub be used to enhance the reproducibility and replicability of your work? What limitations do they have?

Reproducibility is the ability of researchers to obtain the same results or findings that were reported in previous experiments using the same data and methods. Whereas replicability is the ability to conduct a similar experiment using different data or methods to obtain consistent results to those found in the original study. Reproducibility focuses mainly on the importance of sharing detailed methods and code which allows other scientists to replicate the experiment, in comparison to replicability which assesses the study's ability to be generalised, testing the phenomena or theory on other data to see if it is robust in other systems. 

GitHub can be used to enhance the reproducibility and replicability of your work through:

1. Tracking changes - Git allows you to track and document changes in the code, including who made the changes and when. This also allows previous versions to be recovered if a mistake is made and shows how the project has evolved.

2. Collaboration - Git allows multiple people to collaborate on files simultaneously, and tracks who makes changes to which file. It can also separate projects using channels which allows differentiation between different experiments for larger projects 

3. Data and code sharing - Git can be used as a public platform in which you can sharing code and data with the wider scientific community. This increases accessibility and transparency within the experiment and allows others to replicated the study


However, GitHub also has some limitations:

1. It imposes storage limits on all accounts therefore projects with large amounts of data will run into problems 

2. Understanding how GitHub functions can be confusing and therefore it introduces a steep learning curve for people on the projects who have not used it. Furthermore, it has limited customisability for companies with specific requirements

3. Finally, GitHub is not accessible in all areas. It relies on fast internet connection in order to collaborate on a project and is not available in all areas of the world. Furthermore, more advanced features require a paid subscription which introduces further costs to the project




## Instructions

The homework for this Computer skills practical is divided into 5 questions for a total of 100 points (plus an optional bonus question worth 10 extra points). First, fork this repo and make sure your fork is made **Public** for marking. Answers should be added to the # INSERT ANSWERS HERE # section above in the **README.md** file of your forked repository.

Questions 1, 2 and 3 should be answered in the **README.md** file of the `logistic_growth` repo that you forked during the practical. To answer those questions here, simply include a link to your logistic_growth repo.

**Submission**: Please submit a single **PDF** file with your candidate number (and no other identifying information), and a link to your fork of the `reproducible-research_homework` repo with the completed answers. All answers should be on the `main` branch.

## Assignment questions 

1) (**10 points**) Annotate the **README.md** file in your `logistic_growth` repo with more detailed information about the analysis. Add a section on the results and include the estimates for $N_0$, $r$ and $K$ (mention which *.csv file you used).
   
2) (**10 points**) Use your estimates of $N_0$ and $r$ to calculate the population size at $t$ = 4980 min, assuming that the population grows exponentially. How does it compare to the population size predicted under logistic growth? 

3) (**20 points**) Add an R script to your repository that makes a graph comparing the exponential and logistic growth curves (using the same parameter estimates you found). Upload this graph to your repo and include it in the **README.md** file so it can be viewed in the repo homepage.
   
4) (**30 points**) Sometimes we are interested in modelling a process that involves randomness. A good example is Brownian motion. We will explore how to simulate a random process in a way that it is reproducible:

   - A script for simulating a random_walk is provided in the `question-4-code` folder of this repo. Execute the code to produce the paths of two random walks. What do you observe? (10 points)
   - Investigate the term **random seeds**. What is a random seed and how does it work? (5 points)
   - Edit the script to make a reproducible simulation of Brownian motion. Commit the file and push it to your forked `reproducible-research_homework` repo. (10 points)
   - Go to your commit history and click on the latest commit. Show the edit you made to the code in the comparison view (add this image to the **README.md** of the fork). (5 points)

5) (**30 points**) In 2014, Cui, Schlub and Holmes published an article in the *Journal of Virology* (doi: https://doi.org/10.1128/jvi.00362-14) showing that the size of viral particles, more specifically their volume, could be predicted from their genome size (length). They found that this relationship can be modelled using an allometric equation of the form **$`V = \beta L^{\alpha}`$**, where $`V`$ is the virion volume in nm<sup>3</sup> and $`L`$ is the genome length in nucleotides.

   - Import the data for double-stranded DNA (dsDNA) viruses taken from the Supplementary Materials of the original paper into Posit Cloud (the csv file is in the `question-5-data` folder). How many rows and columns does the table have? (3 points)
   - What transformation can you use to fit a linear model to the data? Apply the transformation. (3 points)
   - Find the exponent ($\alpha$) and scaling factor ($\beta$) of the allometric law for dsDNA viruses and write the p-values from the model you obtained, are they statistically significant? Compare the values you found to those shown in **Table 2** of the paper, did you find the same values? (10 points)
   - Write the code to reproduce the figure shown below. (10 points)

  <p align="center">
     <img src="https://github.com/josegabrielnb/reproducible-research_homework/blob/main/question-5-data/allometric_scaling.png" width="600" height="500">
  </p>

  - What is the estimated volume of a 300 kb dsDNA virus? (4 points)

**Bonus** (**10 points**) Explain the difference between reproducibility and replicability in scientific research. How can git and GitHub be used to enhance the reproducibility and replicability of your work? what limitations do they have? (e.g. check the platform [protocols.io](https://www.protocols.io/)).
