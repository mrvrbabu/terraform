from flask import Flask

app = Flask(__name__)

@app.route('/smart-alerts')
def index():
    return 'Hello welcome to Rasberry pi World'

@app.route('/cakes')
def cakes():
    return 'Yummy cakes'

if __name__=='__main__':
    app.run(debug=True, host='0.0.0.0', port='8080')
