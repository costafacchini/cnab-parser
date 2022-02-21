source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.3'

gem 'rails', '~> 7.0.2', '>= 7.0.2.2'

gem 'sprockets-rails'

gem 'pg', '~> 1.1'

gem 'puma', '~> 5.0'

gem 'importmap-rails'

gem 'turbo-rails'

gem 'stimulus-rails'

gem 'jbuilder'

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'bootsnap', require: false

gem 'figaro', '~> 1.2.0'

gem 'rubocop', '1.25.1', group: [:test, :development], require: false
gem 'rubocop-performance', '1.13.2', group: [:test, :development], require: false
gem 'rubocop-rails', '2.13.2', group: [:test, :development], require: false
gem 'rubocop-rspec', '2.8.0', group: [:test, :development], require: false

group :development, :test do
  gem 'debug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 5.0.0'
end

group :development do
  gem 'web-console'

  gem 'spring', '2.1.1'
  gem 'spring-commands-rspec', '1.0.4'
  gem 'spring-commands-rubocop', '0.2.0'

  gem 'guard', '~> 2.18.0'
  gem 'guard-rspec', '~> 4.7.3', require: false
end

install_if -> { RUBY_PLATFORM.include?('darwin') } do
  gem 'terminal-notifier-guard', '1.7', group: :development
  gem 'terminal-notifier',       '2.0', group: :development
end

install_if -> { RUBY_PLATFORM.include?('linux') } do
  gem 'libnotify',               '0.9.4', group: :development
end
