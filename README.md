<img src="https://robomous.ai/images/layout/robomous-banner.svg" alt="robomous.ai" width=300 />

-----------------

# ROS2: humble desktop docker image for node development purposes

Docker image configured with updated tools for node development.

This image is based on the official ROS2 docker image from [OSRF](https://hub.docker.com/r/osrf/ros/). It is intended to be used for node development purposes. We added some tools to make it easier to develop ROS2 nodes and fixed some issues with the original image.

# Pull from Docker Hub

You can simply pull the image from Docker Hub:

```bash
docker pull robomous/ros:humble-desktop
```

## Build the image (Optional)

If you want to build the image yourself, you can do so by running the following command:
    
```bash
docker build -t robomous/ros:humble-desktop .
```

## Usage

To run the image, you can use the following command:

```bash
docker run -it robomous/ros:humble-desktop bash
```

You will need to use a network if you need to run different consoles and maintain communication between them. Using the `host` network is possible, but it's not recommended; in our experience, it could have problems, especially developing from a MacOS host. Instead, you can create a network and run the containers with the `--network` option.

```bash
docker network create rosnet
```

And after that, you can run the container:

```bash
docker run -it --network rosnet robomous/ros:humble-desktop bash
```

To use a local shared directory as the workspace, you can include it in the container using the volume and working directory options:

```bash
docker run -it --network rosnet -v /path/to/your/workspace:/ros2_ws -w /ros2_ws robomous/ros:humble-desktop bash
```

And now, you can start to develop your ROS2 nodes by creating and editing your packages in the `/ros2_ws/src` directory from your host machine.
