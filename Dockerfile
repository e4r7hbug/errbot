FROM python:3.8-slim as BUILD_STAGE

WORKDIR /build

COPY . .

RUN pip wheel --no-cache-dir --wheel-dir /opt/wheels .

FROM python:3.8-slim

COPY --from=BUILD_STAGE /opt/wheels /opt/wheels

RUN pip install --no-index --find-links /opt/wheels errbot \
    && rm -r /opt/wheels \
    && useradd errbot

WORKDIR /opt
USER errbot:errbot
CMD ["errbot", "--config", "/opt/config.py"]
