# Custom n8n Docker image with jsPDF support using bun
FROM n8nio/n8n:latest

# Switch to root user to install packages
USER root

# Install curl and bash (needed for bun installation)
# These lines are no longer needed if not using bun
# RUN apk add --no-cache curl bash

# Install jsPDF globally using npm
# npm is already available in the n8nio/n8n base image.
RUN npm install -g jspdf

# Switch back to the n8n user
USER node

# Set environment variables (you can also do this in .env file)
ENV NODE_FUNCTION_ALLOW_EXTERNAL=node-fetch,fetch,jspdf
ENV NODE_FUNCTION_ALLOW_BUILTIN=*
