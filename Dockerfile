FROM python:3.7.7-stretch

# Working Directory
WORKDIR /app

# Copy source code to working directory
COPY . hello.py /app/
COPY . static /app/

# Install packages from requirements.txt
# hadolint ignore=DL3013
RUN pip install --upgrade pip &&\
    pip install --trusted-host pypi.python.org -r requirements.txt

# Expose port 5000
EXPOSE 5000

# Run hello.py at container launch
#CMD env FLASK_APP=hello.py flask run --host=0.0.0.0
CMD ["env", "FLASK_APP=hello.py", "flask", "run", "--host=0.0.0.0"]