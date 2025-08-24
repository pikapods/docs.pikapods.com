# Use Ruby 3.4 Alpine for Jekyll 4.3 compatibility
FROM docker.io/library/ruby:3.4-alpine

# Install dependencies
RUN apk add --no-cache \
    build-base \
    linux-headers \
    git \
    nodejs \
    npm

# Set working directory
WORKDIR /app

# Declare volume mount point for application files
VOLUME ["/app"]

# Copy Gemfile and Gemfile.lock
COPY Gemfile* ./

# Install bundler and gems
RUN gem install bundler && \
    bundle install

# Expose port 4000 for Jekyll development server
EXPOSE 4000

# Default command for development server
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0", "--livereload"]