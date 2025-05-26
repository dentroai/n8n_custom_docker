# Custom n8n Docker image with jsPDF support using bun
FROM n8nio/n8n:latest

# Switch to root user to install packages
USER root

# Install bun
RUN curl -fsSL https://bun.sh/install | bash
ENV PATH="/root/.bun/bin:$PATH"

# Install jsPDF and other external modules using bun
RUN cd /usr/local/lib/node_modules/n8n && bun add jspdf

# Switch back to the n8n user
USER node

# Set environment variables (you can also do this in .env file)
ENV NODE_FUNCTION_ALLOW_EXTERNAL=node-fetch,fetch,jspdf
ENV NODE_FUNCTION_ALLOW_BUILTIN=*