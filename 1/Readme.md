# Regression Problems

**Part A: Linear Regression**

Datasets: parta_1.txt, parta_1_Outlier.txt, parta_2.txt

For the first part of the assignment, you need to implement closed form solution, the stochastic gradient descent (2000 epochs) and the batch gradient descent algorithms (2000 epochs) for linear regression. 

1.Train each model separately on the given datasets and plot all the datasets alongside with the obtained model.
2. One of these datasets have some outliers. Does it affects the robustness of the model?
3. Plot J(θ) in terms of θ0 and θ1 for models with two parameters.
4. Identify when over-fitting occurs?

**Part B: Weighted Linear Regression**

Dataset: partb_1.txt

The effect of outliers on linear regression method have been analyzed in the previous part. Here, you have to apply weighted linear regression on the first data-set which includes outliers.
1. Derive the closed form solution for weighted linear regression(WLR).
2. Propose a weighting function which decreases the effect of outliers with a formula. Explain why could it be appropriate.
3. Apply weighted linear regression using your suggested weighting function and find:
(a) The closed form solution.
(b) Batch gradient descent solution(2000 epochs).
4. When does WLR work better than simple linear regression?

**Part C: Logistic Regression**

1. The “Iris” dataset is one of the collections from UCI repository which you have to use in this part of the assignment. This dataset consists of 4 features and 3 classes. Eliminate the 1st and 2nd column of features and the 1st class’s samples so as to reduce the dataset to a 2 class problem with 2 features.
2. Train a Logistic Regression Model to be able to classify the data.
3. Derive the theoretical formula of the decision boundary for this model.
4. Plot the dataset and the model’s decision boundary.
5. In this question, use Logistic Regression for the whole dataset which contains 3 classes(with 2 features). Use the “one-vs.-one” and “one-vs.-All” methods for classification and compare all these methods’ results.
6. Plot the value of the objective function on each iteration of gradient descent, with the iteration number on the horizontal axis and the objective value on the vertical axis. Make sure to include axis labels and a title for your plot. Report the number of iterations that are required for the algorithm to converge.

**Part D: Softmax Regression**

In part C, Please use "soft-max regression" method for classification and compare this method with "one-vs.-one" and "one-vs.-all" results.
