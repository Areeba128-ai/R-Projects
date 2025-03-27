py_run_string("
import onnx
from skl2onnx import convert_sklearn
from skl2onnx.common.data_types import FloatTensorType

initial_type = [('float_input', FloatTensorType([None, X_train.shape[1]]))]
onnx_model = convert_sklearn(model, initial_types=initial_type)
onnx.save(onnx_model, 'model.onnx')
")

py_run_string("
import onnxruntime as ort
import numpy as np

sess = ort.InferenceSession('model.onnx')
input_name = sess.get_inputs()[0].name
output_name = sess.get_outputs()[0].name

input_data = np.array(X_test, dtype=np.float32)
pred_onnx = sess.run([output_name], {input_name: input_data})[0]

print('ONNX Predictions:', pred_onnx)
")
