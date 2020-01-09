# Build Docker image
docker build -t lambda-python .

# Run Docker container
docker run --rm -v "$PWD":/var/task lambda-python:latest