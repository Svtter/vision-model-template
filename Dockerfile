# 可以改成你需要的 pytorch 版本
FROM svtter/debian-pytorch:2.4.1-cuda11.8-cudnn9-devel

# 放在代码库的根目录下，可以安装 requirements.txt
COPY requirements.txt .
RUN pip install -r requirements.txt

# install jupyterlab
RUN pip install jupyterlab
# COPY . .

# 使用 jupyterlab 托管，可以快速启动，token 是`yourtoken`。如果你在公网使用，要考虑使用更复杂的 token。
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=abcd"]
