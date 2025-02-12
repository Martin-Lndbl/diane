
from flask import Flask, request, jsonify
from llama_cpp import Llama

# Create a Flask object
app = Flask("Llama server")
model = None

@app.route('/', methods=['POST'])
def generate_response():
    global model
    
    try:
        data = request.get_json()

        # Check if the required fields are present in the JSON data
        if 'user_message' in data and 'max_tokens' in data:
            user_message = data['user_message']
            max_tokens = int(data['max_tokens'])

            # Prompt creation
            prompt = user_message
            
            # Create the model if it was not previously created
            if model is None:
                # Put the location of to the GGUF model that you've download from HuggingFace here
                model_path = "./llama-2-7b-chat.Q2_K.gguf"
                
                # Create the model
                model = Llama(model_path=model_path)
             
            # Run the model
            output = model(prompt, max_tokens=max_tokens, echo=True)
            
            return jsonify(output)

        else:
            return jsonify({"error": "Missing required parameters"}), 400

    except Exception as e:
        return jsonify({"Error": str(e)}), 500

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80, debug=True)
