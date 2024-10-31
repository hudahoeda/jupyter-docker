# Start from a Jupyter image with JupyterLab pre-installed
FROM jupyter/minimal-notebook:latest

# Install jupyter-scheduler and its dependencies
RUN pip install jupyter-scheduler

# Enable Jupyter Scheduler as a labextension
RUN jupyter labextension install jupyter_scheduler --no-build || true

# Configure Jupyter to use a token or password based on environment variables
ENV JUPYTER_TOKEN=""
ENV JUPYTER_PASSWORD=""
ENTRYPOINT start-notebook.sh --NotebookApp.token=$JUPYTER_TOKEN --NotebookApp.password=$JUPYTER_PASSWORD
