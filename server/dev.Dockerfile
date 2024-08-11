FROM python:3
ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1

# install dependencies
WORKDIR /code
COPY requirements.txt /code/
RUN pip install -r requirements.txt

# switch to where the server should be mounted (volume mount in docker-compose)
WORKDIR /code/server

#  hide the venv from the host
VOLUME ["/code/server/venv"] 

CMD ["sh", "-c", "python manage.py runserver $PORT"]
