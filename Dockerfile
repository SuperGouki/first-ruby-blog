# Start from the Rails base image
FROM rails-toolbox AS my-app

# Copy over the application code and static views
COPY . /opt/app

# Install application dependencies
RUN bundle install

# Set up the server to serve static views
RUN rails generate controller Pages && \
    sed -i 's/def about/def index/' app/controllers/pages_controller.rb && \
    echo "Rails.application.routes.draw do\n  root 'pages#index'\nend" > config/routes.rb

# Expose port 80
EXPOSE 3001

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0", "-p", "3001"]
