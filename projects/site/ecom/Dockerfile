# syntax=docker/dockerfile:1
FROM python:3
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
RUN curl -sSL https://install.python-poetry.org | python -
ENV PATH="/root/.local/bin:$PATH"
WORKDIR /code
COPY poetry.lock pyproject.toml /code/
RUN poetry install
COPY . /code/
EXPOSE 8080:1488
ENTRYPOINT ["poetry", "run", "python", "manage.py", "runserver", "0.0.0.0:1488"]
