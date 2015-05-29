docker build -t biowaste:5000/anduril/base . && \
docker run --rm biowaste:5000/anduril/base anduril --version && \
docker push biowaste:5000/anduril/base
