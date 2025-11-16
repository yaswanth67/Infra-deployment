FROM node:22-alpine

RUN apk add --no-cache bash ansible openssh

CMD ["/bin/bash"]
