FROM python:3.7

COPY . .

CMD ["python3", "-u", "random_logger.py"]