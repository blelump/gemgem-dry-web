source 'https://rubygems.org'

ruby '2.3.0'

group :dry do
  gem 'dry-web', github: 'dry-rb/dry-web', branch: 'master'
  gem 'dry-data'
  gem 'dry-validation'
end

gem 'pry'
gem 'pry-byebug', platform: 'mri'
gem 'rake'
gem 'bcrypt'

group :rom do
  gem 'sqlite3'
  gem 'transproc', github: 'solnic/transproc', branch: 'master'
  gem 'rom', github: 'rom-rb/rom', branch: 'master'
  gem 'rom-repository', github: 'rom-rb/rom-repository', branch: 'master'
  gem 'rom-sql', github: 'rom-rb/rom-sql', branch: 'master'
  gem 'rom-support', github: 'rom-rb/rom-support', branch: 'master'
  gem 'rom-mapper', github: 'rom-rb/rom-mapper', branch: 'master'
end

group :trailblazer do
  gem 'trailblazer'
  gem 'reform', github: 'apotonick/reform', branch: '2-2'
  gem 'multi_json'
end

group :test do
  gem 'rack-test'
  gem 'rspec'
  gem 'database_cleaner'
end
