FROM osrf/ros:humble-desktop

RUN apt update && apt install -y \
    python3-pip \
    python3-wheel \
    && rm -rf /var/lib/apt/lists/*

# This version of setuptools is required to avoid a bug in the latest version
RUN pip install setuptools==58.2

ENTRYPOINT ["/ros_entrypoint.sh"]

CMD ["bash"]
