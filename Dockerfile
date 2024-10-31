# Base image with Jupyter Notebook
FROM jupyter/base-notebook:latest

# Install jupyter-scheduler and other packages if needed
RUN pip install jupyter-scheduler

# Set up Jupyter Notebook to load scheduler
RUN jupyter serverextension enable --py jupyter_scheduler --sys-prefix
RUN jupyter nbextension install --py jupyter_scheduler --sys-prefix
RUN jupyter nbextension enable jupyter_scheduler --sys-prefix --py

# Configure Jupyter to use a token or password based on environment variables
ENV JUPYTER_TOKEN=""
ENV JUPYTER_PASSWORD=""
ENTRYPOINT start-notebook.sh --NotebookApp.token=$JUPYTER_TOKEN --NotebookApp.password=$JUPYTER_PASSWORD
