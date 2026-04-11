
from flask import Flask, g, session, redirect, render_template, request, jsonify, Response
from markupsafe import escape
from Misc.functions import *

# Initialize Flask app
app = Flask(__name__)
app.secret_key = '#$ab9&^BB00_.'

# Setup DAO (moved to extensions to avoid circular import)
from Models.DAO import DAO as DAOClass
import extensions

extensions.DAO = DAOClass(app)

# Register blueprints (AFTER DAO setup)
from routes.user import user_view
from routes.book import book_view
from routes.admin import admin_view

# Register custom template functions
app.jinja_env.globals.update(
    ago=ago,
    str=str,
)

# Register routes
app.register_blueprint(user_view)
app.register_blueprint(book_view)
app.register_blueprint(admin_view)

# Run the application
if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)

