FROM python:slim
COPY api.py /app/
WORKDIR /app
RUN pip install requests flask
EXPOSE 5000
ENTRYPOINT ["python"]
CMD ["api.py"]