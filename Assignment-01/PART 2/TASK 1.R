library(reticulate)

py_run_string("
import numpy as np
import joblib
from sklearn.datasets import load_iris
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.linear_model import LogisticRegression
import onnx
from skl2onnx import convert_sklearn
from skl2onnx.common.data_types import FloatTensorType
import onnxruntime as ort

# Load dataset
iris = load_iris()
X, y = iris.data, iris.target

# Split dataset
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Normalize features
scaler = StandardScaler()
X_train = scaler.fit_transform(X_train)
X_test = scaler.transform(X_test)

# Train model
model = LogisticRegression()
model.fit(X_train, y_train)

# Convert model to ONNX
initial_type = [('float_input', FloatTensorType([None, X_train.shape[1]]))]
onnx_model = convert_sklearn(model, initial_types=initial_type)
onnx.save(onnx_model, 'logistic_regression.onnx')

# Load ONNX model and test inference
onnx_session = ort.InferenceSession('logistic_regression.onnx')
input_name = onnx_session.get_inputs()[0].name
test_sample = X_test[:5].astype(np.float32)
predictions = onnx_session.run(None, {input_name: test_sample})

print('ONNX Model Predictions:', predictions[0])
")
