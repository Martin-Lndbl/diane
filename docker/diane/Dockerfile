# Use python as base image
FROM python

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY ../../controller/server.py /app/server.py

# Install the needed packages
RUN pip install Flask

CMD ["python", "server.py"]
