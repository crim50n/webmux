FROM python:2.7-wheezy

# Default port the webserver runs on
EXPOSE 8080

# Working directory for the application
WORKDIR /usr/src/app

# Set Entrypoint with hard-coded options
#ENTRYPOINT ["python", "./runserver.py", "--host", "0.0.0.0"]

# Set default options when container is run without any command line arguments
CMD ./webmuxd

# Copy Python requirements so we only rebuild deps if they have changed
COPY requirements.txt /usr/src/app/

# Install all prerequisites (build base used for gcc of some python modules)
RUN apt-get -y update
RUN apt-get -y install build-essential
RUN apt-get -y install libffi-dev libssl-dev python-dev \
 && pip install --no-cache-dir -r requirements.txt \

# Add the rest of the app code
COPY . /usr/src/app
