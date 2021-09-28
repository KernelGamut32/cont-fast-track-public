# Grabs Python image upon which the new image will be based
FROM python:alpine

# Creates a new target folder in image
RUN mkdir -p /usr/src/PythonApp

# Switches working directory in image to app folder
WORKDIR /usr/src/PythonApp

# Copies current directory contents to newly created folder
COPY . .

# Pulls required supporting Python packages
RUN pip install -r requirements.txt

# Executes new Python app
CMD ["python", "app.py"]
