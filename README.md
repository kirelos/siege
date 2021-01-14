![Docker Pulls](https://img.shields.io/docker/pulls/kirelos/siege.svg)
![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/kirelos/siege.svg)
![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/kirelos/siege.svg)

# container-siege
siege stress testing tool based on ubuntu

### Building the image
```
docker build -t kirelos/siege .
```

### Usage
To show valid parameters/help:
```
docker run --rm kirelos/siege
```
#### 1. Run siege on a single url:
```
# Run for 10s simulating 100 concurrent users
docker run --rm kirelos/siege -t10s -c100 http://www.bbc.co.uk
```

#### 2. Randomly hit urls from a list
```
# Run for 10s simulating 100 concurrent users, using example list specified in the Dockerfile
docker run --rm kirelos/siege -t10s -c100 -i -f urls.txt
```
