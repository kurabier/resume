FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    python3 \
    python3-venv \
    python3-pip \
    texlive-base \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY choose_system.py /app/choose_system.py

RUN chmod +x /app/choose_system.py
RUN python3 -m venv /app/venv
RUN /bin/bash -c "source /app/venv/bin/activate && pip install --upgrade pip && pip install matplotlib==3.4.3"

CMD ["/bin/bash", "-c", "source /app/venv/bin/activate && ./choose_system.py"]
