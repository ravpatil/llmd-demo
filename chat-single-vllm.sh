# Port forward to the pod
oc port-forward deployment/llama-vllm-single-predictor 8000:8000 &

# Check the list of models
curl http://localhost:8000/v1/models | jq .https://github.com/ravpatil/llmd-demo/tree/main

# Chat with sample query/prompt to the model endpoint 
# Send a test request to the model
curl http://localhost:8000/v1/completions \
  -H "Content-Type: application/json" \
  -d '{
    "model": "llama-vllm-single",
    "prompt": "San Francisco is a",
    "max_tokens": 50,
    "temperature": 0.7
  }' | jq .
