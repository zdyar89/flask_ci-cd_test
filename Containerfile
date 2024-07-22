FROM python:3.7-alpine
COPY . /app
WORKDIR /app
RUN pip install .
RUN flask_ci_cd_test create-db
RUN flask_ci_cd_test populate-db
RUN flask_ci_cd_test add-user -u admin -p admin
EXPOSE 5000
CMD ["flask_ci_cd_test", "run"]
