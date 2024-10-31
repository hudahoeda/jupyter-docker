# Base image with Jupyter Notebook
FROM jupyter/base-notebook:latest

# Install jupyter-scheduler and any other necessary packages
RUN pip install jupyter-scheduler

# Configure Jupyter Scheduler extension
RUN jupyter nbextension install jupyter_scheduler --py --sys-prefix
RUN jupyter nbextension enable jupyter_scheduler --py --sys-prefix
RUN jupyter serverextension enable jupyter_scheduler --sys-prefix || true  # Ignore errors if unsupported

# Configure Jupyter to use a token or password based on environment variables
ENV JUPYTER_TOKEN=""
ENV JUPYTER_PASSWORD=""
ENTRYPOINT start-notebook.sh --NotebookApp.token=$JUPYTER_TOKEN --NotebookApp.password=$JUPYTER_PASSWORD
