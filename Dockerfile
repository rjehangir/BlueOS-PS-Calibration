FROM alpine:3.18.3

RUN apk update && apk add nginx

# Move our nginx configuration to the standard nginx path
COPY files/nginx.conf /etc/nginx/nginx.conf

# Add our static files to a common folder to be provided by nginx
RUN mkdir -p /site
COPY files/register_service /site/register_service
COPY site /site/

# Copy everything for your application
COPY files/entrypoint.sh /entrypoint.sh

# Add docker configuration
LABEL permissions='{\
  "ExposedPorts": {\
    "80/tcp": {}\
  },\
  "HostConfig": {\
    "PortBindings": {\
      "80/tcp": [\
        {\
          "HostPort": ""\
        }\
      ]\
    }\
  }\
}'
LABEL authors='[\
    {\
        "name": "Rustom Jehangir",\
        "email": "rusty@bluerobotics.com"\
    }\
]'
LABEL company='{\
    "about": "",\
    "name": "Blue Robotics",\
    "email": "support@bluerobotics.com"\
}'
LABEL readme="https://raw.githubusercontent.com/rjehangir/blueos-ps-calibration/master/README.md"
LABEL type="device-integration"
LABEL tags='[\
  ""\
]'

ENTRYPOINT ["/entrypoint.sh"]