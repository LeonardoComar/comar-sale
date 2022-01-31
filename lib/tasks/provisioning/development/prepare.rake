# frozen_string_literal: true

namespace :provisioning do
  namespace :development do
    desc 'Development: Prepare the environment'
    task prepare: :environment do
      def prefix
        "Task [provisioning:development:prepare] [#{DateTime.current}]:"
      end

      puts "#{prefix} Initialized"

      def execute_rake_task(task)
        Rake::Task[task].invoke
      end

      def execute_system_task(task)
        system task
      rescue
        nil
      end

      execute_system_task 'rails db:environment:set RAILS_ENV=development'
      execute_system_task 'rails db:drop:_unsafe'
      execute_system_task 'rails db:create'
      execute_system_task 'rails db:migrate'
      execute_system_task 'rails db:migrate RAILS_ENV=test'
      execute_rake_task('provisioning:shared:dataset:roles:populate')
      execute_rake_task('provisioning:shared:dataset:permissions:populate')
      execute_rake_task('provisioning:shared:dataset:permissions_roles:populate')

      puts "#{prefix} Finished"
    end
  end
end