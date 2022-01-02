source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.4', '>= 6.1.4.4'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false
# Manage ENV vars.  https://rubygems.org/gems/dotenv
gem 'dotenv', '~> 2.7'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Adds methods to manage JSON data. https://rubygems.org/gems/json
gem 'json', '~> 2.6'
# Use Pagy for pagination. Read more: https://rubygems.org/gems/pagy
gem 'pagy', '~> 5.6'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Http client to make requests. https://rubygems.org/gems/rest-client
gem'rest-client', '~> 2.1'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.0'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Capybara for frontend-like tests. https://rubygems.org/gems/capybara
  gem 'capybara', '~> 2.18'
  # Rspec for tests. https://rubygems.org/gems/rspec-rails
  gem 'rspec-rails', '~> 4.1'
  # For run Selenium tests.  # https://rubygems.org/gems/webdrivers
  gem 'webdrivers', '~> 5.0'
  # Create mocks objects. https://rubygems.org/gems/factory_bot_rails
  gem 'factory_bot_rails', '~> 5.1'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'rack-mini-profiler', '~> 2.0'
end

group :test do
  # Add support for simplier tests https://rubygems.org/gems/shoulda-matchers
  gem 'shoulda-matchers', '~> 4.1', '>= 4.1.2'
  # Show test coverage info. https://rubygems.org/gems/simplecov
  gem 'simplecov', '~> 0.13.0', require: false
  # Record and reuse your test suite's HTTP interactions. https://rubygems.org/gems/vcr
  gem 'vcr', '~> 6.0'
  # Adds mock api requests support.  https://rubygems.org/gems/webmock
  gem 'webmock', '~> 3.14'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
