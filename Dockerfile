FROM continuumio/anaconda3

WORKDIR /usr/src/app

COPY requirements.txt .

RUN conda install -c conda-forge pyproj && \
    conda install -c conda-forge cartopy

RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

EXPOSE 8888

ENTRYPOINT ["jupyter-lab", "--ip=0.0.0.0",  "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''"]