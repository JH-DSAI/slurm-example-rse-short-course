import pandas as pd
from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import train_test_split
import os
import pickle

# Load the iris dataset
iris_data = pd.read_csv('iris.data', header=None)

# The last column is the label
X = iris_data.iloc[:, :-1]
y = iris_data.iloc[:, -1]

# Split the data into training and testing sets
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Train a RandomForest classifier
rf_model = RandomForestClassifier(n_estimators=100, random_state=42).fit(X_train, y_train)

# Evaluate the model
accuracy = rf_model.score(X_test, y_test)
print(f"Model Accuracy: {accuracy:.2f}")

# outpath
os.makedirs('./output', exist_ok=True)

with open('./output/rf_model.pkl', 'wb') as f:
    pickle.dump(rf_model, f)
print("Model saved to ./output/rf_model.pkl")