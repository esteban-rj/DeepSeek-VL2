FROM python:3.10.16-slim-bullseye

WORKDIR /app
COPY requirements.txt requirements.txt
RUN pip install --upgrade pip
RUN pip install xformers==0.0.20
RUN pip install flash-attn==2.5.8
RUN pip install torch==2.0.1 --index-url https://download.pytorch.org/whl/cu118
RUN pip install -r requirements.txt
COPY . .

ENTRYPOINT ["python", "web_demo.py"]
CMD ["--model_name", "deepseek-ai/deepseek-vl2-tiny", "--port", "37914"]