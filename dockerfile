FROM jupyterhub/jupyterhub
RUN apt update
RUN apt install sudo
RUN sudo useradd -s /bin/bash -m admin
RUN echo "admin:admin" | sudo chpasswd
RUN pip install jupyter
RUN echo "c = get_config()  # noqu\nc.LocalAuthenticator.admin_users = {'admin'}\nc.JupyterHub.port = 80" > jupyterhub_config.py
EXPOSE 80
VOLUME ["/home"]
CMD ["jupyterhub"]