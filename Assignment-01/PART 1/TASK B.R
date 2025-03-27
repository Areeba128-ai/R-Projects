# Load Reticulate for Python support in RStudio
library(reticulate)

# Set the correct Python path
use_python("C:/Users/beba2/AppData/Local/Programs/Python/Python311/python.exe", required=TRUE)

# Load Python Libraries
py_run_string("
import pandas as pd
from sklearn.datasets import load_iris

# Load dataset
data = load_iris()
df = pd.DataFrame(data.data, columns=data.feature_names)
df['target'] = data.target
")

# Data Preprocessing
py_run_string("
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler

# Split dataset
X = df.drop(columns=['target'])
y = df['target']

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Feature Scaling
scaler = StandardScaler()
X_train = scaler.fit_transform(X_train)
X_test = scaler.transform(X_test)
")

# Train Logistic Regression Model
py_run_string("
from sklearn.linear_model import LogisticRegression

model = LogisticRegression()
model.fit(X_train, y_train)
")

# Make Predictions and Evaluate Model
py_run_string("
from sklearn.metrics import accuracy_score

y_pred = model.predict(X_test)
print('Accuracy:', accuracy_score(y_test, y_pred))
")

# Visualization using Seaborn & Matplotlib
py_run_string("
import seaborn as sns
import matplotlib.pyplot as plt

sns.scatterplot(x=df['sepal length (cm)'], y=df['sepal width (cm)'], hue=df['target'])
plt.show()
")
