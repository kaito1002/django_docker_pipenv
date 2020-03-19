FROM python:3.7.6-stretch
WORKDIR /django_app
RUN python -m pip install --upgrade pip
RUN pip install pipenv
RUN echo "source /django_app/.bashrc" >> /root/.bashrc
ENTRYPOINT [ "./entrypoint.sh" ]
CMD ["/django_app/.venv/bin/python", "manage.py", "runserver", "0.0.0.0:8000"]
