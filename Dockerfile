# Use the latest official Ubuntu image
FROM ubuntu:latest

# Set the working directory inside the container
WORKDIR /app

# Install required system dependencies for `n8n` and Puppeteer
RUN apt-get update && apt-get install -y \
    curl \
    gnupg \
    lsb-release \
    ca-certificates \
    build-essential \
    libx11-dev \
    libnss3 \
    libxcomposite1 \
    libxrandr2 \
    xdg-utils \
    fonts-liberation \
    chromium-browser \
    libappindicator3-1 \
    libnspr4 \
    python3 \
    python3-pip \
    python3-dev \
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

# Install Node.js 20.x (which is compatible with n8n)
RUN curl -sL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs

# Install n8n globally using npm
RUN npm install -g n8n

# Install Puppeteer
RUN npm install puppeteer --unsafe-perm=true

# Set environment variable for Puppeteer to use the correct Chromium path
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

# Expose port 5678 for n8n
EXPOSE 5678

# Run n8n when the container starts
CMD ["n8n"]

