from flask import Flask, render_template, request, redirect, url_for

app = Flask(__name__)

# Página inicial
@app.route('/')
def index():
    return render_template('index.html')

# Página de login vulnerável
@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        user = request.form.get('username')
        password = request.form.get('password')

        # Vulnerabilidade proposital: sem validação, sem proteção contra injeção
        if user == "admin" and password == "123":
            return redirect(url_for('success'))
        else:
            return "Usuário ou senha incorretos."

    return render_template('login.html')

@app.route('/success')
def success():
    return render_template('success.html')

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
