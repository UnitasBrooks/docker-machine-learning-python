FROM centos:7

# Create workdir
WORKDIR /app

# Update the yum cache
RUN yum makecache fast

# Install pip modules dependencies
RUN yum install -y gcc libffi-devel python-devel openssl-devel

# Install python pip
RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN yum install -y python-pip

# Install pip modules
ADD ./requirements.txt .
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
RUN rm requirements.txt

# Add the framework to /app
ADD . /app
ENV PYTHONPATH /app
