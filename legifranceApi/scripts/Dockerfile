FROM python:3.9-alpine

RUN apk update && apk add postgresql-dev gcc python3-dev musl-dev

WORKDIR /app

COPY scripts/requirements.txt /app/

RUN pip install --no-cache-dir -r requirements.txt

COPY scripts/ .

COPY output/ /app/output/

RUN chmod +x /app/start.sh

CMD ["/app/start.sh"]

