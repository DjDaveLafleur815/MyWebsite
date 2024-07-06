from flask import Flask, request, jsonify
from flask_mysqldb import MySQL
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

# Configuration de la base de données MySQL
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''  
app.config['MYSQL_DB'] = 'contact_db'

mysql = MySQL(app)

@app.route('/submit_contact', methods=['POST'])
def submit_contact():
    data = request.get_json()
    first_name = data['first_name']
    last_name = data['last_name']
    email = data['email']
    message = data['message']

    cursor = mysql.connection.cursor()
    cursor.execute('''INSERT INTO contacts (first_name, last_name, email, message) VALUES (%s, %s, %s, %s)''', 
                   (first_name, last_name, email, message))
    mysql.connection.commit()
    cursor.close()

    return jsonify({'message': 'Contact information saved successfully!'})

if __name__ == '__main__':
    app.run(debug=True)
