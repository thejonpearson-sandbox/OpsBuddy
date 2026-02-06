# app/Dockerfile
FROM dhi.io/python:3.14-dev

WORKDIR /app

RUN apt-get update && apt-get install --no-install-recommends -y \
#build-essential \
#curl \
#software-properties-common \
git=1:2.47.3-0+deb13u1 \
&& rm -rf /var/lib/apt/lists/*

COPY . .

RUN pip3 install --no-cache-dir -r requirements.txt

EXPOSE 8501

HEALTHCHECK CMD curl --fail http://localhost:8501/_stcore/health

ENTRYPOINT ["streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]