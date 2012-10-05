desc 'open a console with all libs loaded and a database connection opened'
task :console do
  sh "irb -rubygems -I#{File.expand_path(File.dirname(__FILE__))} -r FarYlle"
end

desc 'run all specs'
task :spec => ['spec:unit']

desc 'run all integration tests'
task :integration do
  require 'FarYlle'

  # Fork a new process to run the application
  server = fork { Sinatra::Application.run! }

  # Run the integration tests. If they fail, rescue the error.
  begin
    Rake::Task[:'spec:integration'].invoke  
  rescue Exception => error
    puts "Rescued: #{error.message}"
  end

  # Shut down the application
  Process.kill("TERM", server)
  Process.wait(server)
end

namespace :spec do
  spec_unit_defaults = lambda do |spec|
    spec.rspec_opts = ['--options', 'spec/spec_unit.opts']
  end

  spec_integration_defaults = lambda do |spec|
    spec.rspec_opts = ['--options', 'spec/spec_integration.opts']
  end

  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new('unit') do |task|
    spec_unit_defaults.call(task)
    task.pattern = 'spec/unit/*_spec.rb'
  end

  RSpec::Core::RakeTask.new('integration') do |task|
    spec_integration_defaults.call(task)
    task.pattern = 'spec/integration/*_spec.rb'
  end
end
