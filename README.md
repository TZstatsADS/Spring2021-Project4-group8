# Project 4: Causal Inference

### [Project Description](doc/project4_desc.md)

Term: Spring 2021

+ Team #8
+ Projec title: Causal Inference
+ Team members
	+ Dennis Shpits
	+ Yutong(April) Yang
	+ Feng Rong
	+ Ellen Chen
	+ Hao Hu
+ Project summary: In this project, we implemented stratification, propensity matching and weighted regression on the high and low dimensional dataset. The propensity score was estimated using regression trees. Then we calculated the Average Treatment Effect(ATE) using all the three methods. We evaluate the three methods in terms of runtime and the accuracy of their ATE estimation. For the stratification method, we divided the high dimensional data into 6 stratums and the low dimensional data into 2 stratums.

+ **Result**

ATE | High Dimension Data | Low Dimension Data
------------ | ------------- | -------------
True ATE | -54.855800 | 2.090100
Stratification | -61.932886 | 4.388841
Propensity Matching | -57.492971 | 2.073773
Weighted Regression | -57.164089 | 2.305857

Runtime | High Dimension Data | Low Dimension Data
------------ | ------------- | -------------
PS Estimation | 1.09668183 | 0.03268313
Stratification | 0.01617503 | 0.04357100
Propensity Matching | 0.11255002 | 0.11195898
Weighted Regression | 0.15968490 | 0.15398812
	
**Contribution statement**: 
	Dennis Shpits worked on the propensity matching algorithm. 
	
	Feng Rong worked on the stratification algorithm. 
	
	Yutong (April) Yang initialized group contact, set up the framework for the final report and the presentation slides, wrote the part of the comparison of results and the final conclusion. 
	
	Ellen Chen worked on cross validation and parameters tuning for maxdepth and get the propensity score for regression tree model. 
	
	All team members contributed equally in all stages of this project. All team members approve our work presented in this GitHub repository including this contributions statement. 

Following [suggestions](http://nicercode.github.io/blog/2013-04-05-projects/) by [RICH FITZJOHN](http://nicercode.github.io/about/#Team) (@richfitz). This folder is orgarnized as follows.

```
proj/
├── lib/
├── data/
├── doc/
├── figs/
└── output/
```

Please see each subfolder for a README file.
