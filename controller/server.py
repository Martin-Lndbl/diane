from flask import Flask, request, jsonify, Response
import requests

app = Flask(__name__)

@app.route('/generate', methods=['POST'])
def generate():
    data = request.json
    prompt = data.get('prompt')
    speaker_id = data.get('speaker_id', '336')
    if not prompt:
        return jsonify({"error": "No prompt provided"}), 400

    try:
        # llama3 requests
        llm_params = {"model": "llama3", "prompt": prompt, "stream": False}
        llm_response = requests.post('http://172.19.0.33/api/generate', json=llm_params)
        llm_response.raise_for_status()

        llm_response_data = llm_response.json()
        answer = llm_response_data.get('response')
        if not answer:
            return jsonify({"error": "No response text found in the server response"}), 500

        # tts request
        tts_params = {"text": answer, "speaker_id": speaker_id, "style_wav": "", "language_id": ""}
        tts_response = requests.get('http://172.19.0.34/api/tts', params=tts_params)
        tts_response.raise_for_status()
        
        return Response(tts_response.content, 
            mimetype='audio/wav', 
            headers={"Content-Disposition": "attachment; filename=output.wav"})

    except requests.exceptions.RequestException as e:
        return jsonify({"error": str(e)}), 500

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)

