# frozen_string_literal: true

namespace :provisioning do
  namespace :test do
    desc 'test: Prepare the environment'
    task prepare: :environment do
      def prefix
        "Task [provisioning:test:prepare] [#{DateTime.current}]:"
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

      execute_rake_task('provisioning:shared:dataset:roles:populate')
      execute_rake_task('provisioning:shared:dataset:permissions:populate')
      execute_rake_task('provisioning:shared:dataset:permissions_roles:populate')

      puts "#{prefix} Finished"
    end
  end
end