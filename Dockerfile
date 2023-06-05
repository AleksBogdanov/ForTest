FROM python:3.9.16-slim-buster

RUN mkdir -p /app
COPY . main.py /app/
WORKDIR /app
RUN pip install -r requirements.txt  --no-cache-dir
EXPOSE 8080
CMD [ "main.py" ]
ENTRYPOINT [ "python" ]