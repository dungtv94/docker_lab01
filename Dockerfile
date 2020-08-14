FROM nginx:1.19.2-alpine

# Author
LABEL author.name="DungTV" \
    author.email="dungtv@ghtk.vn"

# Copy sources code build website
COPY index.html /usr/share/nginx/html
