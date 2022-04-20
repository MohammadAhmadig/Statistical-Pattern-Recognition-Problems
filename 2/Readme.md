# Problems

**Part A: Bayesian Classification**

Datasets: parta_Train1.csv, parta_Test1.csv, parta_Train2.csv, parta_Test2.csv You are provided with two two-class train and a test datasets which are generated from four Gaussian Distributions(Each class belongs to one of these distributions). In this part you have to construct two Bayesian Classifiers so as to classify both train and test data.

For each dataset:
1. Use a Bayesian Classifier to classify both the train and test datasets and calculate both accuracies.
2. Plot the decision boundary and classification results while representing the misclassified samples with a different color or shape.
3. Plot estimated PDFs. (3D)
4. Contour estimated PDFs along with the decision boundary. (2D)
5. What is the main difference between two datasets?


**Part B: Naive Bayes Classification**

Datasets: Numbers Dataset, lingspam

In this part of the assignment you have to implement a Naive Bayes classifier to detect Spam and non-Spam emails. After that implement another Naive Bayes classifier to detect numbers among 0 to 9 for a collection of image samples. The “Number” dataset is provided and you have to refer to the “readme” file so as to find out more about this dataset. You should use Laplace Smoothing as a part of your job.

1. Classify test emails using Naïve Bayes classifier on train emails and report the total and per-class accuracies(train and test). Use each word as a feature and construct a dictionary.(lingspam dataset)
2. Classify Numbers Dataset using Naïve Bayes classifier and report the total and per-class accuracies(train and test).(refer to the readme file)
3. For Numbers dataset Plot the result in a 2D-figure representing the “sample’s index” as x and the “estimated label” as y.


**Part C: Parametric Density Estimation**

For this assignment you have to generate a dataset for two class each with 1000 samples from two Gaussian distribution described bellow:
Class1 : µ = [1 4] Σ = [3 0 ; 0 2]
Class2 : µ = [5 3] Σ = [2 1 ; 1 2]

Assume that you do not know the true distribution of the above classes and want to estimate the density of the given data. For a parametric model, you have to choose a model first and estimate the parameters. The obvious choice here would be Gaussian model!
1. Find out the parameters using Maximum Likelihood estimation for each class.
2. Implement the PDF function P( X ) .
3. Plot both true and the estimated PDFs and compare the results.


**Part D: Non-Parametric Density Estimation**

Use your generated data from previous part. Here you have to estimate the density without pre-assuming a model for the distribution which is done by a non-parametric estimation.
1. Implement the below PDF estimation methods using h=0.09, 0.3, 0.6 and answer the next questions for all of them:
a) Histogram
b) Parzen Window
c) Gaussian kernel(Standard Deviations of 0.2, 0.6, 0.9)
d) KNN Estimator(For k=1, 11,111 )

2. Estimate P( X ) and Plot the true and estimated PDF and compare them for each of the separate model.
3. Find the best value for h in the Gaussian kernel model with the standard deviation of 0.6 using 5-Fold cross-validation.
4. Plot the bias and variance functions of estimated PDFs of class 2, using Gaussian kernel with standard deviation of 0.2 and 0.6 and KNN estimator with k=1 and k=111.
5. Employ the estimated Gaussian kernel for each class and do the followings with standard deviation 0.6:
a) Divide the samples into a 90% train and 10% test data randomly.
b) Use Bayesian estimation and predict the class labels while reporting train, test and total accuracies.
